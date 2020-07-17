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
    [PageType(Title = "Phân tích", UseBlocks = false, IsArchive = true)]
    [PageTypeRoute(Title = "AnalyzePage", Route = "/analyze")]
    public class AnalyzePage : Page<AnalyzePage>
    {
        [Region(Display = RegionDisplayMode.Full, Title = "Banner", ListTitle = "Banner", ListPlaceholder = "Banner")]
        public ImageTitle Banner { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Phân tích", ListTitle = "Phân tích", ListPlaceholder = "Phân tích")]
        public PostArchive<DynamicPost> Archive { get; set; }
    }
}
