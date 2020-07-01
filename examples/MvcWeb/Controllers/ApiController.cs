using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Piranha;
using Piranha.AspNetCore.Services;

namespace MvcWeb.Controllers
{
    [Route("api")]
    [ApiController]
    public class ApiController : Controller
    {
        private readonly IApi _api;
        private readonly IDb _db;
        private readonly IModelLoader _loader;

        public ApiController(IApi api, IDb db, IModelLoader loader)
        {
            _api = api;
            _db = db;
            _loader = loader;
        }

        [HttpPost]
        [Route("sendmail")]
        public JsonResult SendMail(MailModel info)
        {
            MailMessage mm = new MailMessage();
            mm.To.Add(info.To);
            mm.Subject = info.Subject;
            mm.Body = info.Body;
            mm.From = new MailAddress(info.From);
            mm.IsBodyHtml = false;

            if(info.MailPath != null)
            {
                Attachment attachment = new Attachment(info.MailPath);
                mm.Attachments.Add(attachment);
            }

            try
            {
                SmtpClient smtp = new SmtpClient("smtp.gmail.com");
                smtp.Port = 587;
                smtp.UseDefaultCredentials = true;
                smtp.EnableSsl = true;
                smtp.Credentials = new System.Net.NetworkCredential(info.From, info.FromPass);
                smtp.Send(mm);
            }
            catch (Exception e)
            {
                return Json(new { status = "error", message = e.Message });
            }
            return Json(new { status = "success", message = "Thêm thành công" });
        }
    };
    public class MailModel
    {
        public string From { get; set; }
        public string FromPass { get; set; }
        public string To { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
        public string MailPath { get; set; }
    }
}