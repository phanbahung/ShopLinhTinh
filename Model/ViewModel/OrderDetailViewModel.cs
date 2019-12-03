using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class OrderDetailViewModel
    {
        public long ID { set; get; }
        public string  Code { set; get; }
        public string Image { set; get; }        
        public decimal? Price { set; get; }
        public string CateName { set; get; }
        public string ProductName { set; get; }        
        public int? Quantity { set; get; }
        public decimal? Total { set; get; }

    }
}
