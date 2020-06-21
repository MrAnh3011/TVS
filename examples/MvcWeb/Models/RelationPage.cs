using MvcWeb.Models.Regions;
using Piranha.AttributeBuilder;
using Piranha.Extend;
using Piranha.Extend.Fields;
using Piranha.Models;
using System.Collections.Generic;

namespace MvcWeb.Models
{
    [PageType(Title = "Quan hệ cổ đông", UseBlocks = false)]
    [PageTypeRoute(Title = "Relations", Route = "/relationpage")]
    public class RelationPage : Page<RelationPage>
    {
        [Region(Display = RegionDisplayMode.Full, Title = "Banner", ListTitle = "Banner", ListPlaceholder = "Banner")]
        public ImageTitle Banner { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Mô hình quản trị", ListTitle = "Mô hình quản trị", ListPlaceholder = "Mô hình quản trị")]
        public ImageTitle ManagementModel { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Công bố thông tin", ListTitle = "Công bố thông tin", ListPlaceholder = "Công bố thông tin")]
        public IList<DocumentFile> lstPublish { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Báo cáo quản trị", ListTitle = "Báo cáo quản trị", ListPlaceholder = "Báo cáo quản trị")]
        public IList<DocumentFile> lstAdminReport { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Báo cáo tài chính quý", ListTitle = "Báo cáo tài chính quý", ListPlaceholder = "Báo cáo tài chính quý")]
        public IList<DocumentFile> lstFinancialReport { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Báo cáo tài chính giữa năm", ListTitle = "Báo cáo tài chính giữa năm", ListPlaceholder = "Báo cáo tài chính giữa năm")]
        public IList<DocumentFile> lstMiddleReport { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Báo cáo tài chính năm", ListTitle = "Báo cáo tài chính năm", ListPlaceholder = "Báo cáo tài chính năm")]
        public IList<DocumentFile> lstYearlyReport { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Báo cáo chỉ tiêu an toàn tài chính", ListTitle = "Báo cáo chỉ tiêu an toàn tài chính", ListPlaceholder = "Báo cáo chỉ tiêu an toàn tài chính")]
        public IList<DocumentFile> lstIndicatorReport { get; set; }
    }
}
