using System;

namespace Piranha.Data
{
    [Serializable]
    public sealed class Login : Models.Login
    {
        public Site Site { get; set; }
    }
}
