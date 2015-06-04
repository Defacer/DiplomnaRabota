﻿//using DatabaseChange.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RealTimeChart.Controllers
{
    public class HomeController : Controller
    {
        //JobInfoRepository objRepo = new JobInfoRepository();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Chart(string id)
        {
            ViewBag.CustomValue = id;
            var ttt = ViewBag.CustomValue;
            return View();
        }
        //public JsonResult Result()
       // {
           // var result = objRepo.GetData();

           // return Json(result, JsonRequestBehavior.AllowGet);
        //}
        public ActionResult Status()
        {
            return View();
        }

    }
}