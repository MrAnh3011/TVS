using Piranha.AttributeBuilder;
using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MvcWeb.Models
{
    [PageType(Title = "Quên mật khẩu", UseBlocks = false)]
    [PageTypeRoute(Title = "Forgot Pass", Route = "/forgotpass")]
    public class ForgotPassword : Page<ForgotPassword>
    {
    }
}
