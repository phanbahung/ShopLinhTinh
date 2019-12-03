using Model.EF;
using Model.ViewModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class OrderDetailDao
    {
        OnlineShopDbContext db = null;
        public OrderDetailDao()
        {
            db = new OnlineShopDbContext();
        }
        public bool Insert(OrderDetail detail)
        {
            try
            {
                db.OrderDetails.Add(detail);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;

            }
        }

        public bool InsertService(BookDetailViewModel entity)
        {

            OrderDetail newBook = new OrderDetail();
            newBook.ProductID = entity.ProductID;
            newBook.OrderID = entity.OrderID;
            newBook.FromDate = entity.FromDate;
            newBook.ToDate = entity.ToDate;
            newBook.Notes = entity.Notes;
            newBook.Status = 0;
            try
            {
                db.OrderDetails.Add(newBook);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;

            }
        }

        public IEnumerable<OrderDetailViewModel> Detail(long orderID)
        {            
            IEnumerable<OrderDetailViewModel> list  = (from p in db.Products
                        join od in db.OrderDetails on p.ID equals od.ProductID
                        where (od.OrderID == orderID)
                        select new OrderDetailViewModel
                        {   ID = p.ID,
                            Image = p.Image,
                            Code = p.Code,
                            Price = od.Price,
                            ProductName = p.Name,
                            Quantity= od.Quantity,
                            Total= od.Quantity* od.Price
                        });
            return list;
        }       
        

        public IEnumerable<OrderDetail> ListDetails(long orderID, int page, int pageSize)
        {
            IQueryable<OrderDetail> model = db.OrderDetails;           
                model = model.Where(x=>x.OrderID==orderID);
            return model.OrderByDescending(x => x.ProductID).ToPagedList(page, pageSize);
        }
    }
}
