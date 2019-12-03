using BotDetect.Web.UI.Mvc;
using Facebook;
using Model.Dao;
using Model.EF;
using OnlineShop.Common;
using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web.Mvc;
using System.Xml.Linq;
using System.ComponentModel.DataAnnotations;

namespace OnlineShop.Controllers
{
    
    public class UserController : Controller
    {
        private Uri RedirectUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Url);
                uriBuilder.Query = null;
                uriBuilder.Fragment = null;
                uriBuilder.Path = Url.Action("FacebookCallback");
                return uriBuilder.Uri;
            }
        }

        // GET: User
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpGet]
        public ActionResult ChangePass()
        {
            var session = (UserLogin)Session[OnlineShop.Common.CommonConstants.USER_SESSION];
            UserChangePassModel returnUser=new UserChangePassModel();
            if (session != null)
            { 
                //var user = new UserDao().GetById(session.UserName);               
                returnUser.UserName = session.UserName;
                returnUser.OldPass = "";
                returnUser.NewPass1 = "";
                returnUser.NewPass2 = "";
            }
            else return RedirectToAction("Index", "Home");
            return View(returnUser);            
        }

        public ActionResult Login()
        {
            return View();
        }
        public ActionResult LoginFacebook()
        {
            var fb = new FacebookClient();
            var loginUrl = fb.GetLoginUrl(new
            {
                client_id = ConfigurationManager.AppSettings["FbAppId"],
                client_secret = ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri = RedirectUri.AbsoluteUri,
                response_type = "code",
                scope = "email",
            });

            return Redirect(loginUrl.AbsoluteUri);
        }

        public ActionResult FacebookCallback(string code)
        {
            var fb = new FacebookClient();
            dynamic result = fb.Post("oauth/access_token", new
            {
                client_id = ConfigurationManager.AppSettings["FbAppId"],
                client_secret = ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri = RedirectUri.AbsoluteUri,
                code = code
            });


            var accessToken = result.access_token;
            if (!string.IsNullOrEmpty(accessToken))
            {
                fb.AccessToken = accessToken;
                // Get the user's information, like email, first name, middle name etc
                dynamic me = fb.Get("me?fields=first_name,middle_name,last_name,id,email");
                string email = me.email;
                string userName = me.email;
                string firstname = me.first_name;
                string middlename = me.middle_name;
                string lastname = me.last_name;

                var user = new User();
                user.Email = email;
                user.UserName = email;
                user.Status = true;
                user.Name = firstname + " " + middlename + " " + lastname;
                user.CreatedDate = DateTime.Now;
                var resultInsert = new UserDao().InsertForFacebook(user);
                if (resultInsert > 0)
                {
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.UserID = user.ID;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                }
            }
            return Redirect("/");
        }
        public ActionResult Logout()
        {
            Session[CommonConstants.USER_SESSION] = null;
            return Redirect("/");
        }
        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                var result = dao.Login(model.UserName, Encryptor.MD5Hash(model.Password));
                if (result == 1)
                {
                    var user = dao.GetByUserName(model.UserName);
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.UserID = user.ID;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return Redirect("/");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại.");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản đang bị khoá.");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng.");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập không đúng.");
                }
            }
            return View(model);
        }
        [HttpPost]
        [CaptchaValidation("CaptchaCode", "registerCapcha", "Mã xác nhận không đúng!")]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                if (dao.CheckUserName(model.UserName))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                }
                else if (dao.CheckEmail(model.Email))
                {
                    ModelState.AddModelError("", "Email đã tồn tại");
                }
                else
                {
                    var user = new User();
                    user.UserName = model.UserName;
                    user.Name = model.Name;
                    user.Password = Encryptor.MD5Hash(model.Password);
                    user.Phone = model.Phone;
                    user.Email = model.Email;
                    user.Address = model.Address;                    
                    user.CreatedDate = DateTime.Now;
                    user.Status = true;
                    if (!string.IsNullOrEmpty(model.ProvinceID))
                    {
                        user.ProvinceID = int.Parse(model.ProvinceID);
                    }
                    if (!string.IsNullOrEmpty(model.DistrictID))
                    {
                        user.DistrictID = int.Parse(model.DistrictID);
                    }
                   
                    var result = dao.Insert(user);
                    if (result > 0)
                    {
                        ViewBag.Success = "Đăng ký thành công";
                        model = new RegisterModel();
                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng ký không thành công.");
                    }
                }
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult ChangePass(UserChangePassModel model)
        {
            string encryptedOldPass = Encryptor.MD5Hash(model.OldPass);
           

            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                if (!dao.CheckPassword(model.UserName, encryptedOldPass))
                {
                    ModelState.AddModelError("", "Mật khẩu cũ không đúng");
                }
                else if (model.NewPass1!=model.NewPass2)
                {
                    ModelState.AddModelError("", "Mật khẩu mới không giống nhau");
                }

                else if (model.NewPass1.Length<5)
                {
                    ModelState.AddModelError("", "Mật khẩu phải ít nhất 5 kí tự");
                }

                else
                {
                    
                    string encryptedNewPass = Encryptor.MD5Hash(model.NewPass1);
                    bool kq=dao.ChangePass( model.UserName, encryptedNewPass);                  
                                        
                    if (kq)
                    {
                        ModelState.AddModelError("", "Đổi mật khẩu thành công..");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Đổi mật khẩu không thành công.");
                    }
                }
            }
            return View();
        }

       

        public JsonResult LoadProvince()
        {
            var xmlDoc = XDocument.Load(Server.MapPath(@"~/assets/client/data/Provinces_Data.xml"));

            var xElements = xmlDoc.Element("Root").Elements("Item").Where(x => x.Attribute("type").Value == "province");
            var list = new List<ProvinceModel>();
            ProvinceModel province = null;
            foreach (var item in xElements)
            {
                province = new ProvinceModel();
                province.ID = int.Parse(item.Attribute("id").Value);
                province.Name = item.Attribute("value").Value;
                list.Add(province);

            }
            return Json(new
            {
                data = list,
                status = true
            });
        }
        public JsonResult LoadDistrict(int provinceID)
        {
            var xmlDoc = XDocument.Load(Server.MapPath(@"~/assets/client/data/Provinces_Data.xml"));

            var xElement = xmlDoc.Element("Root").Elements("Item")
                .Single(x => x.Attribute("type").Value == "province" && int.Parse(x.Attribute("id").Value) == provinceID);

            var list = new List<DistrictModel>();
            DistrictModel district = null;
            foreach (var item in xElement.Elements("Item").Where(x => x.Attribute("type").Value == "district"))
            {
                district = new DistrictModel();                
                district.Name = item.Attribute("value").Value;
                district.DistrictID = int.Parse(xElement.Attribute("id").Value);
                list.Add(district);

            }
            return Json(new
            {
                data = list,
                status = true
            });
        }

        public List<ProvinceModel> LoadProvinceList()
        {
            var xmlDoc = XDocument.Load(Server.MapPath(@"~/assets/client/data/Provinces_Data.xml"));

            var xElements = xmlDoc.Element("Root").Elements("Item").Where(x => x.Attribute("type").Value == "province");
            var list = new List<ProvinceModel>();
            ProvinceModel province = null;
            foreach (var item in xElements)
            {
                province = new ProvinceModel();
                province.ProvinceID = int.Parse(item.Attribute("id").Value);
                province.ID = int.Parse(item.Attribute("id").Value);
                province.Name = item.Attribute("value").Value;
                list.Add(province);
            }
            return list;

        }

        public List<DistrictModel> LoadDistrictList(int? provinceID)
        {
            var xmlDoc = XDocument.Load(Server.MapPath(@"~/assets/client/data/Provinces_Data.xml"));

            var xElement = xmlDoc.Element("Root").Elements("Item")
                .Single(x => x.Attribute("type").Value == "province" && int.Parse(x.Attribute("id").Value) == provinceID);

            var list = new List<DistrictModel>();
            DistrictModel district = null;
            foreach (var item in xElement.Elements("Item").Where(x => x.Attribute("type").Value == "district"))
            {
                district = new DistrictModel();                
                district.Name = item.Attribute("value").Value;
                district.DistrictID = int.Parse(xElement.Attribute("id").Value);
                list.Add(district);
            }
            return list;
        }

        public ActionResult Edit()
        {
            var session = (UserLogin)Session[OnlineShop.Common.CommonConstants.USER_SESSION];
            UserEditModel returnUser = new UserEditModel();
            User user = new Model.EF.User();            

            if (session != null)
            {
                user = new UserDao().GetByUserName(session.UserName);               
                //returnUser.UserName = session.UserName;
                //returnUser.Address = user.Address;
                //returnUser.ProvinceID = user.ProvinceID;
                //returnUser.DistrictID =user.DistrictID;                
                //returnUser.Email = user.Email;
                //returnUser.Name = user.Name;
                //returnUser.Phone = user.Phone;

                //SetViewBag_Province(user.ProvinceID);
               // SetViewBag_District(user.ProvinceID, user.DistrictID);

            }

            else return RedirectToAction("Index", "Home");

            //return View(returnUser);
            return View(user);


        }

        public void SetViewBag_Province(int? selectedId = null)
        {           
            ViewBag.ProvinceID = new SelectList(LoadProvinceList(), "ProvinceID", "Name", selectedId);
        }

        public void SetViewBag_District(int? selectedProvince, int? selectedId = null)
        {
            ViewBag.DistrictID = new SelectList(LoadDistrictList(selectedProvince), "DistrictID", "Name", selectedId);
        }


        [HttpPost]
        public ActionResult Edit(User entity)
        {
            if (ModelState.IsValid)
            {
                var session = (UserLogin)Session[OnlineShop.Common.CommonConstants.USER_SESSION];
                var dao = new UserDao();
                var user = dao.GetByUserName(session.UserName);
                user.Address = entity.Address;
                //user.ProvinceID = entity.ProvinceID;
               // user.DistrictID = entity.DistrictID;
                user.Email = entity.Email;
                user.Name = entity.Name;
                user.Phone = entity.Phone;
                               
                var result = dao.Update(user);
                if (result)
                {
                    ModelState.AddModelError("", "Cập nhật thành công.");
                    //return RedirectToAction("Index", "User");
                }
                else
                {
                    ModelState.AddModelError("", "Có lỗi khi cập nhật thông tin. Bạn hãy thử lại! ");
                }
            }

            //SetViewBag_Province(entity.ProvinceID);
           // SetViewBag_District(entity.ProvinceID, entity.DistrictID);

            return View(entity);
        }

    }
}