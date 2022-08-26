using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FastFood.Models
{
    public class ViewProduct
    {
        public IQueryable<SanPham> ViewProducts { get; set; }
        public string TimKiem { get; set; }
        public IEnumerable<LoaiSanPham>  ViewLoaiSP { get; set; }
        public Dictionary<string, string> Sorts { get; set; }

        //public IEnumerable<SelectListItem> LocSP
        //{
        //    get
        //    {
        //        var allC = ViewLoaiSP.Select(s => new SelectListItem
        //        {
        //            Value = s.Te,
        //            Text = s.CatNameWithCount

        //        });
        //        return allC;
        //    }    
        //}    
    }
    public class CategoryWithCount
    {
        public int ProductCount { get; set; }
        public string CategoryName { get; set; }
        public string CatNameWithCount
        {
            get
            {
                return CategoryName + "(" + ProductCount.ToString() + ")";
            }
        }
    }
}