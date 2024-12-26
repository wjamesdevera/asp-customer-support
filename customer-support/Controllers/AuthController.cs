using customer_support.Models;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;
using System.Text;
using System.Configuration;
using System.Diagnostics.CodeAnalysis;
using customer_support.Services;
using System.Security.Cryptography;
using System.Web.Helpers;
using Org.BouncyCastle.Crypto.Parameters;

namespace customer_support.Controllers
{
    [RoutePrefix("api/auth")]
    public class AuthController : ApiController
    {


        [HttpGet]
        [Route("")]
        public IHttpActionResult Check()
        {
            return Ok(new { message = "Hello World"});
        }

        [HttpPost]
        [Route("register")]
        public IHttpActionResult Register([FromBody] UserModel user)
        {
            using(var db = new TicketDbContext())
            {
                if (user == null)
                {
                    return BadRequest();
                }
                UserModel newUser = new UserModel
                {
                    FirstName = user.FirstName,
                    LastName = user.LastName,
                    Email = user.Email,
                    Password = hashPassword(user.Password),
                    CreatedAt = DateTime.Now,
                    UpdatedAt = DateTime.Now
                };
                
                var updatedUser = db.Users.Add(newUser);
                db.SaveChanges();
                return Ok(updatedUser);
            }
        }

        [HttpPost]
        [Route("login")]
        public IHttpActionResult Login([FromBody] UserModel loggingUser)
        {
            if (loggingUser == null)
            {
                return BadRequest();
            }
            using (var db = new TicketDbContext())
            {
                var userExists = db.Users.Where(x => x.Email.Equals(loggingUser.Email)).First();
                if (userExists == null)
                {
                    return NotFound();
                }
                if (!Crypto.VerifyHashedPassword(userExists.Password, loggingUser.Password))
                {
                    return Unauthorized();
                }
                return Ok(new { status = "success", data = new { user = userExists.Email, userId = userExists.Id } });
            }
        }

        private string hashPassword(string password)
        {
            var hashedPassword = Crypto.HashPassword(password);

            return hashedPassword;
        }
    }
}
