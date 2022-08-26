using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using FastFood.Models;

namespace FastFood.Models
{
    public class Cart
    {
        private QLFastFoodEntities db = new QLFastFoodEntities();
        [Key]
        public int MaSP { get; set; }
        public string TenSP { get; set; }
        public string AnhSP { get; set; }
        public decimal? GiaTien { get; set; }
        public int SoLuong { get; set; }
        public decimal? Total { get { return GiaTien * SoLuong; } }

        public Cart(int id)
        {
            this.MaSP = id;
            SanPham p = db.SanPhams.Single(n => n.MaSP == id);
            AnhSP = p.AnhUrl;
            TenSP = p.TenSP;
            GiaTien = p.GiaSP;
            SoLuong = 1;
        }
      
    }
}