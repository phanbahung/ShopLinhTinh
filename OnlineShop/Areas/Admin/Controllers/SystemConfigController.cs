using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class SystemConfigController : Controller
    {
        // GET: Admin/SystemConfig
        public ActionResult Index()
        {
            SystemConfigDao dao = new SystemConfigDao();
            return View(dao.ListAll());
        }

        public ActionResult Edit(int id)
        {
            SystemConfigDao dao = new SystemConfigDao();
            return View(dao.ViewDetails(id));
        }

        [HttpPost]
        public ActionResult Edit(SystemConfig entity)
        {
            var dao = new SystemConfigDao();
            dao.Update(entity);
            return View(entity);
        }

    }
}