using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Piranha.Models
{
    [Serializable]
    [Table("Piranha_UserLogin")]
    public class UserLogin
    {
        public Guid Id { get; set; }


        public Guid SiteId { get; set; }


        [Required]
        [StringLength(256)]
        public string UserName { get; set; }


        [Required]
        [StringLength(256)]
        public string UserPassWord { get; set; }


        [Required]
        [StringLength(256)]
        public string UserPhone { get; set; }


        [Required]
        [StringLength(256)]
        public string UserMail { get; set; }


        [StringLength(256)]
        public string UserFacebook { get; set; }


        [StringLength(256)]
        public string UserCare { get; set; }


        public DateTime Created { get; set; }


        public DateTime LastModified { get; set; }
    }
}
