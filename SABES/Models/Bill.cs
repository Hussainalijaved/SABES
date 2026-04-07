using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace SABES.Models
{
    public enum BillStatus
    {
        Quotation,
        Paid,
        PaymentPending
    }

    [DynamicallyAccessedMembers(DynamicallyAccessedMemberTypes.All)]
    public class Bill
    {
        public int Id { get; set; }
        
        [Required]
        [StringLength(50)]
        public string BillNumber { get; set; } = string.Empty;
        
        [StringLength(200)]
        public string? CustomerName { get; set; }
        
        [StringLength(500)]
        public string? CustomerAddress { get; set; }
        
        [StringLength(20)]
        public string? CustomerPhone { get; set; }
        
        [Column(TypeName = "decimal(18,2)")]
        public decimal SubTotal { get; set; }
        
        [Column(TypeName = "decimal(5,2)")]
        public decimal DiscountPercentage { get; set; }
        
        [Column(TypeName = "decimal(18,2)")]
        public decimal DiscountAmount { get; set; }
        
        [Column(TypeName = "decimal(18,2)")]
        public decimal TotalAmount { get; set; }
        
        public BillStatus Status { get; set; } = BillStatus.Quotation;
        
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        
        public DateTime? PaidAt { get; set; }
        
        [StringLength(1000)]
        public string? Notes { get; set; }
        
        // Navigation property
        public virtual ICollection<BillItem> BillItems { get; set; } = new List<BillItem>();
    }
}
