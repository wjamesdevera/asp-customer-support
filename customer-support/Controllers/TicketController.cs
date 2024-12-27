using customer_support.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace customer_support.Controllers
{
    [RoutePrefix("api/ticket")]
    public class TicketController : ApiController
    {

        public IHttpActionResult Get()
        {
            using (var db = new TicketDbContext())
            {
                var tickets = (from ticket in db.Tickets
                              join user in db.Users on ticket.UserId equals user.Id
                              orderby ticket.CreatedAt descending
                              select new
                              {
                                  id = ticket.Id,
                                  author = user.FirstName + " " + user.LastName,
                                  title = ticket.Title,
                                  description = ticket.Description,
                                  createdAt = ticket.CreatedAt,
                              }).ToList();
                return Ok(new { tickets = tickets });
            }
        }

        [HttpGet]
        [Route("{id}")]
        public IHttpActionResult GetTicket(int id)
        {
            using (var db = new TicketDbContext())
            {
                var ticket = db.Tickets.Where(x => x.Id == id).FirstOrDefault();
                if (ticket == null)
                {
                    return NotFound();
                }
                return Ok(ticket);
            }
        }
        

        [HttpPost]
        public IHttpActionResult Post([FromBody] TicketModel ticket)
        {
            using (var db = new TicketDbContext())
            {
                if (ticket == null)
                {
                    return BadRequest();
                }
                TicketModel newTicket = new TicketModel {
                    Title = ticket.Title,
                    UserId = ticket.UserId,
                    Description = ticket.Description,
                    CreatedAt = DateTime.Now,
                    UpdatedAt = DateTime.Now
                };
                var dbTicket = db.Tickets.Add(newTicket);
                db.SaveChanges();
                return Ok(dbTicket);
            }
        }

        [HttpDelete]
        [Route("{id}")]
        public IHttpActionResult Delete(int id)
        {
            using (var db = new TicketDbContext())
            {
               var ticket = db.Tickets.Where(x => x.Id == id).FirstOrDefault();
                db.Tickets.Remove(ticket);
                db.SaveChanges();
            }
            return Ok();
        }

        [HttpPatch]
        [Route("{id}")]
        public IHttpActionResult Patch([FromBody] TicketModel ticket)
        {
            using (var db = new TicketDbContext())
            {
            }
            return Ok();
        }
    }
}
