using MvcWeb.Models.Regions;
using Piranha.AttributeBuilder;
using Piranha.Data;
using Piranha.Extend;
using Piranha.Extend.Fields;
using Piranha.Models;
using System.Collections.Generic;

namespace MvcWeb.Models
{
    [PageType(Title = "Tin tức", UseBlocks = false, IsArchive = true)]
    [PageTypeRoute(Title = "NewsPage", Route = "/newspage")]
    public class NewsPage : Page<NewsPage>
    {
        [Region(Display = RegionDisplayMode.Full, Title = "Banner", ListTitle = "Banner", ListPlaceholder = "Banner")]
        public ImageTitle Banner { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Tin tức", ListTitle = "Tin tức", ListPlaceholder = "Tin tức")]
        public PostArchive<DynamicPost> Archive { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Tin nổi bật", ListTitle = "Tin nổi bật", ListPlaceholder = "Tin nổi bật")]
        public IList<Piranha.Extend.Fields.PostField> lstHighlight { get; set; }
    }
}
