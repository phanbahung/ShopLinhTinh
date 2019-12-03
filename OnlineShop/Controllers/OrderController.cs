using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
using Model.EF;
using Model.ViewModel;

namespace OnlineShop.Controllers
{
    public class OrderController : Controller
    {   

        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var daoOrder = new OrderDao();
            IEnumerable<OrderModelView> model ;
            var session = (UserLogin)Session[OnlineShop.Common.CommonConstants.USER_SESSION];
            if (session != null)
            {
               model = daoOrder.ListAllPagingByCurrentUser_11(session.UserID, searchString, page, pageSize);               
                ViewBag.SearchString = searchString;
            }
            else return RedirectToAction("Index", "Home");

            return View(model);
        }

        public ActionResult Detail(long id)
        {
            var dao = new OrderDetailDao();
            return View(dao.Detail(id));
        }




    }
}