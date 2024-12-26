using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using WebGrease.Extensions;

namespace customer_support.Models
{
    [TableName("users_tbl")]
    public class UserModel
    {
        [Key]
        [Column("user_id")]
        public int Id { get; set; }
        [Column("first_name")]
        public string FirstName {  get; set; }
        [Column("last_name")]
        public string LastName { get; set; }
        [Column("email")]
        public string Email { get; set; }
        [Column("password")]
        public string Password { get; set; } 
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
    }
}