using Microsoft.AspNetCore.Mvc.RazorPages;
using Piranha.AttributeBuilder;
using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MvcWeb.Models
{
    [PageType(Title = "Đăng nhập", UseBlocks = false)]
    [PageTypeRoute(Title = "Login", Route = "/login")]
    public class LoginPage : Page<LoginPage>
    {
    }
}
