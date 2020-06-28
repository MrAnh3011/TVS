using MvcWeb.Models.Regions;
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
    [PageType(Title = "Liên hệ", UseBlocks = false)]
    [PageTypeRoute(Title = "Contact", Route = "/contactpage")]
    public class ContactPage : Page<ContactPage>
    {
        [Region(Display = RegionDisplayMode.Full, Title = "Banner", ListTitle = "Banner", ListPlaceholder = "Banner")]
        public ImageTitle Banner { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Thông tin liên hệ", ListTitle = "Thông tin liên hệ", ListPlaceholder = "Thông tin liên hệ")]
        public IList<ContactItem> lstContact { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Giới thiệu", ListTitle = "Giới thiệu", ListPlaceholder = "Giới thiệu")]
        public HtmlField Intro { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Người nhận mail", ListTitle = "Người nhận mail", ListPlaceholder = "Người nhận mail")]
        public StringField MailReceiver { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Người gửi mail", ListTitle = "Người gửi mail", ListPlaceholder = "Người gửi mail")]
        public StringField MailSender { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Mật khẩu mail", ListTitle = "Mật khẩu mail", ListPlaceholder = "Mật khẩu mail")]
        public StringField MailSenderPass { get; set; }
    }
}
