using Piranha.Models;
using Piranha.Repositories;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Piranha.Services
{
    public class UserLoginService : IUserLoginService
    {
        private readonly IUserLoginRepository _repo;
        private readonly ISiteService _siteService;
        private readonly ICache _cache;

        public UserLoginService(IUserLoginRepository repo, ISiteService siteService, ICache cache)
        {
            _repo = repo;
            _siteService = siteService;

            if ((int)App.CacheLevel > 1)
            {
                _cache = cache;
            }
        }

        public async Task DeleteAsync(Guid id)
        {
            await _repo.Delete(id).ConfigureAwait(false);
        }

        public async Task<IEnumerable<UserLogin>> GetAllAsync(Guid? siteId = null)
        {
            if (!siteId.HasValue)
            {
                var site = await _siteService.GetDefaultAsync().ConfigureAwait(false);
                if (site != null)
                {
                    siteId = site.Id;
                }
            }

            if (siteId.HasValue)
            {
                return await _repo.GetAll(siteId.Value).ConfigureAwait(false);
            }
            return null;
        }

        public async Task<UserLogin> GetByIdAsync(Guid id)
        {
            var model = _cache?.Get<UserLogin>(id.ToString());

            if (model == null)
            {
                model = await _repo.GetById(id).ConfigureAwait(false);
            }
            return model;
        }

        public async Task<bool> GetResultByLoginPassAsync(string username, string password)
        {
            var model = await _repo.GetResultByLoginPass(username, password).ConfigureAwait(false);
            return model;
        }

        public async Task SaveAsync(UserLogin model)
        {
            await _repo.Save(model).ConfigureAwait(false);
        }
    }
}
