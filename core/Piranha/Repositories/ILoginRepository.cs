using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Piranha.Repositories
{
    public interface ILoginRepository
    {
        Task<IEnumerable<Login>> GetAll(Guid siteId);

        Task<Login> GetById(Guid id);

        Task<bool> GetResultByLoginPass(string username, string password);

        Task Save(Login model);

        Task Delete(Guid id);
    }
}
