using Piranha.Manager.Models;
using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Piranha.Manager.Services
{
    public class LoginService
    {
        private readonly IApi _api;

        public LoginService(IApi api)
        {
            _api = api;
        }

        public async Task<LoginListModel> GetList(Guid? siteId = null)
        {
            Site site = null;

            // Ensure that we have a site id
            if (!siteId.HasValue)
            {
                site = await _api.Sites.GetDefaultAsync();
                siteId = site.Id;
            }

            if (site == null)
            {
                site = await _api.Sites.GetByIdAsync(siteId.Value);
            }

            var model = new LoginListModel
            {
                SiteId = siteId.Value,
                SiteTitle = site.Title
            };

            // Get all available sites
            var sites = await _api.Sites.GetAllAsync();
            model.Sites = sites.Select(s => new LoginListModel.SiteItem
            {
                Id = s.Id,
                Title = s.Title
            }).ToList();

            // Get all available aliases for the current site
            var userlogins = await _api.UserLogins.GetAllAsync(siteId.Value);
            model.Items = userlogins.Select(a => new LoginListModel.ListItem
            {
                Id = a.Id,
                SiteId = a.SiteId,
                UserName = a.UserName == null ? "" : a.UserName,
                UserPassWord = a.UserPassWord == null ? "" : a.UserPassWord,
                UserPhone = a.UserPhone == null ? "" : a.UserPhone,
                UserMail = a.UserMail == null ? "" : a.UserMail,
                UserFacebook = a.UserFacebook == null ? "" : a.UserFacebook,
                UserCare = a.UserCare == null ? "" : a.UserCare,
            }).ToList();

            return model;
        }

        public async Task Save(LoginListModel.ListItem model)
        {
            await _api.UserLogins.SaveAsync(new Login
            {
                Id = model.Id.HasValue ? model.Id.Value : Guid.NewGuid(),
                SiteId = model.SiteId,
                UserName = model.UserName,
                UserPassWord = model.UserPassWord,
                UserMail = model.UserMail,
                UserPhone = model.UserPhone,
                UserFacebook = model.UserFacebook,
                UserCare = model.UserCare
            });
        }


        public async Task<LoginListModel.ListItem> Delete(Guid id)
        {
            var userLogin = await _api.UserLogins.GetByIdAsync(id);

            if (userLogin != null)
            {
                await _api.UserLogins.DeleteAsync(userLogin.Id);

                return new LoginListModel.ListItem
                {
                    Id = userLogin.Id,
                    SiteId = userLogin.SiteId,
                    UserName = userLogin.UserName,
                    UserPassWord = userLogin.UserPassWord,
                    UserMail = userLogin.UserMail,
                    UserPhone = userLogin.UserPhone,
                    UserFacebook = userLogin.UserFacebook,
                    UserCare = userLogin.UserCare
                };
            }
            return null;
        }
    }
}
