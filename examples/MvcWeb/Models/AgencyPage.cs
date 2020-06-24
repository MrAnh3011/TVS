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
    [PageType(Title = "Môi giới", UseBlocks = false)]
    [PageTypeRoute(Title = "Agency", Route = "/agencypage")]
    public class AgencyPage : Page<AgencyPage>
    {
        [Region(Display = RegionDisplayMode.Full, Title = "Banner", ListTitle = "Banner", ListPlaceholder = "Banner")]
        public ImageTitle Banner { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Giới thiệu dịch vụ môi giới", ListTitle = "Giới thiệu dịch vụ môi giới", ListPlaceholder = "Giới thiệu dịch vụ môi giới")]
        public HtmlField IntroServices { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Giao dịch trực tuyến", ListTitle = "Giao dịch trực tuyến", ListPlaceholder = "Giao dịch trực tuyến")]
        public HtmlField OnlineTrading { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Hỗ trợ giao dịch", ListTitle = "Hỗ trợ giao dịch", ListPlaceholder = "Hỗ trợ giao dịch")]
        public HtmlField SupportTrading { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Dịch vụ tài chính", ListTitle = "Dịch vụ tài chính", ListPlaceholder = "Dịch vụ tài chính")]
        public HtmlField FinancialServices { get; set; }

    }
}
