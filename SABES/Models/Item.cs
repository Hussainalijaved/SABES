using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace SABES.Models
{
    [DynamicallyAccessedMembers(DynamicallyAccessedMemberTypes.All)]
    public class Item
    {
        public int Id { get; set; }
        
        [Required]
        [StringLength(200)]
        public string Name { get; set; } = string.Empty;
        
        [Column(TypeName = "decimal(18,2)")]
        public decimal Price { get; set; }
        
        [Required]
        [StringLength(100)]
        public string Company { get; set; } = string.Empty;
        
        [StringLength(100)]
        public string? PowerRating { get; set; }
        
        [StringLength(100)]
        public string? Type { get; set; }
        
        [StringLength(500)]
        public string? ElectricalDetails { get; set; }
        
        [StringLength(1000)]
        public string? Description { get; set; }
        
        public int CategoryId { get; set; }
        
        // Stock management properties
        public int StockQuantity { get; set; } = 0;
        
        public int MinimumStockLevel { get; set; } = 0;
        
        public int? MaximumStockLevel { get; set; }
        
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        
        // Navigation properties
        public virtual Category Category { get; set; } = null!;
        public virtual ICollection<BillItem> BillItems { get; set; } = new List<BillItem>();
    }
}
