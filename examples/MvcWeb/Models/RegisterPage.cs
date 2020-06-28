using Piranha.AttributeBuilder;
using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MvcWeb.Models
{
    [PageType(Title = "Đăng ký", UseBlocks = false)]
    [PageTypeRoute(Title = "Register", Route = "/register")]
    public class RegisterPage : Page<RegisterPage>
    {
    }
}
