using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Piranha.Services
{
    public interface ILoginService
    {
        Task<IEnumerable<Login>> GetAllAsync(Guid? siteId = null);

        Task<Login> GetByIdAsync(Guid id);

        Task<bool> GetResultByLoginPassAsync(string username, string password);

        Task SaveAsync(Login model);

        Task DeleteAsync(Guid id);
    }
}
