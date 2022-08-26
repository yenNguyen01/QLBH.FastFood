using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FastFood.Controllers;
using FastFood.Models;
namespace FastFood.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        QLFastFoodEntities db = new QLFastFoodEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ListProducts()
        {
            var ds = db.SanPhams.Select(s => s).ToList();
            return View(ds);
        }
        public ActionResult Details(int id)
        {
            SanPham p = db.SanPhams.Where(s => s.MaSP == id).FirstOrDefault();
            return View(p);
        }
    }
}