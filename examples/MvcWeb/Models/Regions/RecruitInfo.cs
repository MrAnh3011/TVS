using Piranha.Extend;
using Piranha.Extend.Fields;
using Piranha.Models;

namespace MvcWeb.Models.Regions
{
    public class RecruitInfo
    {
        [Field(Options = FieldOption.HalfWidth)]
        public StringField Department { get; set; }


        [Field(Options = FieldOption.HalfWidth)]
        public DateField StartDate { get; set; }


        [Field(Options = FieldOption.HalfWidth)]
        public StringField Amount { get; set; }


        [Field(Options = FieldOption.HalfWidth)]
        public StringField Experience { get; set; }


        [Field(Options = FieldOption.HalfWidth)]
        public StringField Location { get; set; }


        [Field(Options = FieldOption.HalfWidth)]
        public StringField Salary { get; set; }


        [Field(Options = FieldOption.HalfWidth)]
        public DateField EndDate { get; set; }
    }
}
