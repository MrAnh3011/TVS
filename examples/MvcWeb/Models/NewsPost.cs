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
    [PostType(Title = "Tin tức")]
    public class NewsPost : Post<NewsPost>
    {
        [Region(Display = RegionDisplayMode.Full, Title = "Vị trí đang tuyển (chỉ dùng cho bài tuyển dụng)", ListTitle = "Vị trí đang tuyển (chỉ dùng cho bài tuyển dụng)", ListPlaceholder = "Vị trí đang tuyển (chỉ dùng cho bài tuyển dụng)")]
        public RecruitInfo Recruit { get; set; }

        [Region(Display = RegionDisplayMode.Full, Title = "Có thể quan tâm (chỉ dùng cho bài tuyển dụng)", ListTitle = "Có thể quan tâm (chỉ dùng cho bài tuyển dụng)", ListPlaceholder = "Có thể quan tâm (chỉ dùng cho bài tuyển dụng)")]
        public IList<PostField> lstMayCare { get; set; }
    }
}
