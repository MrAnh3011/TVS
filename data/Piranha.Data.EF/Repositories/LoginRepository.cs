using Microsoft.EntityFrameworkCore;
using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Piranha.Repositories
{
    public class LoginRepository : ILoginRepository
    {
        private readonly IDb _db;
        public LoginRepository(IDb db)
        {
            _db = db;
        }
        public async Task Delete(Guid id)
        {
            var userlogins = await _db.Logins.FirstOrDefaultAsync(x => x.Id == id).ConfigureAwait(false);
            if (userlogins != null)
            {
                _db.Logins.Remove(userlogins);
                await _db.SaveChangesAsync().ConfigureAwait(false);
            }
        }

        public async Task<IEnumerable<Login>> GetAll(Guid siteId)
        {
            var query = await _db.Logins.AsNoTracking()
                .Where(x => x.SiteId == siteId)
                .OrderBy(x => x.UserName)
                .ThenBy(x => x.UserMail)
                .Select(x => new Login
                {
                    Id = x.Id,
                    SiteId = x.SiteId,
                    UserName = x.UserName,
                    UserPassWord = x.UserPassWord,
                    UserPhone = x.UserPhone,
                    UserMail = x.UserMail,
                    UserFacebook = x.UserFacebook,
                    UserCare = x.UserCare,
                    Created = x.Created,
                    LastModified = x.LastModified
                })
                .ToListAsync()
                .ConfigureAwait(false);
            return query;
        }

        public Task<Login> GetById(Guid id)
        {
            return _db.Logins
                .AsNoTracking()
                .Where(x => x.Id == id)
                .Select(x => new Login
                {
                    Id = x.Id,
                    SiteId = x.SiteId,
                    UserName = x.UserName,
                    UserPassWord = x.UserPassWord,
                    UserPhone = x.UserPhone,
                    UserMail = x.UserMail,
                    UserFacebook = x.UserFacebook,
                    UserCare = x.UserCare,
                    Created = x.Created,
                    LastModified = x.LastModified
                })
                .FirstOrDefaultAsync();
        }

        public async Task<bool> GetResultByLoginPass(string username, string password)
        {
            var result = await _db.Logins
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.UserMail == username && x.UserPassWord == password)
                .ConfigureAwait(false);
            if(result != null)
                return true;
            return false;
        }

        public async Task Save(Login model)
        {
            var userlogins = await _db.Logins.FirstOrDefaultAsync(x => x.Id == model.Id).ConfigureAwait(false);
            if (userlogins == null)
            {
                userlogins = new Data.Login
                {
                    Id = model.Id != Guid.Empty ? model.Id : Guid.NewGuid(),
                    Created = DateTime.Now
                };
                await _db.Logins.AddAsync(userlogins).ConfigureAwait(false);
            }
            userlogins.SiteId = model.SiteId;
            userlogins.UserName = model.UserName;
            userlogins.UserPassWord = model.UserPassWord;
            userlogins.UserPhone = model.UserPhone;
            userlogins.UserMail = model.UserMail;
            userlogins.UserFacebook = model.UserFacebook;
            userlogins.UserCare = model.UserCare;
            userlogins.LastModified = DateTime.Now;

            await _db.SaveChangesAsync().ConfigureAwait(false);
        }
    }
}
