using Microsoft.EntityFrameworkCore;
using SABES.Data;
using SABES.Models;

namespace SABES.Services
{
    public class ItemService : IItemService
    {
        private readonly SabesDbContext _context;

        public ItemService(SabesDbContext context)
        {
            _context = context;
        }

        public async Task<List<Item>> GetAllItemsAsync()
        {
            return await _context.Items
                .Include(i => i.Category)
                .OrderBy(i => i.Name)
                .ToListAsync();
        }

        public async Task<List<Item>> GetItemsByCategoryAsync(int categoryId)
        {
            return await _context.Items
                .Include(i => i.Category)
                .Where(i => i.CategoryId == categoryId)
                .OrderBy(i => i.Name)
                .ToListAsync();
        }

        public async Task<Item?> GetItemByIdAsync(int id)
        {
            return await _context.Items
                .Include(i => i.Category)
                .FirstOrDefaultAsync(i => i.Id == id);
        }

        public async Task<Item> CreateItemAsync(Item item)
        {
            item.CreatedAt = DateTime.Now;
            _context.Items.Add(item);
            await _context.SaveChangesAsync();
            return item;
        }

        public async Task<Item> UpdateItemAsync(Item item)
        {
            _context.Items.Update(item);
            await _context.SaveChangesAsync();
            return item;
        }

        public async Task<bool> DeleteItemAsync(int id)
        {
            var item = await _context.Items.FindAsync(id);
            if (item == null)
                return false;

            // Check if item is used in any bills
            var isUsedInBills = await _context.BillItems.AnyAsync(bi => bi.ItemId == id);
            if (isUsedInBills)
                return false; // Cannot delete item that's used in bills

            _context.Items.Remove(item);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<List<Item>> SearchItemsAsync(string searchTerm)
        {
            if (string.IsNullOrWhiteSpace(searchTerm))
                return await GetAllItemsAsync();

            var term = searchTerm.ToLower();
            return await _context.Items
                .Include(i => i.Category)
                .Where(i => i.Name.ToLower().Contains(term) ||
                           i.Company.ToLower().Contains(term) ||
                           i.Category.Name.ToLower().Contains(term) ||
                           (i.ElectricalDetails != null && i.ElectricalDetails.ToLower().Contains(term)))
                .OrderBy(i => i.Name)
                .ToListAsync();
        }

        public async Task<List<Item>> GetLowStockItemsAsync()
        {
            return await _context.Items
                .Include(i => i.Category)
                .Where(i => i.StockQuantity <= i.MinimumStockLevel)
                .OrderBy(i => i.StockQuantity)
                .ToListAsync();
        }

        public async Task<bool> UpdateStockQuantityAsync(int itemId, int newQuantity)
        {
            var item = await _context.Items.FindAsync(itemId);
            if (item == null)
                return false;

            item.StockQuantity = newQuantity;
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> ReduceStockAsync(int itemId, int quantity)
        {
            var item = await _context.Items.FindAsync(itemId);
            if (item == null || item.StockQuantity < quantity)
                return false;

            item.StockQuantity -= quantity;
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> AddStockAsync(int itemId, int quantity)
        {
            var item = await _context.Items.FindAsync(itemId);
            if (item == null)
                return false;

            item.StockQuantity += quantity;
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> IsStockAvailableAsync(int itemId, int requestedQuantity)
        {
            var item = await _context.Items.FindAsync(itemId);
            return item != null && item.StockQuantity >= requestedQuantity;
        }

        public async Task<int> GetAvailableStockAsync(int itemId)
        {
            var item = await _context.Items.FindAsync(itemId);
            return item?.StockQuantity ?? 0;
        }

        public async Task<bool> HasSufficientStockAsync(int itemId, int requestedQuantity)
        {
            var item = await _context.Items.FindAsync(itemId);
            return item != null && item.StockQuantity >= requestedQuantity;
        }
    }
}
