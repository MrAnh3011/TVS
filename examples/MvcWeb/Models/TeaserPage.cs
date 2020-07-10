/*
 * Copyright (c) .NET Foundation and Contributors
 *
 * This software may be modified and distributed under the terms
 * of the MIT license.  See the LICENSE file for details.
 *
 * http://github.com/tidyui/coreweb
 *
 */

using System.Collections.Generic;
using MvcWeb.Models.Regions;
using Piranha.AttributeBuilder;
using Piranha.Extend;
using Piranha.Extend.Fields;
using Piranha.Models;

namespace MvcWeb.Models
{
    /// <summary>
    /// Basic page with main content in markdown.
    /// </summary>
    [PageType(Title = "Trang chủ", UseBlocks = false)]
    [PageTypeRoute(Title = "Default", Route = "/teaserpage")]
    public class TeaserPage : Page<TeaserPage>
    {
        [Region(Display = RegionDisplayMode.Full, Title = "Ảnh trang chủ", ListTitle = "Ảnh trang chủ", ListPlaceholder = "Ảnh trang chủ")]
        public IList<ImageField> indexPicture { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Shortcut", ListTitle = "Shortcut", ListPlaceholder = "Shortcut")]
        public IList<ImageTitle> lstShortcut { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Dịch vụ CC& TT", ListTitle = "Dịch vụ CC& TT", ListPlaceholder = "Dịch vụ CC& TT")]
        public IList<ImageTitleSubtt> lstServices { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Tin tức", ListTitle = "Tin tức", ListPlaceholder = "Tin tức")]
        public IList<PostField> lstNews { get; set; }
    }
}
