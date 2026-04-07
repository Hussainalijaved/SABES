using SABES.Models;

namespace SABES.Services
{
    public interface IItemService
    {
        Task<List<Item>> GetAllItemsAsync();
        Task<List<Item>> GetItemsByCategoryAsync(int categoryId);
        Task<Item?> GetItemByIdAsync(int id);
        Task<Item> CreateItemAsync(Item item);
        Task<Item> UpdateItemAsync(Item item);
        Task<bool> DeleteItemAsync(int id);
        Task<List<Item>> SearchItemsAsync(string searchTerm);
        Task<List<Item>> GetLowStockItemsAsync();
        Task<bool> UpdateStockQuantityAsync(int itemId, int newQuantity);
        Task<bool> ReduceStockAsync(int itemId, int quantity);
        Task<bool> AddStockAsync(int itemId, int quantity);
        Task<bool> IsStockAvailableAsync(int itemId, int requestedQuantity);
        Task<int> GetAvailableStockAsync(int itemId);
        Task<bool> HasSufficientStockAsync(int itemId, int requestedQuantity);
    }
}
