using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Piranha.Repositories
{
    public interface IUserLoginRepository
    {
        Task<IEnumerable<UserLogin>> GetAll(Guid siteId);

        Task<UserLogin> GetById(Guid id);

        Task<bool> GetResultByLoginPass(string username, string password);

        Task Save(UserLogin model);

        Task Delete(Guid id);
    }
}
