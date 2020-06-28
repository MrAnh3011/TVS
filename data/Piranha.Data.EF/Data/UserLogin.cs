using System;

namespace Piranha.Data
{
    [Serializable]
    public sealed class UserLogin : Models.UserLogin
    {
        public Site Site { get; set; }
    }
}
