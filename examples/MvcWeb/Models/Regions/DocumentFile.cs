using Piranha.Extend;
using Piranha.Extend.Fields;
using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MvcWeb.Models.Regions
{
    public class DocumentFile
    {
        [Field(Options = FieldOption.HalfWidth)]
        public StringField docName { get; set; }


        [Field(Options = FieldOption.HalfWidth)]
        public DateField uploadTime { get; set; }


        [Field]
        public DocumentField docFile { get; set; }
    }
}
