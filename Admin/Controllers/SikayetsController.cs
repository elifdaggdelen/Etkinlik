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
    public class SikayetsController : BaseController
    {
        private etkinlikContainer db = new etkinlikContainer();

        // GET: Sikayets
        public ActionResult Index()
        {
            return View(db.SikayetSet.ToList());
        }

        // GET: Sikayets/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sikayet sikayet = db.SikayetSet.Find(id);
            if (sikayet == null)
            {
                return HttpNotFound();
            }
            return View(sikayet);
        }

        // GET: Sikayets/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Sikayets/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Konu,Aciklama,Tarih")] Sikayet sikayet)
        {
            if (ModelState.IsValid)
            {
                db.SikayetSet.Add(sikayet);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(sikayet);
        }

        // GET: Sikayets/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sikayet sikayet = db.SikayetSet.Find(id);
            if (sikayet == null)
            {
                return HttpNotFound();
            }
            return View(sikayet);
        }

        // POST: Sikayets/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Konu,Aciklama,Tarih")] Sikayet sikayet)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sikayet).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(sikayet);
        }

        // GET: Sikayets/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sikayet sikayet = db.SikayetSet.Find(id);
            if (sikayet == null)
            {
                return HttpNotFound();
            }
            return View(sikayet);
        }

        // POST: Sikayets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Sikayet sikayet = db.SikayetSet.Find(id);
            db.SikayetSet.Remove(sikayet);
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
