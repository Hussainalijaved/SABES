using SABES.Models;

namespace SABES.Services
{
    public interface IBillService
    {
        Task<List<Bill>> GetAllBillsAsync();
        Task<List<Bill>> GetBillsByStatusAsync(BillStatus status);
        Task<Bill?> GetBillByIdAsync(int id);
        Task<Bill?> GetBillByNumberAsync(string billNumber);
        Task<Bill> CreateBillAsync(Bill bill);
        Task<Bill> UpdateBillAsync(Bill bill);
        Task<bool> DeleteBillAsync(int id);
        Task<string> GenerateNextBillNumberAsync();
        Task<bool> UpdateBillStatusAsync(int billId, BillStatus status);
        Task<byte[]> ExportBillAsImageAsync(int billId);
        Task<string> ExportBillAsImageToFileAsync(int billId);
        Task<byte[]> ExportBillAsPdfAsync(int billId);
        Task<string> ExportBillAsPdfToFileAsync(int billId);
    }
}
