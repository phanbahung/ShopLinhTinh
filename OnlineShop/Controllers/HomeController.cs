using Model.Dao;
using OnlineShop.Common;
using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using Model.EF;

namespace OnlineShop.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index(int page = 1, int pageSize = 8)
        {
            var productDao = new ProductDao();

            //======= SLIDE: liệt kê tát cả các dịch vụ , tạm thời vậy vì ít nên show hết
            ViewBag.Slides = productDao.List_All_Service();
            //ViewBag.Slides = new SlideDao().ListAll();
            
            // ===== CHƯA XÀI
            //ViewBag.ListFeatureProducts = productDao.ListFeatureProduct(4);

            //=== LEFT BOTTOM - 4 ô vuông nhỏ
            ViewBag.ListLeftBottom = productDao.ListNewProduct(4);

            int totalRecord = 0;
            OnlineShopDbContext db = new OnlineShopDbContext();
            totalRecord = db.Products.Count();

            // ====== SẢN PHẨM MỚI (Service = false)
            //var model = new ProductDao().ListAll(page, 8);
            var model = new ProductDao().ListAll_Product(page, 8);
            

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;      

            int maxPage = 5;
            int totalPage = 0;         

            int du = totalRecord % pageSize;
            int nguyen = (totalRecord - du) / pageSize;
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

            // Set SEO title
            SystemConfigDao sysConfigDao = new SystemConfigDao();
            ViewBag.Title = sysConfigDao.Get_SysConfig(CommonConstants.HOME_TITLE);// "Mua bán tổng hợp, hàng độc, hàng hiếm, cho thuê căn hộ Nha Trang";
            ViewBag.Descriptions = sysConfigDao.Get_SysConfig(CommonConstants.HOME_DESCRIPTIONS);//"Mua bán tổng hợp, hàng độc, hàng hiếm, cho thuê căn hộ giá rẻ Nha trang, view biển, gần trung tâm thành phố Nha Trang";
            ViewBag.Keywords = sysConfigDao.Get_SysConfig(CommonConstants.HOME_KEYWORDS);//"mua bán hàng độc lạ, hàng hiếm, thuê căn hộ Nha Trang, view biển";// ko quá 65 ký tự
                        
            return View(model);
        }


        [ChildActionOnly]
        //[OutputCache(Duration = 3600 * 24)]
        public ActionResult MainMenu()
        {
            var model = new MenuDao().ListByGroupId(1);
            return PartialView(model);
        }
        [ChildActionOnly]
        //[OutputCache(Duration = 3600 * 24)]
        public ActionResult TopMenu()
        {
            var model = new MenuDao().ListByGroupId(2);
            return PartialView(model);
        }
        [ChildActionOnly]
        public PartialViewResult HeaderCart()
        {
            var cart = Session[CommonConstants.CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }

            return PartialView(list);
        }
        [ChildActionOnly]
        [OutputCache(Duration = 3600 * 24)]
        public ActionResult Footer()
        {
            var model = new FooterDao().GetFooter();
            return PartialView(model);
        }
    }
}