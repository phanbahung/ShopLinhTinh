using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;

namespace Model.Dao
{
    public class ProductCategoryDao
    {
        OnlineShopDbContext db = null;
        public ProductCategoryDao()
        {
            db = new OnlineShopDbContext();
        }




        public IEnumerable<ProductCategory> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<ProductCategory> model = db.ProductCategories;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.Name.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }


       
        public long Insert(ProductCategory productCat)
        {
            db.ProductCategories.Add(productCat);
            db.SaveChanges();
            return productCat.ID;
        }

        public bool Update(ProductCategory entity)
        { 
            try
            {
                var proCat = db.ProductCategories.Find(entity.ID);
                proCat.Name = entity.Name;
                proCat.MetaTitle = entity.MetaTitle;
                proCat.ParentID = entity.ParentID;
                proCat.DisplayOrder = entity.DisplayOrder;
                proCat.SeoTitle = entity.SeoTitle;
                proCat.ModifiedDate = DateTime.Now;
                proCat.ModifiedBy = entity.ModifiedBy;
                proCat.MetaKeywords = entity.MetaKeywords;
                proCat.MetaDescriptions = entity.MetaDescriptions;
                proCat.Status = entity.Status;
                proCat.ShowOnHome = entity.ShowOnHome;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                //logging
                return false;
            }

        }


        public List<ProductCategory> ListAll()
        {
            return db.ProductCategories.Where(x => x.Status == true).OrderBy(x => x.DisplayOrder).ToList();
        }

        public ProductCategory ViewDetail(long id)
        {
            return db.ProductCategories.Find(id);
        }

        public bool Delete(int id)
        {
            try
            {
                var productCat = db.ProductCategories.Find(id);




                db.ProductCategories.Remove(productCat);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
    }
}
