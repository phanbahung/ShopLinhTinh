using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
using Model.EF;

namespace OnlineShop.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public PartialViewResult ProductCategory()
        {
            var model = new ProductCategoryDao().ListAll();
            return PartialView(model);
        }
        public JsonResult ListName(string q)
        {
            var data = new ProductDao().ListName(q);
            return Json(new
            {
                data = data,
                status = true
            },JsonRequestBehavior.AllowGet);
        }

       


        public ActionResult Category(long cateId, int page = 1, int pageSize =8)
        {
            var proCategory = new ProductCategoryDao().ViewDetail(cateId);
            ViewBag.Category = proCategory;

            int totalRecord = 0;  
            OnlineShopDbContext db = new OnlineShopDbContext();
            totalRecord = db.Products.Where(x => x.CategoryID == cateId).Count();

            var model = new ProductDao().ListByCategoryId(cateId, page, pageSize);

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;           

            int maxPage = 5;
            int totalPage = 0;
            //totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
          
            int du = totalRecord % pageSize;
            int nguyen = (totalRecord - du)/ pageSize;
            if (du > 0)
                totalPage = nguyen + 1;
            else
                totalPage = nguyen;

            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;
         
            return View(model);
        }

        public ActionResult Search(string keyword, int page = 1, int pageSize = 8)
        {
            int totalRecord = 0;
            OnlineShopDbContext db  = new OnlineShopDbContext();
            totalRecord = db.Products.Where(x => x.Name.Contains(keyword)).ToList().Count();

            var model = new ProductDao().Search(keyword, page, pageSize);

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;
            ViewBag.Keyword = keyword;
            ViewBag.ProductDisplay = 8;
            int maxPage = 5;
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }

        [OutputCache(CacheProfile = "Cache1DayForProduct")]
        public ActionResult Detail(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            ViewBag.Category = new ProductCategoryDao().ViewDetail(product.CategoryID.Value);
            ViewBag.RelatedProducts = new ProductDao().ListRelatedProducts(id);
            return View(product);
        }
    }
}