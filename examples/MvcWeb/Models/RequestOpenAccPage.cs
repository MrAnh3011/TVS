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
        public StringField ReceiverEmail { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Tài khoản gửi mail", ListTitle = "Tài khoản gửi mail", ListPlaceholder = "Tài khoản gửi mail")]
        public StringField SenderEmail { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Mật khẩu tk gửi", ListTitle = "Mật khẩu tk gửi", ListPlaceholder = "Mật khẩu tk gửi")]
        public StringField SenderPass { get; set; }
    }
}
