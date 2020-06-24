using Piranha.AttributeBuilder;
using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MvcWeb.Models
{
    [PageType(Title = "Dịch vụ", UseBlocks = false)]
    [PageTypeRoute(Title = "services", Route = "/servicespage")]
    public class ServicesPage : Page<ServicesPage>
    {

    }
}
