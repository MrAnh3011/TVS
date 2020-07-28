using Piranha.AttributeBuilder;
using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MvcWeb.Models
{
    [PageType(Title = "Danh mụcPT", UseBlocks = false)]
    [PageTypeRoute(Title = "Danh mụcPT", Route = "/categoryanalyze")]
    public class CategoryAnalyze : Page<CategoryAnalyze>
    {
    }
}
