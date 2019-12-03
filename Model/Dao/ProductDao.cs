using Model.EF;
using Model.ViewModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;


namespace Model.Dao
{
    public class ProductDao
    {
        OnlineShopDbContext db = null;
        public ProductDao()
        {
            db = new OnlineShopDbContext();
        }

        public bool Delete(int id)
        {
            try
            {
                var product = db.Products.Find(id);
                db.Products.Remove(product);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }


        public bool Update(Product entity)
        {
            try
            {
                var product = db.Products.Find(entity.ID);
                
                product.CategoryID = entity.CategoryID;
                product.Name = entity.Name;
                product.Image = entity.Image;
                product.Price = entity.Price;
                product.PromotionPrice = entity.PromotionPrice;
                product.Status = entity.Status;
                product.TopHot = entity.TopHot;
                product.MetaTitle = entity.MetaTitle;
                product.ModifiedBy = entity.ModifiedBy;
                product.ModifiedDate = DateTime.Now;
                product.Description = entity.Description;
                product.Detail = entity.Detail;

                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                //logging
                return false;
            }

        }

        public List<Product> List_All_Service()
        {
            List<Product> allPro = db.Products.ToList();
            List<Product> lstServices = allPro.Join(db.ProductCategories,
                                p => p.CategoryID,
                                cat => cat.ID,
                                (p, cat) => new { p, cat }).Where(z => z.cat.Service == true)
                                .Select(
                                    z => new Product
                                    {
                                        ID = z.p.ID,
                                        Name = z.p.Name,
                                        Code = z.p.Code,
                                        MetaTitle = z.cat.MetaTitle,
                                        Description = z.p.Description,
                                        Image = z.p.Image,
                                        Price = z.p.Price,
                                        PromotionPrice = z.p.PromotionPrice,
                                        IncludedVAT = z.p.IncludedVAT,
                                        Detail = z.p.Detail
                                    }).ToList();

            return lstServices;
        }

        public List<Product> ListAll_Product(int pageIndex = 1, int pageSize = 4)
        {
            // return db.Products.OrderByDescending(x => x.CreatedDate).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();

            List<Product> allPro = db.Products.ToList();
            List<Product> lstProducts = allPro.Join(db.ProductCategories,
                                p => p.CategoryID,
                                cat => cat.ID,
                                (p, cat) => new { p, cat }).Where(z => z.cat.Service == false)
                                .Select(
                                    z => new Product
                                    {
                                        ID = z.p.ID,
                                        Name = z.p.Name,
                                        Code = z.p.Code,
                                        MetaTitle = z.cat.MetaTitle,
                                        Description = z.p.Description,
                                        Image = z.p.Image,
                                        Price = z.p.Price,
                                        PromotionPrice = z.p.PromotionPrice,
                                        IncludedVAT = z.p.IncludedVAT,
                                        Detail = z.p.Detail
                                    }).ToList();
            //return lstService.OrderByDescending(x => x.CreatedDate).Skip((page - 1) * pageSize).Take(pageSize).ToList();

            return lstProducts.OrderByDescending(x => x.CreatedDate).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();

        }


        public List<Product> ListAll(int pageIndex = 1, int pageSize = 4)
        {
            return db.Products.OrderByDescending(x => x.CreatedDate).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
        }




        public IEnumerable<Product> ListAll_Product_Paging(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.Description.Contains(searchString));
            }

            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }

        public List<Product> ListAll_Service_Paging(string searchString, int page, int pageSize)
        {
            List<Product> allPro = db.Products.ToList();
            List<Product> lstService = allPro.Join(db.ProductCategories,
                                p => p.CategoryID,
                                cat => cat.ID,
                                (p, cat) => new { p, cat }).Where(z => z.cat.Service == true)
                                .Select(
                                    z=> new Product {
                                        ID = z.p.ID,
                                        Name = z.p.Name,
                                        Code = z.p.Code,
                                        MetaTitle = z.cat.MetaTitle,
                                        Description = z.p.Description,
                                        Image = z.p.Image,
                                        Price = z.p.Price,
                                        PromotionPrice = z.p.PromotionPrice,
                                        IncludedVAT = z.p.IncludedVAT,
                                        Detail = z.p.Detail
                                    }).ToList() ;
            return lstService.OrderByDescending(x => x.CreatedDate).Skip((page - 1) * pageSize).Take(pageSize).ToList();
                      

        }     



        public long Insert(Product entity)
        {
            db.Products.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }

        public List<Product> ListNewProduct(int top)
        { // Old
           // return db.Products.OrderByDescending(x => x.CreatedDate).Take(top).ToList();

            List<Product> allPro = db.Products.ToList();
            List<Product> lstProducts = allPro.Join(db.ProductCategories,
                                p => p.CategoryID,
                                cat => cat.ID,
                                (p, cat) => new { p, cat }).Where(z => z.cat.Service != true)
                                .Select(
                                    z => new Product
                                    {
                                        ID = z.p.ID,
                                        Name = z.p.Name,
                                        Code = z.p.Code,
                                        MetaTitle = z.cat.MetaTitle,
                                        Description = z.p.Description,
                                        Image = z.p.Image,
                                        Price = z.p.Price,
                                        PromotionPrice = z.p.PromotionPrice,
                                        IncludedVAT = z.p.IncludedVAT,
                                        Detail = z.p.Detail
                                    }).ToList();

            return lstProducts.OrderByDescending(x => x.CreatedDate).Take(top).ToList();

        }
        public List<string> ListName(string keyword)
        {
            return db.Products.Where(x => x.Name.Contains(keyword)).Select(x => x.Name).ToList();
        }
      
        /// <summary>
        /// Get list product by category
        /// </summary>
        /// <param name="categoryID"></param>
        /// <returns></returns>
        public List<Product> ListByCategoryId(long categoryID, int pageIndex = 1, int pageSize = 2)
        {           
            return db.Products.Where(x => x.CategoryID == categoryID).OrderByDescending(x => x.CreatedDate).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            
        }
       

        public List<Product> Search(string keyword, int pageIndex = 1, int pageSize = 4)
        {
            return db.Products.Where(x => x.Name.Contains(keyword)).OrderByDescending(x => x.CreatedDate).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
        }
        /// <summary>
        /// List feature product
        /// </summary>
        /// <param name="top"></param>
        /// <returns></returns>
        public List<Product> ListFeatureProduct(int top)
        {
            return db.Products.Where(x => x.TopHot != null && x.TopHot > DateTime.Now).OrderByDescending(x => x.CreatedDate).Take(top).ToList();
        }
        public List<Product> ListRelatedProducts(long productId)
        {
            var product = db.Products.Find(productId);
            return db.Products.Where(x => x.ID != productId && x.CategoryID == product.CategoryID).ToList();
        }

        public void UpdateImages(long productId, string images)
        {
            var product = db.Products.Find(productId);
            product.MoreImages = images;
            db.SaveChanges();
        }
        public Product ViewDetail(long id)
        {
            return db.Products.Find(id);
        }
    }
}
