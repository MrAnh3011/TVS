﻿using Piranha.Extend;
using Piranha.Extend.Fields;
using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MvcWeb.Models.Regions
{
    public class TextTitleHtml
    {
        [Field(Options = FieldOption.HalfWidth)]
        public StringField Title { get; set; }


        [Field(Options = FieldOption.HalfWidth)]
        public StringField SubTitle { get; set; }


        [Field]
        public TextField Description { get; set; }
    }
}
