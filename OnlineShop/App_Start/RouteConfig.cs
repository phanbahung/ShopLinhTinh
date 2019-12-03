using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace OnlineShop
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.IgnoreRoute("{*botdetect}",
      new { botdetect = @"(.*)BotDetectCaptcha\.ashx" });

       //     routes.MapRoute(
       //      name: "Service",
       //      url: "dich-vu",
       //      defaults: new { controller = "Service", action = "Index", cateId = UrlParameter.Optional },
       //      namespaces: new[] { "OnlineShop.Controllers" }
       //  );

       //     routes.MapRoute(
       //    name: "Service Details",
       //    url: "dich-vu/{metatitle}-{cateId}",
       //    defaults: new { controller = "Service", action = "Category", cateId = UrlParameter.Optional },
       //    namespaces: new[] { "OnlineShop.Controllers" }
       //);


            routes.MapRoute(
           name: "Book Details",
           url: "dat-phong/{metatitle}-{productId}",
           defaults: new { controller = "Service", action = "Book", productId = UrlParameter.Optional },
           namespaces: new[] { "OnlineShop.Controllers" }
       );

            routes.MapRoute(
               name: "Product Category",
               url: "san-pham/{metatitle}-{cateId}",
               defaults: new { controller = "Product", action = "Category", cateId = UrlParameter.Optional },
               namespaces: new[] { "OnlineShop.Controllers" }
           );

            routes.MapRoute(
             name: "OrderCustomer",
             url: "don-hang",
             defaults: new { controller = "Order", action = "Index"},
             namespaces: new[] { "OnlineShop.Controllers" }
         );

            routes.MapRoute(
             name: "Order Detail",
             url: "dhct/{id}",
             defaults: new { controller = "Order", action = "Detail", id = UrlParameter.Optional },
             namespaces: new[] { "OnlineShop.Controllers" }
         );

            routes.MapRoute(
              name: "Product Detail",
              url: "chi-tiet/{metatitle}-{id}",
              defaults: new { controller = "Product", action = "Detail", id = UrlParameter.Optional },
              namespaces: new[] { "OnlineShop.Controllers" }
          );
            routes.MapRoute(
             name: "Tags",
             url: "tag/{tagId}",
             defaults: new { controller = "Content", action = "Tag", id = UrlParameter.Optional },
             namespaces: new[] { "OnlineShop.Controllers" }
         );
            routes.MapRoute(
             name: "Content Detail",
             url: "tin-tuc/{metatitle}-{id}",
             defaults: new { controller = "Content", action = "Detail", id = UrlParameter.Optional },
             namespaces: new[] { "OnlineShop.Controllers" }
         );
            routes.MapRoute(
             name: "About",
             url: "gioi-thieu",
             defaults: new { controller = "About", action = "Index", id = UrlParameter.Optional },
             namespaces: new[] { "OnlineShop.Controllers" }
         );
            routes.MapRoute(
          name: "Contact",
          url: "lien-he",
          defaults: new { controller = "Contact", action = "Index", id = UrlParameter.Optional },
          namespaces: new[] { "OnlineShop.Controllers" }
         );     

            routes.MapRoute(
       name: "News",
       url: "tin-tuc",
       defaults: new { controller = "Content", action = "Index", id = UrlParameter.Optional },
       namespaces: new[] { "OnlineShop.Controllers" }
   );
            routes.MapRoute(
          name: "Cart",
          url: "gio-hang",
          defaults: new { controller = "Cart", action = "Index", id = UrlParameter.Optional },
          namespaces: new[] { "OnlineShop.Controllers" }
      );
            routes.MapRoute(
        name: "Login",
        url: "dang-nhap",
        defaults: new { controller = "User", action = "Login", id = UrlParameter.Optional },
        namespaces: new[] { "OnlineShop.Controllers" }
    );

  routes.MapRoute(
      name: "ChangePass",
      url: "doi-mat-khau",
      defaults: new { controller = "User", action = "ChangePass", id = UrlParameter.Optional },
      namespaces: new[] { "OnlineShop.Controllers" }
  );

            routes.MapRoute(
     name: "Account",
     url: "tai-khoan",
     defaults: new { controller = "User", action = "Edit", id = UrlParameter.Optional },
     namespaces: new[] { "OnlineShop.Controllers" }
 );

            routes.MapRoute(
       name: "Search",
       url: "tim-kiem",
       defaults: new { controller = "Product", action = "Search", id = UrlParameter.Optional },
       namespaces: new[] { "OnlineShop.Controllers" }
   );
            routes.MapRoute(
        name: "Register",
        url: "dang-ky",
        defaults: new { controller = "User", action = "Register", id = UrlParameter.Optional },
        namespaces: new[] { "OnlineShop.Controllers" }
    );
            routes.MapRoute(
         name: "Payment",
         url: "thanh-toan",
         defaults: new { controller = "Cart", action = "Payment", id = UrlParameter.Optional },
         namespaces: new[] { "OnlineShop.Controllers" }
     );
            routes.MapRoute(
            name: "Add Cart",
            url: "them-gio-hang",
            defaults: new { controller = "Cart", action = "AddItem", id = UrlParameter.Optional },
            namespaces: new[] { "OnlineShop.Controllers" }
        );
            routes.MapRoute(
          name: "Payment Success",
          url: "hoan-thanh",
          defaults: new { controller = "Cart", action = "Success", id = UrlParameter.Optional },
          namespaces: new[] { "OnlineShop.Controllers" }
      );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "OnlineShop.Controllers" }
            );


        }
    }
}
