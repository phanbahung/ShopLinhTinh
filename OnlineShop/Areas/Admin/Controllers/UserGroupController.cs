using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Xml.Linq;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class UserGroupController : BaseController
    {
        // GET: Admin/UserGroup
        [HasCredential(RoleID = "GROUPUSER_VIEW")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new UserGroupDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);

            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HasCredential(RoleID = "GROUPUSER_EDIT")]
        public ActionResult Edit(string id)
        {
            var user = new UserGroupDao().DetailById(id);
            return View(user);
        }

        [HttpPost]
        [HasCredential(RoleID = "GROUPUSER_EDIT")]        
        public ActionResult Edit(UserGroup entity)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserGroupDao();
                entity.Roles = entity.Roles.Replace(" ","");
                var result = dao.Update(entity);

                if (result)
                {
                    SetAlert("Sửa user thành công", "success");
                    return RedirectToAction("Index", "UserGroup");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật user không thành công");
                }
            }
            return View("Index");
        }
       



    }
}