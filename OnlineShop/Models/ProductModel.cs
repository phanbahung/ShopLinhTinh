using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace OnlineShop.Models
{
    public class ProductModel
    {
        public long ID { get; set; }        
        public string Name { get; set; }
        public string Code { get; set; }
        public string Image { get; set; }
        public decimal? Price { get; set; }
        public decimal? PromotionPrice { get; set; }
        public bool? IncludedVAT { get; set; }
        public int? Quantity { get; set; }
        public long? CategoryName { get; set; }           
      }

    }