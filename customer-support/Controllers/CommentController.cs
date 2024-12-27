using customer_support.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace customer_support.Controllers
{
    [RoutePrefix("api/comment")]
    public class CommentController : ApiController
    {

        [HttpGet]
        public IHttpActionResult health()
        {
            return Ok(new { message = "Success" });
        }

        [HttpGet]
        [Route("{ticketId}")]
        public IHttpActionResult Get(int ticketId)
        {
            using (var db = new TicketDbContext())
            {
                var ticket = db.Tickets.Where(x => x.Id == ticketId).FirstOrDefault();

                if (ticket == null) {
                    return NotFound();
                }

                var comments = (from comment in db.Comments
                              join user in db.Users on comment.UserId equals user.Id
                              where comment.TicketId == ticketId
                              select new
                              {
                                  id = comment.Id,
                                  author = user.FirstName + " " + user.LastName,
                                  comment = comment.Comment,
                                  createdAt = ticket.CreatedAt,
                              }).ToList();
                return Ok(new { comments = comments });
            }
        }

        [HttpPost]
        public IHttpActionResult Post([FromBody] CommentModel comment)
        {
            using (var db = new TicketDbContext())
            {
                var newComment = new CommentModel
                {
                    UserId = comment.UserId,
                    TicketId = comment.TicketId,
                    Comment = comment.Comment,
                    CreatedAt = DateTime.Now,
                    UpdatedAt = DateTime.Now
                };

                var dbComment = db.Comments.Add(newComment);
                db.SaveChanges();
                return Ok(dbComment);
            }
        }
    }
}
