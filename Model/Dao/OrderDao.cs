using Model.EF;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
using Model.Dao;
using System.Web;
using System.Xml.Linq;
using Model.ViewModel;

namespace Model.Dao
{
    public class OrderDao
    {
        OnlineShopDbContext db = null;
        public OrderDao()
        {
            db = new OnlineShopDbContext();
        }
        public long Insert(Order order)
        {
            db.Orders.Add(order);
            db.SaveChanges();
            return order.ID;
        }

        public void UpdateStatus(Order entity)
        {
            var donHang = db.Orders.Find(entity.ID);
            donHang.Status = entity.Status;
            db.SaveChanges();            
        }

        public Order Detail(long orderID)
        {
            return db.Orders.Find(orderID) ;
        }

        public IEnumerable<Order> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Order> model = db.Orders;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.ShipName.Contains(searchString) 
                || x.ShipMobile.Contains(searchString)
                || x.ShipEmail.Contains(searchString)                
                );
            }

            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }


        public IEnumerable<Order> ListAllPagingByCurrentUser(long customerId, string searchString, int page, int pageSize)
        {
            IQueryable<Order> model=null;                    
            model = db.Orders.Where(x=>x.CustomerID== customerId) ;         
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }

        public IEnumerable<OrderModelView> ListAllPagingByCurrentUser_11(long customerId, string searchString, int page, int pageSize)
        {
            IQueryable<OrderModelView> model = null;            
            model = from o in db.Orders
                    join od in db.OrderDetails on o.ID equals od.OrderID
                    join p in db.Products on od.ProductID equals p.ID
                    join pc in db.ProductCategories on p.CategoryID equals pc.ID
                    where o.CustomerID == customerId
                    select new OrderModelView
                    {
                        ID = o.ID,
                        ProductType = (pc.Service ==true ? "Đặt phòng" : "Đơn đặt hàng"),
                        Status = (o.Status == true ? "Chưa xác nhận" : "Đã xác nhận"),
                        CreatedDate = o.CreatedDate
                    };

            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }


    }
}
