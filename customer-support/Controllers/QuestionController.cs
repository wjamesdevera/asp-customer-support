using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace customer_support.Controllers
{
    public class QuestionController : Controller
    {
        // GET: Question
        public ActionResult Index(int id)
        {
            ViewBag.ticketId = id;
            return View();
        }
    }
}