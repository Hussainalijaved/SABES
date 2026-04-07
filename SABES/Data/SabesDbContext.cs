using Microsoft.EntityFrameworkCore;
using SABES.Models;
using System.Diagnostics.CodeAnalysis;

namespace SABES.Data
{
    [DynamicallyAccessedMembers(DynamicallyAccessedMemberTypes.All)]
    public class SabesDbContext : DbContext
    {
        public SabesDbContext(DbContextOptions<SabesDbContext> options) : base(options)
        {
        }

        public DbSet<Category> Categories { get; set; }
        public DbSet<Item> Items { get; set; }
        public DbSet<Bill> Bills { get; set; }
        public DbSet<BillItem> BillItems { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Configure Category
            modelBuilder.Entity<Category>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Name).IsRequired().HasMaxLength(100);
                entity.Property(e => e.Description).HasMaxLength(500);
                entity.HasIndex(e => e.Name).IsUnique();
            });

            // Configure Item
            modelBuilder.Entity<Item>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Name).IsRequired().HasMaxLength(200);
                entity.Property(e => e.Company).IsRequired().HasMaxLength(100);
                entity.Property(e => e.Price).HasColumnType("decimal(18,2)");
                entity.Property(e => e.PowerRating).HasMaxLength(100);
                entity.Property(e => e.Type).HasMaxLength(100);
                entity.Property(e => e.ElectricalDetails).HasMaxLength(500);
                entity.Property(e => e.Description).HasMaxLength(1000);
                
                entity.HasOne(e => e.Category)
                      .WithMany(c => c.Items)
                      .HasForeignKey(e => e.CategoryId)
                      .OnDelete(DeleteBehavior.Restrict);
            });

            // Configure Bill
            modelBuilder.Entity<Bill>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.BillNumber).IsRequired().HasMaxLength(50);
                entity.Property(e => e.CustomerName).HasMaxLength(200);
                entity.Property(e => e.CustomerAddress).HasMaxLength(500);
                entity.Property(e => e.CustomerPhone).HasMaxLength(20);
                entity.Property(e => e.SubTotal).HasColumnType("decimal(18,2)");
                entity.Property(e => e.DiscountPercentage).HasColumnType("decimal(5,2)");
                entity.Property(e => e.DiscountAmount).HasColumnType("decimal(18,2)");
                entity.Property(e => e.TotalAmount).HasColumnType("decimal(18,2)");
                entity.Property(e => e.Notes).HasMaxLength(1000);
                
                entity.HasIndex(e => e.BillNumber).IsUnique();
            });

            // Configure BillItem
            modelBuilder.Entity<BillItem>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.ItemName).IsRequired().HasMaxLength(200);
                entity.Property(e => e.ItemCompany).HasMaxLength(100);
                entity.Property(e => e.ItemCategory).HasMaxLength(100);
                entity.Property(e => e.ItemElectricalDetails).HasMaxLength(500);
                entity.Property(e => e.UnitPrice).HasColumnType("decimal(18,2)");
                entity.Property(e => e.LineTotal).HasColumnType("decimal(18,2)");
                
                entity.HasOne(e => e.Bill)
                      .WithMany(b => b.BillItems)
                      .HasForeignKey(e => e.BillId)
                      .OnDelete(DeleteBehavior.Cascade);
                      
                entity.HasOne(e => e.Item)
                      .WithMany(i => i.BillItems)
                      .HasForeignKey(e => e.ItemId)
                      .OnDelete(DeleteBehavior.Restrict);
            });

            // Seed initial data
            SeedData(modelBuilder);
        }

        private void SeedData(ModelBuilder modelBuilder)
        {
            // Seed Categories
            modelBuilder.Entity<Category>().HasData(
                new Category { Id = 1, Name = "Lighting", Description = "Light bulbs, fixtures, and lighting accessories", CreatedAt = DateTime.Now },
                new Category { Id = 2, Name = "Cables & Wires", Description = "Electrical cables, wires, and connectors", CreatedAt = DateTime.Now },
                new Category { Id = 3, Name = "Appliances", Description = "Home and commercial electrical appliances", CreatedAt = DateTime.Now },
                new Category { Id = 4, Name = "Switches & Sockets", Description = "Wall switches, power sockets, and outlets", CreatedAt = DateTime.Now },
                new Category { Id = 5, Name = "Fans", Description = "Ceiling fans, exhaust fans, and accessories", CreatedAt = DateTime.Now }
            );

            // Seed Items
            modelBuilder.Entity<Item>().HasData(
                new Item { Id = 1, Name = "LED Bulb 9W", Price = 250, Company = "Philips", PowerRating = "9W", Type = "LED", ElectricalDetails = "220V AC, 50Hz, 900 Lumens", CategoryId = 1, CreatedAt = DateTime.Now },
                new Item { Id = 2, Name = "Copper Wire 2.5mm", Price = 180, Company = "Fast Cables", PowerRating = "2.5mm²", Type = "Copper", ElectricalDetails = "Single Core, 450/750V", CategoryId = 2, CreatedAt = DateTime.Now },
                new Item { Id = 3, Name = "Ceiling Fan 56\"", Price = 8500, Company = "GFC", PowerRating = "75W", Type = "Ceiling Fan", ElectricalDetails = "220V AC, 50Hz, 1400 RPM", CategoryId = 5, CreatedAt = DateTime.Now },
                new Item { Id = 4, Name = "2-Gang Switch", Price = 120, Company = "Schneider", PowerRating = "10A", Type = "Wall Switch", ElectricalDetails = "250V AC, 2-Way", CategoryId = 4, CreatedAt = DateTime.Now },
                new Item { Id = 5, Name = "Water Heater 15L", Price = 12000, Company = "Canon", PowerRating = "2000W", Type = "Instant", ElectricalDetails = "220V AC, 50Hz, Thermostat", CategoryId = 3, CreatedAt = DateTime.Now }
            );
        }
    }
}
