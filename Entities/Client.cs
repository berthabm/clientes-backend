using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ClientsBackend.Entities
{
    [Table("Client")]
    public class Client
    {
        [Key]
        public int id { get; set; }
        [Required]
        [MaxLength(100)]
        public string name { get; set; }
        [Required]
        [MaxLength(20)]
        public string phone { get; set; }
        [Required]
        [MaxLength(100)]
        public string country { get; set; }
        [NotMapped]
        public decimal TotalCount { get; set; }
    }
}
