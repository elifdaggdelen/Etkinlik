using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web.Controllers
{
    public class EtkinlikController : BaseController
    {
        // GET: Etkinlik
        public ActionResult Index(int id = 0, int start = 0, int pageSize = 25, string query = "")
        {
            var etkinlikler = etkinlik.ActivitySet.AsQueryable();

            if (id > 0)
            {
                etkinlikler = etkinlikler.Where(q => q.KategoriId == id);
            }

            if (query.Length > 0)
            {
                etkinlikler = etkinlikler.Where(q => q.Title.Contains(query) || q.Text.Contains(query));
            }

            etkinlikler.OrderByDescending(q => q.Id).Skip(start).Take(pageSize);

            ViewBag.start = start + pageSize;
            ViewBag.pageSize = pageSize;

            return View(etkinlikler);
        }

        // GET: Posts
        public ActionResult Show(int id = 0)
        {
            Activity etkinlikler = etkinlik.ActivitySet.FirstOrDefault(q => q.Id == id);
            return View(etkinlikler);
        }
    }
}