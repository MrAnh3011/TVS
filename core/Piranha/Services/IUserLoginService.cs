using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Piranha.Services
{
    public interface IUserLoginService
    {
        Task<IEnumerable<UserLogin>> GetAllAsync(Guid? siteId = null);

        Task<UserLogin> GetByIdAsync(Guid id);

        Task<bool> GetResultByLoginPassAsync(string username, string password);

        Task SaveAsync(UserLogin model);

        Task DeleteAsync(Guid id);
    }
}
