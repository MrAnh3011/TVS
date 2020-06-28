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
    [PageType(Title = "Tuyển dụng",IsArchive = true, UseBlocks = false)]
    [PageTypeRoute(Title = "Recruit Page", Route = "/recruitpage")]
    public class RecruitPage : Page<RecruitPage>
    {
        [Region(Display = RegionDisplayMode.Full, Title = "Banner", ListTitle = "Banner", ListPlaceholder = "Banner")]
        public ImageTitle Banner { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Tham gia với chúng tôi", ListTitle = "Tham gia với chúng tôi", ListPlaceholder = "Tham gia với chúng tôi")]
        public JoinWithMe JWMe { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Vị trí đang tuyển", ListTitle = "Vị trí đang tuyển", ListPlaceholder = "Vị trí đang tuyển")]
        public PostArchive<DynamicPost> Archive { get; set; }
    }
}
