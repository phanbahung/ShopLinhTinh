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
    public class ProductController : BaseController
    {

        // GET: Admin/Product    
        [HasCredential(RoleID = "PRODUCT_VIEW")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductDao();
            var model = dao.ListAll_Product_Paging(searchString, page, pageSize);

            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HttpGet]
        [HasCredential(RoleID = "PRODUCT_ADD")]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        [HttpPost]
        [HasCredential(RoleID = "PRODUCT_ADD")]
        public ActionResult Create(Product product)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDao();           

                long id = dao.Insert(product);
                if (id > 0)
                {
                    SetAlert("Thêm sản phẩm thành công", "success");
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm sản phẩm không thành công");
                }
            }
            return View("Index");
        }

        [HasCredential(RoleID = "PRODUCT_EDIT")]
        public ActionResult Edit(int id)
        {
            var product = new ProductDao().ViewDetail(id);                        
            SetViewBag(product.CategoryID);
            return View(product);
        }     


        [HttpPost]
        [ValidateInput(false)]
        [HasCredential(RoleID = "PRODUCT_EDIT")]
        public ActionResult Edit(Product product)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDao();          
                
                var result = dao.Update(product);
                if (result)
                {
                    SetAlert("Cập nhật sản phẩm thành công", "success");
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật sản phẩm không thành công");
                }
            }
            return View("Index");
        }

        [HttpDelete]
        [HasCredential(RoleID = "PRODUCT_DELETE")]
        public ActionResult Delete(int id)
        {
            new ProductDao().Delete(id);
            return RedirectToAction("Index");
        }


        public JsonResult LoadImages(long id)
        {
            ProductDao dao = new ProductDao();
            var product = dao.ViewDetail(id);
            var images = product.MoreImages;
            XElement xImages = XElement.Parse(images);
            List<string> listImagesReturn = new List<string>();

            foreach (XElement element in xImages.Elements())
            {
                listImagesReturn.Add(element.Value);
            }
            return Json(new
            {
                data = listImagesReturn
            }, JsonRequestBehavior.AllowGet);
        }


       

        public JsonResult SaveImages(long id, string images)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            var listImages = serializer.Deserialize<List<string>>(images);

            XElement xElement = new XElement("Images");

            foreach (var item in listImages)
            {
                //var subStringItem = item.Substring(21);
                //xElement.Add(new XElement("Image", subStringItem));
                xElement.Add(new XElement("Image", item));
            }
            ProductDao dao = new ProductDao();
           // try
            //{
                dao.UpdateImages(id, xElement.ToString());
                return Json(new
                {
                    status = true
                });
           // }
            //catch (Exception ex)
            //{
            //    return Json(new
            //    {
            //        status = false
            //    });
            //}
        }

        public void SetViewBag(long? selectedId = null)
        {
            var dao = new ProductCategoryDao();
            ViewBag.CategoryID = new SelectList(dao.ListAll(), "ID", "Name", selectedId);
        }
    }
}