using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace SABES.Models
{
    [DynamicallyAccessedMembers(DynamicallyAccessedMemberTypes.All)]
    public class Category
    {
        public int Id { get; set; }
        
        [Required]
        [StringLength(100)]
        public string Name { get; set; } = string.Empty;
        
        [StringLength(500)]
        public string? Description { get; set; }
        
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        
        // Navigation property
        public virtual ICollection<Item> Items { get; set; } = new List<Item>();
    }
}
