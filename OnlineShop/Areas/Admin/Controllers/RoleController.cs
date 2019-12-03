using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class RoleController : BaseController
    {
        // GET: Admin/Role
        [HasCredential(RoleID = "ROLE_VIEW")]
        public ActionResult Index()
        {
            var dao = new RoleDao();
            var model = dao.ListAll();            
            return View(model);
        }



    }
}