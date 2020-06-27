using Piranha.AttributeBuilder;
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
    }
}
