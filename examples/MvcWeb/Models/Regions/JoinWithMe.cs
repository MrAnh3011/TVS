using Piranha.Extend;
using Piranha.Extend.Fields;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MvcWeb.Models.Regions
{
    public class JoinWithMe
    {
        [Field]
        public StringField Title { get; set; }

        [Field]
        public TextField Description { get; set; }

        [Field]
        public ImageField Pic1 { get; set; }

        [Field]
        public ImageField Pic2 { get; set; }

        [Field]
        public ImageField Pic3 { get; set; }

        [Field]
        public ImageField Pic4 { get; set; }

        [Field]
        public ImageField Pic5 { get; set; }

    }
}
