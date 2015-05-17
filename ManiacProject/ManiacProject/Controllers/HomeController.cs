using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ManiacProject.Libs;

namespace ManiacProject.Controllers
{
    public class HomeController : Controller
    {
      
        public ActionResult Index()
        {
            if(Session.Count == 0)
            {
                return RedirectToAction("Index", "Account");
  
            }

            Dictionary<string, string> sessionData = SessionHandler.GetSessionData(Session);
            if (Authentication.Authenticate(sessionData, Session))
            {
                return View();
            }

            return RedirectToAction("Index", "Account");
            
        }

    }
}
