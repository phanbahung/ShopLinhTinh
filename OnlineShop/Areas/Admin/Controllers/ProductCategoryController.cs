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
    public class ProductCategoryController : BaseController
    {

        // GET: Admin/ProductCategory
        [HasCredential(RoleID = "PRODUCTCAT_VIEW")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductCategoryDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);

            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HasCredential(RoleID = "PRODUCTCAT_ADD")]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [HasCredential(RoleID = "PRODUCTCAT_ADD")]
        public ActionResult Create(ProductCategory model)
        {
            if (ModelState.IsValid)
            {
                //var currentCulture = Session[CommonConstants.CurrentCulture];
                //model.Language = currentCulture.ToString();
                var id = new ProductCategoryDao().Insert(model);
                if (id > 0)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", StaticResources.Resources.InsertCategoryFailed);
                }
            }
            return View(model);
        }
        [HasCredential(RoleID = "PRODUCTCAT_EDIT")]
        public ActionResult Edit(int id)
        {
            var proCat = new ProductCategoryDao().ViewDetail(id);
            SetViewBag(proCat.ParentID);
            return View(proCat);
        }


        [HttpPost]
        [HasCredential(RoleID = "PRODUCTCAT_EDIT")]
        public ActionResult Edit(ProductCategory productCat)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductCategoryDao();

                var result = dao.Update(productCat);
                if (result)
                {
                    SetAlert("Sửa DM sản phẩm thành công", "success");
                    return RedirectToAction("Index", "ProductCategory");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật DM sản phẩm không thành công/phải xóa sản phẩm của loại này trước");
                }
            }
            return View("Index");
        }


        [HttpDelete]
        [HasCredential(RoleID = "PRODUCTCAT_DELETE")]
        public ActionResult Delete(int id)
        {
            new ProductCategoryDao().Delete(id);
            return RedirectToAction("Index");
        }

        public void SetViewBag(long? selectedId = null)
        {
            var dao = new ProductCategoryDao();
            ViewBag.ParentID = new SelectList(dao.ListAll(), "ID", "Name", selectedId);
        }




    }
}