/*
 * Copyright (c) .NET Foundation and Contributors
 *
 * This software may be modified and distributed under the terms
 * of the MIT license.  See the LICENSE file for details.
 *
 * http://github.com/piranhacms/piranha.core
 *
 */

using System;
using System.Linq;
using System.Net.WebSockets;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Piranha;
using Piranha.AspNetCore.Services;
using Piranha.Models;

namespace MvcWeb.Controllers
{
    public class CmsController : Controller
    {
        private readonly IApi _api;
        private readonly IDb _db;
        private readonly IModelLoader _loader;

        public CmsController(IApi api, IDb db, IModelLoader loader)
        {
            _api = api;
            _db = db;
            _loader = loader;
        }

        [HttpGet]
        [Route("archive")]
        public async Task<IActionResult> Archive(Guid id, int? year = null, int? month = null, int? page = null,
            Guid? category = null, Guid? tag = null)
        {
            var model = await _api.Pages.GetByIdAsync<Models.BlogArchive>(id);
            model.Archive = await _api.Archives.GetByIdAsync(id, page, category, tag, year, month);

            return View(model);
        }

        [HttpGet]
        [Route("page")]
        public async Task<IActionResult> Page(Guid id, bool draft = false)
        {
            var model = await _loader.GetPageAsync<Models.StandardPage>(id, HttpContext.User, draft);

            return View(model);
        }

        [HttpGet]
        [Route("pagewide")]
        public async Task<IActionResult> PageWide(Guid id, bool draft = false)
        {
            var model = await _loader.GetPageAsync<Models.StandardPage>(id, HttpContext.User, draft);

            return View(model);
        }

        [HttpGet]
        [Route("post")]
        public async Task<IActionResult> Post(Guid id, bool draft = false)
        {
            var model = await _loader.GetPostAsync<Models.BlogPost>(id, HttpContext.User, draft);

            return View(model);
        }

        [HttpGet]
        [Route("teaserpage")]
        public async Task<IActionResult> TeaserPage(Guid id, bool startpage = false, bool draft = false)
        {
            var model = await _loader.GetPageAsync<Models.TeaserPage>(id, HttpContext.User, draft);
            return View("startpage",model);
        }

        [HttpGet]
        [Route("relationpage")]
        public async Task<IActionResult> RelationPage(Guid id, bool startpage = false, bool draft = false)
        {
            var model = await _loader.GetPageAsync<Models.RelationPage>(id, HttpContext.User, draft);
            //var siteLang = GetLangByPage(id);
            //if (siteLang.Contains("/en"))
            //{
            //    ViewBag.PublishInfo = "Disclosure";
            //    ViewBag.AdminReport = "Admin report";
            //    ViewBag.FinancialReport = "Quarterly financial statements";
            //    ViewBag.MiddleReport = "Mid-year financial statements";
            //    ViewBag.YearlyReport = "Annual financial reports";
            //    ViewBag.IndicatorReport = "Report financial safety criteria";
            //}
            //else
            //{
            ViewBag.PublishInfo = "Công bố thông tin";
            ViewBag.AdminReport = "Báo cáo quản trị";
            ViewBag.FinancialReport = "Báo cáo tài chính quý";
            ViewBag.MiddleReport = "Báo cáo tài chính giữa năm";
            ViewBag.YearlyReport = "Báo cáo tài chính năm";
            ViewBag.IndicatorReport = "Báo cáo chỉ tiêu an toàn tài chính";
            //}
            return View(model);
        }

        [HttpGet]
        [Route("contactpage")]
        public async Task<IActionResult> ContactPage(Guid id, bool startpage = false, bool draft = false)
        {
            var model = await _loader.GetPageAsync<Models.ContactPage>(id, HttpContext.User, draft);

            return View(model);
        }

        [HttpGet]
        [Route("intropage")]
        public async Task<IActionResult> IntroPage(Guid id, bool startpage = false, bool draft = false)
        {
            var model = await _loader.GetPageAsync<Models.ContactPage>(id, HttpContext.User, draft);


            return View(model);
        }

        private string GetLangByPage(Guid id)
        {
            Guid siteID = _db.Pages.SingleOrDefault(x => x.Id == id).SiteId;
            string hostName = _db.Sites.SingleOrDefault(x => x.Id == siteID).Hostnames;
            return "/" + hostName.Split('/')[1];
        }
    }
}
