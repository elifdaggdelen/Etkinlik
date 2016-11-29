using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Data;

namespace Admin.Controllers
{
    public class ActivitiesController : BaseController
    {
        private etkinlikContainer db = new etkinlikContainer();

        // GET: Activities
        public ActionResult Index()
        {
            var activitySet = db.ActivitySet.Include(a => a.User).Include(a => a.Kategori).Include(a => a.Comment).Include(a => a.Sikayet);
            return View(activitySet.ToList());
        }

        // GET: Activities/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Activity activity = db.ActivitySet.Find(id);
            if (activity == null)
            {
                return HttpNotFound();
            }
            return View(activity);
        }

        // GET: Activities/Create
        public ActionResult Create()
        {
            ViewBag.UserId = new SelectList(db.UserSet, "Id", "Name");
            ViewBag.KategoriId = new SelectList(db.KategoriSet, "Id", "KategoriAdi");
            ViewBag.CommentId = new SelectList(db.CommentSet, "Id", "Text");
            ViewBag.SikayetId = new SelectList(db.SikayetSet, "Id", "Konu");
            return View();
        }

        // POST: Activities/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,UserId,KategoriId,CommentId,SikayetId,Title,Text,Resim,Date")] Activity activity)
        {
            if (ModelState.IsValid)
            {
                db.ActivitySet.Add(activity);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserId = new SelectList(db.UserSet, "Id", "Name", activity.UserId);
            ViewBag.KategoriId = new SelectList(db.KategoriSet, "Id", "KategoriAdi", activity.KategoriId);
            ViewBag.CommentId = new SelectList(db.CommentSet, "Id", "Text", activity.CommentId);
            ViewBag.SikayetId = new SelectList(db.SikayetSet, "Id", "Konu", activity.SikayetId);
            return View(activity);
        }

        // GET: Activities/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Activity activity = db.ActivitySet.Find(id);
            if (activity == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserId = new SelectList(db.UserSet, "Id", "Name", activity.UserId);
            ViewBag.KategoriId = new SelectList(db.KategoriSet, "Id", "KategoriAdi", activity.KategoriId);
            ViewBag.CommentId = new SelectList(db.CommentSet, "Id", "Text", activity.CommentId);
            ViewBag.SikayetId = new SelectList(db.SikayetSet, "Id", "Konu", activity.SikayetId);
            return View(activity);
        }

        // POST: Activities/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,UserId,KategoriId,CommentId,SikayetId,Title,Text,Resim,Date")] Activity activity)
        {
            if (ModelState.IsValid)
            {
                db.Entry(activity).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserId = new SelectList(db.UserSet, "Id", "Name", activity.UserId);
            ViewBag.KategoriId = new SelectList(db.KategoriSet, "Id", "KategoriAdi", activity.KategoriId);
            ViewBag.CommentId = new SelectList(db.CommentSet, "Id", "Text", activity.CommentId);
            ViewBag.SikayetId = new SelectList(db.SikayetSet, "Id", "Konu", activity.SikayetId);
            return View(activity);
        }

        // GET: Activities/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Activity activity = db.ActivitySet.Find(id);
            if (activity == null)
            {
                return HttpNotFound();
            }
            return View(activity);
        }

        // POST: Activities/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Activity activity = db.ActivitySet.Find(id);
            db.ActivitySet.Remove(activity);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
