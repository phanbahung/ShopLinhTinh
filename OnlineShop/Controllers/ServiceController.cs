using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.ViewModel;
using System.Configuration;
using Common;
using System.Xml.Linq;

namespace OnlineShop.Controllers
{
    public class ServiceController : Controller
    {
        // GET: Service
        public ActionResult Index_NotInUse(int page = 1, int pageSize = 8)
        {
          
            var productDao = new ProductDao();           

            int totalRecord = 0;
            OnlineShopDbContext db = new OnlineShopDbContext();
            totalRecord = db.Products.Count();

            var model = new ProductDao().ListAll_Service_Paging("",page, 8);

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

            return View(model);
        }


      public ActionResult Book(long productId)        
        {            
            BookDetailViewModel bookDetail = new BookDetailViewModel();

            ProductDao dao = new ProductDao();
            Product model  = dao.ViewDetail(productId);
            bookDetail.ServiceName = model.Name;
            bookDetail.Detail = model.Detail;
            bookDetail.Description = model.Description;
            bookDetail.Price = model.Price;
            bookDetail.Adult = 0;
            bookDetail.Children = 0;
            bookDetail.Code = model.Code;
            bookDetail.FromDate = DateTime.Now;
            bookDetail.ToDate = null;
            bookDetail.Notes = "";

            // Contact
            var session = (UserLogin)Session[OnlineShop.Common.CommonConstants.USER_SESSION];
            User loginedUser = new User();
            if (session != null)
            {
                loginedUser = new UserDao().GetByUserName(session.UserName);
                bookDetail.ShipName = loginedUser.Name;
                bookDetail.ShipEmail = loginedUser.Email;
                bookDetail.CustomerID = loginedUser.ID;
                bookDetail.ShipMobile = loginedUser.Phone;
            }
            else
            {
                bookDetail.ShipName = "";
                bookDetail.ShipEmail = "";
                bookDetail.CustomerID = null;
                bookDetail.ShipMobile = "";
                bookDetail.ShipName = "";
            }
            // Get MoreImage
            ViewBag.ListImages = LoadImages_ReturnListString(productId);
            ViewBag.Detail =bookDetail.Detail;
            ViewBag.Description = bookDetail.Description;

            return View(bookDetail);
        }

     


        [HttpPost]
        public ActionResult Book(BookDetailViewModel bookDetail)
        {
            if (ModelState.IsValid)
            {
                var session = (UserLogin)Session[OnlineShop.Common.CommonConstants.USER_SESSION];

                var order = new Order();
                if (session != null)
                {
                    order.CustomerID = session.UserID;
                }
                else
                {
                    order.CustomerID = null;
                }

                order.CreatedDate = DateTime.Now;
                order.ShipMobile = bookDetail.ShipMobile;
                order.ShipName = bookDetail.ShipName;
                order.ShipEmail = bookDetail.ShipEmail;
                order.Status = true;
                try
                {
                    var orderId = new OrderDao().Insert(order);
                    bookDetail.OrderID = orderId;
                    var detailDao = new Model.Dao.OrderDetailDao();
                    detailDao.InsertService(bookDetail);

                    string content = System.IO.File.ReadAllText(Server.MapPath("~/assets/client/template/neworder.html"));
                    content = content.Replace("{{CustomerName}}", bookDetail.ShipName);
                    content = content.Replace("{{Phone}}", bookDetail.ShipMobile);
                    content = content.Replace("{{Email}}", bookDetail.ShipEmail);
                    content = content.Replace("{{DetailOrer}}", bookDetail.ServiceName + "tu ngày ađến ngày");
                    var toEmail = ConfigurationManager.AppSettings["ToEmailAddress"].ToString();
                    new MailHelper().SendMail(bookDetail.ShipEmail, "Đơn hàng mới từ OnlineShop", content);
                    new MailHelper().SendMail(toEmail, "Đơn hàng mới từ OnlineShop", content);

                }
                catch (Exception ex)
                {
                    //ghi log
                    return Redirect("/loi-thanh-toan");
                }
                return Redirect("/hoan-thanh");
            }
            // Get MoreImage
            ViewBag.ListImages = LoadImages_ReturnListString(bookDetail.ProductID);

            Product proPostBack = new ProductDao().ViewDetail(bookDetail.ProductID);
            ViewBag.Detail = proPostBack.Detail;
            ViewBag.Description = proPostBack.Description;

            return View(bookDetail);
               
        }

        public List<string> LoadImages_ReturnListString(long id)
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
            return listImagesReturn;
        }

        public ActionResult Success()
        {
            return View();
        }


    }
}