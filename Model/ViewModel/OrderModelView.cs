using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class OrderModelView
    {
        public long ID { set; get; }               
        public string ProductType { set; get; }
        public string Status { set; get; }
        public DateTime? CreatedDate { set; get; }        
        
    }
}
