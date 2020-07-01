using MvcWeb.Models.Regions;
using Piranha.AttributeBuilder;
using Piranha.Extend;
using Piranha.Models;

namespace MvcWeb.Models
{
    [PageType(Title = "Tìm kiếm", UseBlocks = false)]
    [PageTypeRoute(Title = "Search", Route = "/searchpage")]
    public class SearchPage : Page<SearchPage>
    {
        [Region(Display = RegionDisplayMode.Full, Title = "Banner", ListTitle = "Banner", ListPlaceholder = "Banner")]
        public ImageTitle Banner { get; set; }
    }
}
