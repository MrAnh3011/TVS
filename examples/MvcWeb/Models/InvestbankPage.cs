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
    [PageType(Title = "Ngân hàng đầu tư", UseBlocks = false)]
    [PageTypeRoute(Title = "InvestmentBank", Route = "/investbankpage")]
    public class InvestbankPage : Page<InvestbankPage>
    {
        [Region(Display = RegionDisplayMode.Full, Title = "Banner", ListTitle = "Banner", ListPlaceholder = "Banner")]
        public ImageTitle Banner { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Giới thiệu", ListTitle = "Giới thiệu", ListPlaceholder = "Giới thiệu")]
        public HtmlField Intro { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Các thành viên", ListTitle = "Các thành viên", ListPlaceholder = "Các thành viên")]
        public IList<Management> Directory { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Mô tả thương vụ", ListTitle = "Mô tả thương vụ", ListPlaceholder = "Thương vụ tiêu biểu")]
        public StringField TypicalDeal { get; set; }


        [Region(Display = RegionDisplayMode.Full, Title = "Chi tiết thương vụ", ListTitle = "Thương vụ tiêu biểu", ListPlaceholder = "Thương vụ tiêu biểu")]
        public IList<DealDetail> lstDealDetail { get; set; }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

        [Region(Display = RegionDisplayMode.Full, Title = "Đối tác và khách hàng", ListTitle = "Đối tác và khách hàng", ListPlaceholder = "Đối tác và khách hàng")]
        public IList<ImageTitle> lstPartner { get; set; }
    }
}
