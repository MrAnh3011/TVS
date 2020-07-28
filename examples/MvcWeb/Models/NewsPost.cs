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
        [Region(Display = RegionDisplayMode.Full, Title = "Banner", ListTitle = "Banner", ListPlaceholder = "Banner")]
        public ImageTitle Banner { get; set; }

        [Region(Display = RegionDisplayMode.Full, Title = "Vị trí đang tuyển (chỉ dùng cho bài tuyển dụng)", ListTitle = "Vị trí đang tuyển (chỉ dùng cho bài tuyển dụng)", ListPlaceholder = "Vị trí đang tuyển (chỉ dùng cho bài tuyển dụng)")]
        public RecruitInfo Recruit { get; set; }

        [Region(Display = RegionDisplayMode.Full, Title = "Giới hạn hiển thị (Yes/No - Chỉ dùng với bài tin tức)", ListTitle = "Giới hạn hiển thị (Yes/No - Chỉ dùng với bài tin tức)", ListPlaceholder = "Giới hạn hiển thị (Yes/No - Chỉ dùng với bài tin tức)")]
        public StringField LoginOnly { get; set; }
    }
}
