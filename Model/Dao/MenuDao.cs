using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class MenuDao
    {
        OnlineShopDbContext db = null;
        public MenuDao()
        {
            db = new OnlineShopDbContext();
        }

        public List<Menu> ListByGroupId(int groupId)
        {
            return db.Menus.Where(x => x.TypeID == groupId && x.Status==true).OrderBy(x=>x.DisplayOrder).ToList();
        }  

        public Menu ViewDetails(int id)
        {
            return db.Menus.Find(id);
        }

        public List<Menu> ListAll()
        {
            return db.Menus.OrderBy(x=>x.DisplayOrder).ToList();
        }

        public void Update(Menu entity)
        {
            var model = db.Menus.Find(entity.ID);
            model.DisplayOrder = entity.DisplayOrder;
            model.Link = entity.Link;
            model.Status = entity.Status;
            model.Target = entity.Target;
            model.Text = entity.Text;
            model.TypeID = entity.TypeID;
            db.SaveChanges();
        }
    }
}
