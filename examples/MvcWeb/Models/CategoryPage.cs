using Piranha.AttributeBuilder;
using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MvcWeb.Models
{
    [PageType(Title = "Danh mục", UseBlocks = false)]
    [PageTypeRoute(Title = "Danh mục", Route = "/categorypage")]
    public class CategoryPage : Page<CategoryPage>
    {

    }
}
