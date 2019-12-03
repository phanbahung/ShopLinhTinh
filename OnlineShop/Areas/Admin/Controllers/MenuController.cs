using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class MenuController : Controller
    {
        // GET: Admin/Menu
       

        public ActionResult Index()
        {
            MenuDao dao = new MenuDao();
            return View(dao.ListAll());
        }

        public ActionResult Edit(int id)
        {
            MenuDao dao = new MenuDao();
            return View(dao.ViewDetails(id));
        }

        [HttpPost]
        public ActionResult Edit(Menu entity)
        {
            var dao = new MenuDao();
            dao.Update(entity);
            return View(entity);
        }
    }
}