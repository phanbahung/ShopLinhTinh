using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class OrderController : BaseController
    {       

        [HasCredential(RoleID = "ORDER_VIEW")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new OrderDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }

       // [HasCredential(RoleID = "ORDER_UPDATESTATUS")]
        public ActionResult UpdateStatus(long ID)
        {
            var dao = new OrderDao();
            Order model = dao.Detail(ID);
            return View(model);
        }

        // [HasCredential(RoleID = "ORDER_UPDATESTATUS")]
        [HttpPost]
        public ActionResult UpdateStatus(Order entity)
        {
            var dao = new OrderDao();
            dao.UpdateStatus(entity);
            return View(entity);
        }

        [HasCredential(RoleID = "ORDERDETAIL_VIEW")]
        public ActionResult Detail(long id)
        {
            var daoOrderDetail = new OrderDetailDao();

            return View(daoOrderDetail.Detail(id));
        }
    }
}