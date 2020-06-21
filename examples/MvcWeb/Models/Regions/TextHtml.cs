using Piranha.Extend;
using Piranha.Extend.Fields;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MvcWeb.Models.Regions
{
    public class TextHtml
    {
        [Field]
        public StringField Title { get; set; }


        [Field]
        public HtmlField Body { get; set; }
    }
}
