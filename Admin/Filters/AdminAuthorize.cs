using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Admin.Filters
{
    public class AdminAuthorize : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            if (httpContext.Session["user"] != null)
            {
                User user = (User)httpContext.Session["user"];

                if (user.UserType.Yetki == "Admin")
                {
                    return true;
                }

            }

            httpContext.Response.Redirect("/Home/Login");
            return false;
        }
    }
}