﻿using MvcWeb.Models.Regions;
using Piranha.AttributeBuilder;
using Piranha.Extend;
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

        [Region(Display = RegionDisplayMode.Full, Title = "Vị trí đang tuyển", ListTitle = "Vị trí đang tuyển", ListPlaceholder = "Vị trí đang tuyển")]
        public RecruitInfo Recruit { get; set; }
    }
}
