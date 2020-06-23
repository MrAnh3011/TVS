using MvcWeb.Models.Regions;
using Piranha.AttributeBuilder;
using Piranha.Extend;
using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MvcWeb.Models
{
    [PageType(Title = "Giới thiệu", UseBlocks = false)]
    [PageTypeRoute(Title = "Introduction", Route = "/intropage")]
    public class IntroPage : Page<IntroPage>
    {
        [Region(Display = RegionDisplayMode.Full, Title = "Banner", ListTitle = "Banner", ListPlaceholder = "Banner")]
        public ImageTitle Banner { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Tổng quan", ListTitle = "Tổng quan", ListPlaceholder = "Tổng quan")]
        public TextHtml Overview { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Hội đồng quản trị", ListTitle = "Hội đồng quản trị", ListPlaceholder = "Hội đồng quản trị")]
        public IList<Management> Directory { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Ban điều hành", ListTitle = "Ban điều hành", ListPlaceholder = "Ban điều hành")]
        public IList<Management> lstExecutive { get; set; }
    }
}
