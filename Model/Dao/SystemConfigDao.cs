using Model.EF;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;

namespace Model.Dao
{
    public class SystemConfigDao
    {
        OnlineShopDbContext db = null;
        public SystemConfigDao()
        {
            db = new OnlineShopDbContext();
        }  

        public string Get_SysConfig (string name)
        {           
            return db.SystemConfigs.Where(x=>x.Name==name).Select(y=> y.Value).SingleOrDefault();
        }

        public SystemConfig ViewDetails(int id)
        {
            return db.SystemConfigs.Find(id);
        }

        public List<SystemConfig> ListAll()
        {
            return db.SystemConfigs.ToList();
        }

        public void Update(SystemConfig entity)
        {
            var model = db.SystemConfigs.Find(entity.ID);
            model.Name = entity.Name;
            model.Type = entity.Type;
            model.Value = entity.Value;
            model.Status = entity.Status;
            db.SaveChanges();
        }



    }
}
