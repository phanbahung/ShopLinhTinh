using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class BookDetailViewModel
    {
        public long OrderID { set; get; }
        public long ProductID { set; get; }
        public string Code { set; get; }
        public string Image { set; get; }
        public string Description { set; get; }
        public string Detail { set; get; }
        public decimal? Price { set; get; }
        public string CateName { set; get; }
        public string ServiceName { set; get; }        
        public int? Quantity { set; get; }
        public decimal? Total { set; get; }
        public List<string> MoreImages { set; get; }


        // Service
        //[DataType(DataType.Date)]
        //[DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        [Required(ErrorMessage = "Nhập ngày nhận phòng")]
        public DateTime? FromDate { set; get; }


        //[DataType(DataType.Date)]
        //[DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        [Required(ErrorMessage = "Nhập ngày trả phòng")]

        public DateTime? ToDate { set; get; }

        [Required(ErrorMessage = "Nhập số lượng người lớn")]
        [Range(1, 1000, ErrorMessage = "Số người lớn > 0")]
        public int Adult { set; get; }
        public int? Children { set; get; }       
        public string Notes { set; get; }
      

        // Contact
        public long? CustomerID { set; get; }       
         [Required(ErrorMessage = "Nhập họ và tên")]
        public string ShipName { set; get; }

        [Required(ErrorMessage = "Nhập số điện thoại")]
        public string ShipMobile { get; set; }                
        public string ShipEmail { get; set; }
        



    }
}
