using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace OnlineShop.Models
{
    public class UserEditModel
    {
        
        public string UserName { set; get; }    

        [Display(Name = "Họ và tên")]
        [StringLength(50, MinimumLength = 3, ErrorMessage = "Độ dài mật khẩu ít nhất 3 ký tự.")]
        [Required(ErrorMessage = "Nhập họ và tên đầy đủ")]
        public string Name { get; set; }

        [StringLength(50)]
        public string Address { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string Phone { get; set; }

        public int? ProvinceID { get; set; }

        public int? DistrictID { get; set; }
       

        
    }
}