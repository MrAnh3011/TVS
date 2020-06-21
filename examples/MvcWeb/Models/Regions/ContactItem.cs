using Piranha.Extend;
using Piranha.Extend.Fields;
using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MvcWeb.Models.Regions
{
    public class ContactItem
    {
        [Field]
        public ImageField Image { get; set; }


        [Field(Options = FieldOption.HalfWidth)]
        public StringField Title { get; set; }


        [Field(Options = FieldOption.HalfWidth)]
        public StringField Phone { get; set; }


        [Field(Options = FieldOption.HalfWidth)]
        public StringField Fax { get; set; }


        [Field(Options = FieldOption.HalfWidth)]
        public StringField Address { get; set; }


        [Field]
        public StringField MapLink { get; set; }
    }
}
