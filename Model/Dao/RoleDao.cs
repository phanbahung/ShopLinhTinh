using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
using System.Configuration;
using Common;
using Model.Dao;
using System.Web;
using System.Xml.Linq;

namespace Model.Dao
{
    public class RoleDao
    {
        OnlineShopDbContext db = null;
        public RoleDao()
        {
            db = new OnlineShopDbContext();
        }

        public List<Role> ListAll()
        {
            return (db.Roles.ToList());

        }

      
     

       

       
      
    }
}
