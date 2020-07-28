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
    [PageType(Title = "Dịch vụ khác", UseBlocks = false, IsArchive = true)]
    [PageTypeRoute(Title = "OtherServicesPage", Route = "/otherservicespage")]
    public class OtherServicesPage : Page<OtherServicesPage>
    {
        [Region(Display = RegionDisplayMode.Full, Title = "Banner", ListTitle = "Banner", ListPlaceholder = "Banner")]
        public ImageTitle Banner { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Tin tức", ListTitle = "Tin tức", ListPlaceholder = "Tin tức")]
        public PostArchive<DynamicPost> Archive { get; set; }
    }
}
