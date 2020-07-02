using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Piranha;
using Piranha.AspNetCore.Services;
using Piranha.Data;

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

        public JsonResult Login(LoginModel model)
        {

            return Json( new { });
        }

        public JsonResult Register (LoginModel model)
        {
            Login mod = new Login();

            mod.UserMail = model.Email;
            mod.UserPassWord = model.Password;
            mod.UserName = model.FullName;
            mod.UserPhone = model.Phone;
            mod.UserFacebook = model.FbAddress;
            mod.UserCare = model.UserCare;
            mod.Id = Guid.NewGuid();

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

    public class LoginModel
    {
        public string Email { get; set; }
        public string Password { get; set; }
        public string FullName { get; set; }
        public string Phone { get; set; }
        public string FbAddress { get; set; }
        public string UserCare { get; set; }
        public string SendOpenAcc { get; set; }
    }
}