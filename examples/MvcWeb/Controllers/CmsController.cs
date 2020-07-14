/*
 * Copyright (c) .NET Foundation and Contributors
 *
 * This software may be modified and distributed under the terms
 * of the MIT license.  See the LICENSE file for details.
 *
 * http://github.com/piranhacms/piranha.core
 *
 */

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MvcWeb.Models;
using Piranha;
using Piranha.AspNetCore.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

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
        [Route("newspage")]
        public async Task<IActionResult> NewsPage(Guid id, bool startpage = false, bool draft = false)
        {
            string urlLang = GetLangByPage(id);
            var model = await _loader.GetPageAsync<NewsPage>(id, HttpContext.User, draft);
            model.Permalink = urlLang + model.Permalink;

            ViewBag.urlLang = urlLang;
            model.Archive = await _api.Archives.GetByIdAsync(id);
            var lstCategory = await _api.Posts.GetAllCategoriesAsync(id);
            ViewBag.lstCategory = lstCategory;
            return View(model);
        }

        [HttpGet]
        [Route("recruitpage")]
        public async Task<IActionResult> RecruitPage(Guid id, bool startpage = false, bool draft = false)
        {
            string urlLang = GetLangByPage(id);
            var model = await _loader.GetPageAsync<RecruitPage>(id, HttpContext.User, draft);
            model.Permalink = urlLang + model.Permalink;

            ViewBag.urlLang = urlLang;
            model.Archive = await _api.Archives.GetByIdAsync(id);
            return View(model);
        }

        [Route("categorypage/{keyword?}")]
        public async Task<IActionResult> CategoryPage(Guid id, string keyword, bool startpage = false, bool draft = false)
        {
            string urlLang = GetLangByPage(id);
            var model = await _loader.GetPageAsync<CategoryPage>(id, HttpContext.User, draft);
            model.Permalink = urlLang + model.Permalink;

            ViewBag.urlLang = urlLang;
            var categoryId = _db.Categories.Where(x => x.Slug == keyword).ToList();
            var categoryName = categoryId[0].Title;
            var listPost = _db.Posts.Where(x => x.CategoryId == categoryId[0].Id).ToList();
            var lstPostInfo = new List<NewsPost>();
            foreach (var item in listPost)
            {
                var tmpPost = await _loader.GetPostAsync<NewsPost>(item.Id, HttpContext.User, false);
                lstPostInfo.Add(tmpPost);
            }
            var blogId = listPost[0].BlogId;

            var modelPage = await _loader.GetPageAsync<NewsPage>(blogId, HttpContext.User, draft);
            var listCategory = await _api.Posts.GetAllCategoriesAsync(blogId);

            ViewBag.categoryName = categoryName;
            ViewBag.listPost = lstPostInfo;
            ViewBag.listCategory = listCategory;
            ViewBag.listHighLight = modelPage.lstHighlight;
            return View(model);
        }

        [HttpGet]
        [Route("post")]
        public async Task<IActionResult> Post(Guid id, bool draft = false)
        {
            string urlLang = GetLangByPost(id);
            var model = await _loader.GetPostAsync<NewsPost>(id, HttpContext.User, draft);
            model.Permalink = urlLang + model.Permalink;

            ViewBag.urlLang = urlLang;
            if (model.Permalink.Contains("tin-tuc") || model.Permalink.Contains("news"))
            {
                var newsModel = await _api.Pages.GetByIdAsync<NewsPage>(model.BlogId);
                var lstPostRelated = _db.Posts.Where(x => x.CategoryId == model.Category.Id).AsNoTracking();
                var lstCategory = await _api.Posts.GetAllCategoriesAsync(model.BlogId);

                var lstRelated = new List<NewsPost>();
                foreach(var item in lstPostRelated)
                {
                    var res = await _loader.GetPostAsync<NewsPost>(item.Id, HttpContext.User, false);
                    lstRelated.Add(res);
                }

                ViewBag.lstCategory = lstCategory;
                ViewBag.lstHightLight = newsModel.lstHighlight;
                ViewBag.lstRelated = lstRelated;

                return View(model);
            }
            else
            {
                var newsModel = await _api.Pages.GetByIdAsync<RecruitPage>(model.BlogId);
                var lstJob = await _api.Posts.GetAllCategoriesAsync(model.BlogId);

                ViewBag.banner = newsModel.Banner;
                ViewBag.lstJob = lstJob;
                return View("RecruitPost", model);
            }
        }

        [HttpGet]
        [Route("teaserpage")]
        public async Task<IActionResult> TeaserPage(Guid id, bool startpage = false, bool draft = false)
        {
            string urlLang = GetLangByPage(id);
            var model = await _loader.GetPageAsync<TeaserPage>(id, HttpContext.User, draft);
            model.Permalink = urlLang + model.Permalink;

            ViewBag.urlLang = urlLang;
            return View("startpage", model);
        }

        [HttpGet]
        [Route("relationpage")]
        public async Task<IActionResult> RelationPage(Guid id, bool startpage = false, bool draft = false)
        {
            var urlLang = GetLangByPage(id);
            var model = await _loader.GetPageAsync<RelationPage>(id, HttpContext.User, draft);
            model.Permalink = urlLang + model.Permalink;

            ViewBag.urlLang = urlLang;
            return View(model);
        }

        [HttpGet]
        [Route("contactpage")]
        public async Task<IActionResult> ContactPage(Guid id, bool startpage = false, bool draft = false)
        {
            var urlLang = GetLangByPage(id);
            var model = await _loader.GetPageAsync<ContactPage>(id, HttpContext.User, draft);
            model.Permalink = urlLang + model.Permalink;

            ViewBag.urlLang = urlLang;
            return View(model);
        }

        [HttpGet]
        [Route("intropage/{keyword?}")]
        public async Task<IActionResult> IntroPage(Guid id, string keyword, bool startpage = false, bool draft = false)
        {
            var urlLang = GetLangByPage(id);
            var model = await _loader.GetPageAsync<IntroPage>(id, HttpContext.User, draft);
            model.Permalink = urlLang + model.Permalink;

            ViewBag.urlLang = urlLang;
            return View(model);
        }

        [HttpGet]
        [Route("servicespage")]
        public async Task<IActionResult> ServicesPage(Guid id, bool startpage = false, bool draft = false)
        {
            var model = await _loader.GetPageAsync<ServicesPage>(id, HttpContext.User, draft);
            return View(model);
        }

        [HttpGet]
        [Route("investbankpage")]
        public async Task<IActionResult> InvestbankPage(Guid id, bool startpage = false, bool draft = false)
        {
            var urlLang = GetLangByPage(id);
            var model = await _loader.GetPageAsync<InvestbankPage>(id, HttpContext.User, draft);
            model.Permalink = urlLang + model.Permalink;

            ViewBag.urlLang = urlLang;
            return View(model);
        }

        [HttpGet]
        [Route("agencypage")]
        public async Task<IActionResult> AgencyPage(Guid id, bool startpage = false, bool draft = false)
        {
            var urlLang = GetLangByPage(id);
            var model = await _loader.GetPageAsync<AgencyPage>(id, HttpContext.User, draft);
            model.Permalink = urlLang + model.Permalink;

            ViewBag.urlLang = urlLang;
            return View(model);
        }

        [HttpGet]
        [Route("reqopenacc")]
        public async Task<IActionResult> RequestOpenAcc(Guid id, bool startpage = false, bool draft = false)
        {
            var model = await _loader.GetPageAsync<RequestOpenAccPage>(id, HttpContext.User, draft);

            return View(model);
        }

        [HttpGet]
        [Route("login")]
        public async Task<IActionResult> LoginPage(Guid id, bool startpage = false, bool draft = false)
        {
            var urlLang = GetLangByPage(id);
            var model = await _loader.GetPageAsync<LoginPage>(id, HttpContext.User, draft);
            model.Permalink = urlLang + model.Permalink;

            ViewBag.urlLang = urlLang;
            return View(model);
        }

        [HttpGet]
        [Route("register")]
        public async Task<IActionResult> RegisterPage(Guid id, bool startpage = false, bool draft = false)
        {
            var urlLang = GetLangByPage(id);
            var model = await _loader.GetPageAsync<RegisterPage>(id, HttpContext.User, draft);
            model.Permalink = urlLang + model.Permalink;

            ViewBag.urlLang = urlLang;
            return View(model);
        }

        [Route("searchpage/{keyword?}")]
        public async Task<IActionResult> SearchPage(Guid id, string keyword, bool startpage = false, bool draft = false)
        {
            var urlLang = GetLangByPage(id);
            var model = await _loader.GetPageAsync<SearchPage>(id, HttpContext.User, draft);
            model.Permalink = urlLang + model.Permalink;
            var listPost = _db.Posts.Where(x => x.Title.Contains(keyword)).ToList();
            var newsPosts = new List<NewsPost>();
            foreach (var item in listPost)
            {
                var itemPosts = await _loader.GetPostAsync<NewsPost>(item.Id, HttpContext.User, draft);
                newsPosts.Add(itemPosts);
            }
            ViewBag.lstPosts = newsPosts;
            ViewBag.urlLang = urlLang;
            return View(model);
        }

        [HttpGet]
        [Route("forgotpass")]
        public async Task<IActionResult> ForgotPass(Guid id, bool startpage = false, bool draft = false)
        {
            var urlLang = GetLangByPage(id);
            var model = await _loader.GetPageAsync<ForgotPassword>(id, HttpContext.User, draft);
            model.Permalink = urlLang + model.Permalink;

            ViewBag.urlLang = urlLang;
            return View(model);
        }
        private string GetLangByPage(Guid id)
        {
            Guid siteID = _db.Pages.SingleOrDefault(x => x.Id == id).SiteId;
            string hostName = _db.Sites.SingleOrDefault(x => x.Id == siteID).Hostnames;
            return "/" + hostName.Split('/')[1];
        }
        private string GetLangByPost(Guid id)
        {
            Guid blogId = _db.Posts.SingleOrDefault(x => x.Id == id).BlogId;
            Guid siteId = _db.Pages.SingleOrDefault(x => x.Id == blogId).SiteId;
            string hostName = _db.Sites.SingleOrDefault(x => x.Id == siteId).Hostnames;
            return "/" + hostName.Split('/')[1];
        }
    }
}
