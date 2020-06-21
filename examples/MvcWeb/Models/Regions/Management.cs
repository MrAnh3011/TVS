﻿using Piranha.Extend;
using Piranha.Extend.Fields;
using Piranha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MvcWeb.Models.Regions
{
    public class Management
    {
        [Field]
        public ImageField SmallImage { get; set; }


        [Field]
        public ImageField BigImage { get; set; }


        [Field(Options = FieldOption.HalfWidth)]
        public StringField Name { get; set; }


        [Field(Options = FieldOption.HalfWidth)]
        public StringField Position { get; set; }


        [Field(Options = FieldOption.HalfWidth)]
        public TextField Description { get; set; }
    }
}
