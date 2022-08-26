using FastFood.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FastFood.Controllers;
using System.Transactions;

namespace FastFood.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        // GET: Product
        QLFastFoodEntities db = new QLFastFoodEntities();
        public ActionResult Index()
        {
            return View();
        }
        public List<Cart> GetListCart()
        {
            List<Cart> carts = Session["Cart"] as List<Cart>;
            if (carts == null)
            {
                carts = new List<Cart>();
                Session["Cart"] = carts;
            }
            return carts;
        }


        public ActionResult AddCart(int id, string URL)
        {
            List<Cart> carts = GetListCart();
            Cart c = carts.Find(s => s.MaSP == id);
            if (c == null)
            {
                c = new Cart(id);
                carts.Add(c);
            }
            else
            {
                c.SoLuong++;
            }
            return Redirect(URL);
            //return RedirectToAction("ListCart");
        }
        public ActionResult ListCart()
        {
            List<Cart> carts = GetListCart();
            if (carts.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            ViewBag.CountProduct = Count();
            ViewBag.TotalPrice = Total();
            Session["SesTotal"] = Total();
            return View(carts);
        }
        public ActionResult CartPartial()
        {
            if (Count() == 0)
            {
                return PartialView();
            }
            ViewBag.CountProduct = Count();
            ViewBag.TotalPrice = Total();
            return PartialView();

        }
        public ActionResult Edit(int id, FormCollection collection)
        {
            SanPham p = db.SanPhams.SingleOrDefault(n => n.MaSP == id);
            if (p == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //Lấy giỏ hàng ra từ session
            List<Cart> basket = GetListCart();
            Cart product = GetListCart().SingleOrDefault(n => n.MaSP == id);
            if (product != null)
            {
                product.SoLuong = int.Parse(collection["SoLuong"].ToString());

            }
            return RedirectToAction("ListCart");
        }
        public ActionResult Delete(int id)
        {
            List<Cart> basket = GetListCart();
            Cart c = basket.Find(n => n.MaSP == id);
            if (c != null)
            {
                basket.RemoveAll(n => n.MaSP == id);
                return RedirectToAction("ListCart");
            }
            if (basket.Count() == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("ListCart");
        }

        private int Count()
        {
            int sl = 0;
            List<Cart> basket = Session["Cart"] as List<Cart>;
            if (basket != null)
            {
                sl = basket.Sum(s => s.SoLuong);
            }
            return sl;
        }
        private decimal? Total()
        {
            decimal? total = 0;
            List<Cart> basket = Session["Cart"] as List<Cart>;
            if (basket != null)
            {
                total = basket.Sum(s => s.Total);
            }
            return total;
        }
        public ActionResult OrderProduct(FormCollection co)
        {
            using (System.Data.Entity.DbContextTransaction tranScope = db.Database.BeginTransaction())
            {
                {
                    try
                    {
                        DonHang order = new DonHang();
                        order.NgayDatHang = DateTime.Now;
                        db.DonHangs.Add(order);
                        db.SaveChanges();
                        List<Cart> basket = GetListCart();
                        foreach (var item in basket)
                        {
                            ChiTietDonHang d = new Models.ChiTietDonHang();
                            d.MaDonHang = order.MaDonHang;
                            d.MaSP = item.MaSP;
                            d.SoLuong = (short)item.SoLuong;
                            d.GiaTien = (decimal)item.GiaTien;
                            d.GiamGia = 0;

                            db.ChiTietDonHangs.Add(d);
                        }
                        db.SaveChanges();
                        tranScope.Commit();
                        Session["Cart"] = null;
                    }
                    catch (Exception)
                    {
                        tranScope.Dispose();
                        return RedirectToAction("ListCart");
                    }
                }
                return RedirectToAction("OrderProductList", "Cart");
            }
        }
        public ActionResult OrderProductList()
        {
            var p = db.ChiTietDonHangs.OrderByDescending(s => s.MaDonHang).Select(s => s).ToList();
            return View(p);
        }

    }
}