using Piranha.Extend;
using Piranha.Extend.Fields;
using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MvcWeb.Models.Regions
{
    public class DealDetail
    {
        [Field(Options = FieldOption.HalfWidth)]
        public StringField Year { get; set; }


        [Field(Options = FieldOption.HalfWidth)]
        public StringField Value { get; set; }


        [Field]
        public ImageField Customer { get; set; }


        [Field]
        public ImageField Investor { get; set; }


        [Field]
        public TextField Description { get; set; }
    }
}
