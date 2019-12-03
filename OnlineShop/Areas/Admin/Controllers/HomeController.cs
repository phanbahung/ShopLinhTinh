using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            var session = (UserLogin)Session[OnlineShop.Common.CommonConstants.USER_SESSION];
            UserDao dao = new UserDao();
            List<string> listCredentials = new List<string>();
            if (session != null)
            {
                listCredentials = dao.GetListCredential(session.UserName);            }


            return View(listCredentials);
        }

    }
}