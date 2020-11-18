using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Security.Cryptography.Xml;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Piranha;
using Piranha.AspNetCore.Services;
using Piranha.Data;
using Piranha.Data.EF.SQLServer.Migrations;

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
        [Route("upload")]
        public JsonResult UploadFile()
        {
            var file = Request.Form.Files.First();
            string fullName = Request.Form["FullName"].ToString();
            string sex = Request.Form["Sex"].ToString();
            string phone = Request.Form["Phone"].ToString();
            string email = Request.Form["Email"].ToString();
            string place = Request.Form["Place"].ToString();
            string locate = Request.Form["Locate"].ToString();
            string sender = Request.Form["Sender"].ToString();
            string receiver = Request.Form["Receiver"].ToString();
            string senderpass = Request.Form["SenderPass"].ToString();

            string body = "";
            body += "Họ và tên: " + fullName + "\n";
            body += "Giới tính: " + sex + "\n";
            body += "Điện thoại: " + phone + "\n";
            body += "Email: " + email + "\n";
            body += "Địa điểm ứng tuyển: " + place + "\n";
            body += "Vị trí ứng tuyển: " + locate + "\n";

            MailModel mm = new MailModel
            {
                To = receiver,
                Subject = "Ứng tuyển TVS",
                Body = body,
                From = sender,
                FromPass = senderpass,
                File = file
            };

            var result = SendMail(mm);
            return Json(new { status = "success", message = "success"});
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

            if(info.Captcha != null)
            {
                var client = new WebClient();
                var reply = client.DownloadString(
                    string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", 
                    "6LfOQcEZAAAAAH02-OafulPuYOl_D-6PHqrC7lhj", info.Captcha));

                if (!reply.Contains("success"))
                {
                    return Json(new { status = "error", message = "error" });
                }
            }

            if(info.File != null)
            {
                mm.Attachments.Add(new Attachment(info.File.OpenReadStream(), info.File.FileName));
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

        [HttpPost]
        [Route("login")]
        public JsonResult Login(LogInfo model)
        {
            string email = model.email;
            string pass = model.password;

            try
            {
                List<Piranha.Data.Login> lstLogin = _db.Logins.Where(x => x.UserMail == email && x.UserPassWord == pass).ToList();

                if (lstLogin.Count > 0)
                    return Json(new { status = "success", message = "Đăng nhập thành công", data = lstLogin });
                else return Json(new { status = "error", message = "Đăng nhập thất bại", data = "" });
            }
            catch (Exception)
            {
                return Json(new { status = "error", message = "Lỗi không xác định", data = "" });
            }
        }

        [HttpPost]
        [Route("register")]
        public async Task<JsonResult> Register(LoginModel model)
        {
            try
            {
                var result = await _db.Logins.Where(x => x.UserMail == model.Email).FirstOrDefaultAsync().ConfigureAwait(false);
                if (result != null)
                {
                    return Json(new { status = "error", message = "Tài khoản đã tồn tại" });
                }

                Login mod = new Login();

                mod.Id = Guid.NewGuid();
                mod.SiteId = new Guid("B5951303-713E-4A58-8684-079EE924170E");
                mod.UserMail = model.Email == "" ? " " : model.Email;
                mod.UserPassWord = model.Password == "" ? " " : model.Password;
                mod.UserName = model.FullName == "" ? " " : model.FullName;
                mod.UserPhone = model.Phone == "" ? " " : model.Phone;
                mod.UserFacebook = model.FbAddress == "" ? " " : model.FbAddress;
                mod.UserCare = model.UserCare == "" ? " " : model.UserCare;
                mod.Created = DateTime.Now;
                mod.LastModified = DateTime.Now;

                await _db.Logins.AddAsync(mod).ConfigureAwait(false);
                await _db.SaveChangesAsync().ConfigureAwait(false);
                return Json(new { status = "success", message = "Thêm thành công" });
            }
            catch (Exception)
            {
                return Json(new { status = "error", message = "Thêm thất bại" });
            }
        }


        [HttpPost]
        [Route("forgotpass")]
        public async Task<JsonResult> ForgotPass(LogInfo model)
        {
            try
            {
                Login result = await _db.Logins.Where(x => x.UserMail == model.email).FirstOrDefaultAsync().ConfigureAwait(false);

                if (result != null)
                {
                    result.UserPassWord = model.password;
                    await _db.SaveChangesAsync().ConfigureAwait(false);
                    return Json(new { status = "success", message = "Sửa thành công" });
                }
                else
                    return Json(new { status = "error", message = "Sửa thất bại" });
            }
            catch (Exception)
            {
                return Json(new { status = "error", message = "Sửa thất bại" });
            }
        }
    };
    public class MailModel
    {
        public string From { get; set; }
        public string FromPass { get; set; }
        public string To { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
        public IFormFile File { get; set; }
        public string Captcha { get; set; }
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

    public class LogInfo
    {
        public string email { get; set; }
        public string password { get; set; }
    }
}