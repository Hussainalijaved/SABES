using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace SABES.Models
{
    [DynamicallyAccessedMembers(DynamicallyAccessedMemberTypes.All)]
    public class BillItem
    {
        public int Id { get; set; }
        
        public int BillId { get; set; }
        
        public int ItemId { get; set; }
        
        [Required]
        [StringLength(200)]
        public string ItemName { get; set; } = string.Empty;
        
        [StringLength(100)]
        public string ItemCompany { get; set; } = string.Empty;
        
        [StringLength(100)]
        public string? ItemCategory { get; set; }
        
        [StringLength(500)]
        public string? ItemElectricalDetails { get; set; }
        
        [Column(TypeName = "decimal(18,2)")]
        public decimal UnitPrice { get; set; }
        
        public int Quantity { get; set; }
        
        [Column(TypeName = "decimal(18,2)")]
        public decimal LineTotal { get; set; }
        
        // Navigation properties
        public virtual Bill Bill { get; set; } = null!;
        public virtual Item Item { get; set; } = null!;
    }
}
