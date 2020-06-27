using Piranha.AttributeBuilder;
using Piranha.Extend;
using Piranha.Extend.Fields;
using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MvcWeb.Models
{
    [PageType(Title = "Gửi yêu cầu mở TK", UseBlocks = false)]
    [PageTypeRoute(Title = "RequestOpenAcc", Route = "/reqopenacc")]
    public class RequestOpenAccPage : Page<RequestOpenAccPage>
    {
        [Region(Display = RegionDisplayMode.Full, Title = "Tài khoản nhận mail", ListTitle = "Tài khoản nhận mail", ListPlaceholder = "Tài khoản nhận mail")]
        public StringField Email { get; set; }
    }
}
