using FastFood.Models;
using System;
using System.Linq;
using System.Web.Mvc;
namespace FastFood.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        QLFastFoodEntities db = new QLFastFoodEntities();
        
        public ActionResult Login()
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            string mail = collection["Email"];
            string pass = collection["MatKhau"];
            
            var islogin = db.KhachHangs.SingleOrDefault(x => x.Email == mail && x.MatKhau ==pass);

            if (islogin != null)
            {
                if (mail == "Admin.Manager@gmail.com" )
                {
                    Session["user"] = islogin;
                    return RedirectToAction("Index", "Admin/Home");
                }
                else
                {
                    Session["user"] = islogin;
                    return RedirectToAction("Index", "Home");
                }
            }
            else
            {
                ViewBag.Loi = "Email hoặc Mật khẩu không đúng!";
                return View("Login");
            }

        }
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(FormCollection collection, KhachHang _user)
        {
            var gmail = collection["Email"];
            var pw = collection["MatKhau"];
            KhachHang neweUser = new KhachHang();
            if(String.IsNullOrEmpty(gmail) || String.IsNullOrEmpty(pw))
            {
                ViewData["Error1"] = "Không được để trống!";
            }
            else if (ModelState.IsValid)
            {
                var check = db.KhachHangs.SingleOrDefault(x => x.Email == gmail && x.MatKhau == pw);
                if(check == null)
                {
                    db.KhachHangs.Add(_user);
                    db.SaveChanges();
                    return RedirectToAction("Login");
                }
            }  
            return this.Register();
        }
        public ActionResult Logout()
        {
            Session["user"] = null;
            return RedirectToAction("Index", "Home");

        }
        public ActionResult InforUser()
        {
            return View();
        }
       
    }
}