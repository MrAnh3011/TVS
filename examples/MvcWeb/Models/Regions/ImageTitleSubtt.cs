using Piranha.Extend;
using Piranha.Extend.Fields;
using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MvcWeb.Models.Regions
{
    public class ImageTitleSubtt
    {
        [Field(Options = FieldOption.HalfWidth)]
        public StringField Title { get; set; }


        [Field(Options = FieldOption.HalfWidth)]
        public StringField SubTitle { get; set; }

        [Field]
        public StringField Link { get; set; }

        [Field]
        public ImageField Image { get; set; }
    }
}
