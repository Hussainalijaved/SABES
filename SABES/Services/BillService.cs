using Microsoft.EntityFrameworkCore;
using SABES.Data;
using SABES.Models;
using SkiaSharp;

using Microsoft.Extensions.Logging;

namespace SABES.Services
{
    public class BillService : IBillService
    {
        private readonly SabesDbContext _context;
        private readonly IFileService _fileService;
        private readonly ILogger<BillService> _logger;

        public BillService(SabesDbContext context, IFileService fileService, ILogger<BillService> logger)
        {
            _context = context;
            _fileService = fileService;
            _logger = logger;
        }

        public async Task<List<Bill>> GetAllBillsAsync()
        {
            return await _context.Bills
                .Include(b => b.BillItems)
                .OrderByDescending(b => b.CreatedAt)
                .ToListAsync();
        }

        public async Task<List<Bill>> GetBillsByStatusAsync(BillStatus status)
        {
            return await _context.Bills
                .Include(b => b.BillItems)
                .Where(b => b.Status == status)
                .OrderByDescending(b => b.CreatedAt)
                .ToListAsync();
        }

        public async Task<Bill?> GetBillByIdAsync(int id)
        {
            return await _context.Bills
                .Include(b => b.BillItems)
                    .ThenInclude(bi => bi.Item)
                .FirstOrDefaultAsync(b => b.Id == id);
        }

        public async Task<Bill?> GetBillByNumberAsync(string billNumber)
        {
            return await _context.Bills
                .Include(b => b.BillItems)
                .FirstOrDefaultAsync(b => b.BillNumber == billNumber);
        }

        public async Task<Bill> CreateBillAsync(Bill bill)
        {
            if (string.IsNullOrEmpty(bill.BillNumber))
            {
                bill.BillNumber = await GenerateNextBillNumberAsync();
            }

            bill.CreatedAt = DateTime.Now;
            _context.Bills.Add(bill);
            await _context.SaveChangesAsync();
            return bill;
        }

        public async Task<Bill> UpdateBillAsync(Bill bill)
        {
            _context.Bills.Update(bill);
            await _context.SaveChangesAsync();
            return bill;
        }

        public async Task<bool> DeleteBillAsync(int id)
        {
            var bill = await _context.Bills
                .Include(b => b.BillItems)
                .FirstOrDefaultAsync(b => b.Id == id);

            if (bill == null)
                return false;

            _context.Bills.Remove(bill);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<string> GenerateNextBillNumberAsync()
        {
            var today = DateTime.Now;
            var prefix = $"SAB-{today:yyyyMM}-";
            
            var lastBill = await _context.Bills
                .Where(b => b.BillNumber.StartsWith(prefix))
                .OrderByDescending(b => b.BillNumber)
                .FirstOrDefaultAsync();

            int nextNumber = 1;
            if (lastBill != null)
            {
                var lastNumberPart = lastBill.BillNumber.Substring(prefix.Length);
                if (int.TryParse(lastNumberPart, out int lastNumber))
                {
                    nextNumber = lastNumber + 1;
                }
            }

            return $"{prefix}{nextNumber:D4}";
        }

        public async Task<bool> UpdateBillStatusAsync(int billId, BillStatus status)
        {
            var bill = await _context.Bills.FindAsync(billId);
            if (bill == null)
                return false;

            bill.Status = status;
            if (status == BillStatus.Paid)
            {
                bill.PaidAt = DateTime.Now;
            }
            else
            {
                bill.PaidAt = null;
            }

            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<byte[]> ExportBillAsImageAsync(int billId)
        {
            try
            {
                _logger.LogInformation($"Starting bill export for ID: {billId}");

                var bill = await GetBillByIdAsync(billId);
                if (bill == null)
                {
                    _logger.LogError($"Bill not found with ID: {billId}");
                    throw new ArgumentException($"Bill not found with ID: {billId}");
                }

                _logger.LogInformation($"Found bill: {bill.BillNumber} with {bill.BillItems?.Count ?? 0} items");
                
                // Debug logging for item distribution
                var itemNames = bill.BillItems?.Select(i => i.ItemName ?? i.Item?.Name ?? "Unknown").ToList() ?? new List<string>();
                _logger.LogInformation($"Items to include in PDF: {string.Join(", ", itemNames)}");

            const int width = 850;
            const int height = 1100;
            const int margin = 40;

            using var surface = SKSurface.Create(new SKImageInfo(width, height));
            var canvas = surface.Canvas;

            // White background with subtle border
            canvas.Clear(SKColors.White);

            // Draw border
            using var borderPaint = new SKPaint
            {
                Color = SKColor.Parse("#E5E7EB"),
                Style = SKPaintStyle.Stroke,
                StrokeWidth = 2,
                IsAntialias = true
            };
            canvas.DrawRect(10, 10, width - 20, height - 20, borderPaint);

            // Header Background
            using var headerBgPaint = new SKPaint
            {
                Color = SKColor.Parse("#F8FAFC"),
                Style = SKPaintStyle.Fill
            };
            canvas.DrawRect(margin, margin, width - (margin * 2), 120, headerBgPaint);

            // SABES Title in Red
            using var sabesTitlePaint = new SKPaint
            {
                Color = SKColor.Parse("#059669"), // Red color
                TextSize = 42,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };

            canvas.DrawText("⚡ SABES", margin + 20, margin + 50, sabesTitlePaint);

            // Store name and tagline
            using var storeNamePaint = new SKPaint
            {
                Color = SKColor.Parse("#1F2937"),
                TextSize = 20,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };

            using var taglinePaint = new SKPaint
            {
                Color = SKColor.Parse("#6B7280"),
                TextSize = 16,
                IsAntialias = true
            };

            canvas.DrawText("Sami and Brothers Electric Store", margin + 20, margin + 80, storeNamePaint);
            canvas.DrawText("Professional Electric Solutions • Quality Products", margin + 20, margin + 105, taglinePaint);

            // Bill type and number section
            var billTypeY = margin + 180;
            using var billTypePaint = new SKPaint
            {
                Color = bill.Status == BillStatus.Quotation ? SKColor.Parse("#059669") : SKColor.Parse("#DC2626"),
                TextSize = 28,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };

            var billTitle = bill.Status == BillStatus.Quotation ? "QUOTATION" : "INVOICE";
            canvas.DrawText(billTitle, margin + 20, billTypeY, billTypePaint);

            // Bill details in two columns
            using var labelPaint = new SKPaint
            {
                Color = SKColor.Parse("#374151"),
                TextSize = 16,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };

            using var valuePaint = new SKPaint
            {
                Color = SKColor.Parse("#1F2937"),
                TextSize = 16,
                IsAntialias = true
            };

            var detailsY = billTypeY + 50;
            var leftCol = margin + 20;
            var rightCol = width - 300;

            // Left column
            canvas.DrawText("Bill Number:", leftCol, detailsY, labelPaint);
            canvas.DrawText(bill.BillNumber, leftCol + 120, detailsY, valuePaint);

            canvas.DrawText("Date:", leftCol, detailsY + 30, labelPaint);
            canvas.DrawText(bill.CreatedAt.ToString("dd/MM/yyyy"), leftCol + 120, detailsY + 30, valuePaint);

            canvas.DrawText("Status:", leftCol, detailsY + 60, labelPaint);
            var statusColor = bill.Status switch
            {
                BillStatus.Paid => SKColor.Parse("#059669"),
                BillStatus.PaymentPending => SKColor.Parse("#D97706"),
                _ => SKColor.Parse("#6B7280")
            };
            using var statusPaint = new SKPaint
            {
                Color = statusColor,
                TextSize = 16,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };
            canvas.DrawText(bill.Status.ToString(), leftCol + 120, detailsY + 60, statusPaint);

            // Right column - Customer details
            canvas.DrawText("Customer:", rightCol, detailsY, labelPaint);
            canvas.DrawText(bill.CustomerName, rightCol, detailsY + 25, valuePaint);

            canvas.DrawText("Phone:", rightCol, detailsY + 55, labelPaint);
            canvas.DrawText(bill.CustomerPhone, rightCol, detailsY + 80, valuePaint);

            // Items section
            var itemsY = detailsY + 130;

            // Items header with background
            using var itemsHeaderBg = new SKPaint
            {
                Color = SKColor.Parse("#F3F4F6"),
                Style = SKPaintStyle.Fill
            };
            canvas.DrawRect(margin, itemsY - 10, width - (margin * 2), 35, itemsHeaderBg);

            using var itemsHeaderPaint = new SKPaint
            {
                Color = SKColor.Parse("#1F2937"),
                TextSize = 18,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };

            canvas.DrawText("ITEMS & SERVICES", margin + 20, itemsY + 15, itemsHeaderPaint);

            // Items table headers
            itemsY += 50;
            using var tableHeaderPaint = new SKPaint
            {
                Color = SKColor.Parse("#6B7280"),
                TextSize = 14,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };

            canvas.DrawText("DESCRIPTION", margin + 20, itemsY, tableHeaderPaint);
            canvas.DrawText("QTY", width - 300, itemsY, tableHeaderPaint);
            canvas.DrawText("RATE", width - 200, itemsY, tableHeaderPaint);
            canvas.DrawText("AMOUNT", width - 100, itemsY, tableHeaderPaint);

            // Items
            itemsY += 30;
            using var itemTextPaint = new SKPaint
            {
                Color = SKColor.Parse("#374151"),
                TextSize = 15,
                IsAntialias = true
            };

            using var itemAmountPaint = new SKPaint
            {
                Color = SKColor.Parse("#1F2937"),
                TextSize = 15,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };

            if (bill.BillItems != null && bill.BillItems.Any())
            {
                foreach (var item in bill.BillItems)
                {
                    // Item name and details
                    var itemName = item.ItemName ?? item.Item?.Name ?? "Unknown Item";
                    canvas.DrawText(itemName, margin + 20, itemsY, itemTextPaint);
                if (!string.IsNullOrEmpty(item.ItemCompany))
                {
                    canvas.DrawText($"({item.ItemCompany})", margin + 20, itemsY + 18, new SKPaint
                    {
                        Color = SKColor.Parse("#9CA3AF"),
                        TextSize = 12,
                        IsAntialias = true
                    });
                    itemsY += 18;
                }

                // Quantity, rate, amount
                canvas.DrawText(item.Quantity.ToString(), width - 300, itemsY, itemTextPaint);
                canvas.DrawText($"₨{item.UnitPrice:N0}", width - 200, itemsY, itemTextPaint);
                canvas.DrawText($"₨{item.LineTotal:N0}", width - 100, itemsY, itemAmountPaint);

                    itemsY += 35;
                }
            }
            else
            {
                // No items found
                canvas.DrawText("No items found", margin + 20, itemsY, itemTextPaint);
                itemsY += 35;
            }

            // Totals section
            itemsY += 30;
            var totalsX = width - 250;

            // Totals background
            using var totalsBg = new SKPaint
            {
                Color = SKColor.Parse("#F9FAFB"),
                Style = SKPaintStyle.Fill
            };
            canvas.DrawRect(totalsX - 20, itemsY - 10, 230, 120, totalsBg);

            using var totalsLabelPaint = new SKPaint
            {
                Color = SKColor.Parse("#6B7280"),
                TextSize = 16,
                IsAntialias = true
            };

            using var totalsValuePaint = new SKPaint
            {
                Color = SKColor.Parse("#1F2937"),
                TextSize = 16,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };

            canvas.DrawText("Subtotal:", totalsX, itemsY + 20, totalsLabelPaint);
            canvas.DrawText($"₨{bill.SubTotal:N0}", totalsX + 100, itemsY + 20, totalsValuePaint);

            canvas.DrawText("Discount:", totalsX, itemsY + 45, totalsLabelPaint);
            canvas.DrawText($"₨{bill.DiscountAmount:N0}", totalsX + 100, itemsY + 45, totalsValuePaint);

            // Total amount with emphasis
            using var grandTotalPaint = new SKPaint
            {
                Color = SKColor.Parse("#DC2626"),
                TextSize = 20,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };

            canvas.DrawText("TOTAL:", totalsX, itemsY + 80, grandTotalPaint);
            canvas.DrawText($"₨{bill.TotalAmount:N0}", totalsX + 100, itemsY + 80, grandTotalPaint);

            // Footer section
            var footerY = height - 120;

            // Thank you message
            using var thankYouPaint = new SKPaint
            {
                Color = SKColor.Parse("#059669"),
                TextSize = 18,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };

            canvas.DrawText("Thank you for choosing SABES!", margin + 20, footerY, thankYouPaint);

            // Developer credit
            using var creditPaint = new SKPaint
            {
                Color = SKColor.Parse("#6B7280"),
                TextSize = 14,
                IsAntialias = true
            };

            canvas.DrawText("Powered by Arslandevs - Professional Software Solutions", margin + 20, footerY + 30, creditPaint);
            canvas.DrawText("Mobile Apps • Web Development • Custom Solutions", margin + 20, footerY + 50, creditPaint);

                using var image = surface.Snapshot();
                using var data = image.Encode(SKEncodedImageFormat.Png, 100);

                _logger.LogInformation($"Successfully generated image for bill {billId}, size: {data.Size} bytes");
                return data.ToArray();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Failed to export bill {billId} as image");
                throw;
            }
        }

        public async Task<string> ExportBillAsImageToFileAsync(int billId)
        {
            try
            {
                // Check and request storage permission
                var hasPermission = await _fileService.CheckStoragePermissionAsync();
                if (!hasPermission)
                {
                    hasPermission = await _fileService.RequestStoragePermissionAsync();
                    if (!hasPermission)
                    {
                        throw new UnauthorizedAccessException("Storage permission is required to save files.");
                    }
                }

                // Generate image
                var imageBytes = await ExportBillAsImageAsync(billId);
                var bill = await GetBillByIdAsync(billId);
                var filename = $"Bill_{bill?.BillNumber ?? billId.ToString()}_{DateTime.Now:yyyyMMdd_HHmmss}.png";

                // Save to file
                var filePath = await _fileService.SaveImageToDownloadsAsync(imageBytes, filename);

                _logger.LogInformation($"Bill {billId} exported to: {filePath}");
                return filePath;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Failed to export bill {billId} to file");
                throw;
            }
        }

        public async Task<byte[]> ExportBillAsPdfAsync(int billId)
        {
            try
            {
                _logger.LogInformation($"Starting PDF export for bill ID: {billId}");

                var bill = await GetBillByIdAsync(billId);
                if (bill == null)
                {
                    _logger.LogError($"Bill not found with ID: {billId}");
                    throw new ArgumentException($"Bill not found with ID: {billId}");
                }

                _logger.LogInformation($"Found bill: {bill.BillNumber} with {bill.BillItems?.Count ?? 0} items");

                const int pageWidth = 595; // A4 width in points
                const int pageHeight = 842; // A4 height in points
                const int margin = 40;
                const int itemsPerPage = 10; // Reduced to prevent overlap with footer

                using var stream = new MemoryStream();
                using var document = SKDocument.CreatePdf(stream);

                var totalItems = bill.BillItems?.Count ?? 0;
                var currentPage = 1;
                var itemIndex = 0;
                
                // First pass: collect all page data without drawing
                var pageData = new List<(int startIndex, int endIndex)>();
                var tempIndex = 0;
                var items = bill.BillItems?.ToList() ?? new List<BillItem>();
                
                while (tempIndex < totalItems)
                {
                    var startIndex = tempIndex;
                    var itemsOnPage = 0;
                    var simulatedY = 300; // Starting Y position for items
                    var maxY = 650; // Reduced maximum Y to prevent overlap with footer
                    
                    // Simulate drawing to count items per page with realistic height calculation
                    while (tempIndex < totalItems && itemsOnPage < itemsPerPage)
                    {
                        var item = items[tempIndex];
                        var itemHeight = 25; // Base height for item
                        
                        // Add extra height if item has company name
                        if (!string.IsNullOrEmpty(item.ItemCompany))
                        {
                            itemHeight += 12;
                        }
                        
                        // Check if this item would fit on the current page
                        if (simulatedY + itemHeight > maxY && itemsOnPage > 0)
                        {
                            break; // Start new page - tempIndex will be included in next page
                        }
                        
                        simulatedY += itemHeight;
                        tempIndex++;
                        itemsOnPage++;
                    }
                    
                    // Ensure we don't miss any items by using the correct end index
                    var endIndex = Math.Min(tempIndex, totalItems);
                    pageData.Add((startIndex, endIndex));
                }
                
                var totalPages = Math.Max(1, pageData.Count);
                
                // Ensure all items are accounted for in page data
                if (pageData.Count > 0)
                {
                    var lastPage = pageData[pageData.Count - 1];
                    if (lastPage.endIndex < totalItems)
                    {
                        // Update the last page to include all remaining items
                        pageData[pageData.Count - 1] = (lastPage.startIndex, totalItems);
                    }
                }
                
                // Debug logging for page distribution
                _logger.LogInformation($"Page distribution: {string.Join(", ", pageData.Select(p => $"Page {pageData.IndexOf(p) + 1}: items {p.startIndex}-{p.endIndex - 1}"))}");
                
                // Second pass: draw all pages with correct total page count
                foreach (var (startIdx, endIdx) in pageData)
                {
                    using var canvas = document.BeginPage(pageWidth, pageHeight);
                    itemIndex = startIdx;
                    var targetEndIndex = endIdx;
                    
                    _logger.LogInformation($"Drawing page {currentPage}: items {startIdx} to {endIdx - 1} (total items: {totalItems})");

                    // Draw page content
                    DrawPdfPageContent(canvas, bill, pageWidth, pageHeight, margin, currentPage, totalPages, ref itemIndex, itemsPerPage, targetEndIndex);
                    
                    _logger.LogInformation($"After drawing page {currentPage}, itemIndex is now: {itemIndex}");

                    document.EndPage();
                    currentPage++;
                }

                document.Close();
                var pdfBytes = stream.ToArray();

                _logger.LogInformation($"Successfully generated PDF for bill {billId}, size: {pdfBytes.Length} bytes, pages: {totalPages}");
                return pdfBytes;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Failed to export bill {billId} as PDF");
                throw;
            }
        }

        public async Task<string> ExportBillAsPdfToFileAsync(int billId)
        {
            try
            {
                // Check and request storage permission
                var hasPermission = await _fileService.CheckStoragePermissionAsync();
                if (!hasPermission)
                {
                    hasPermission = await _fileService.RequestStoragePermissionAsync();
                    if (!hasPermission)
                    {
                        throw new UnauthorizedAccessException("Storage permission is required to save files.");
                    }
                }

                // Generate PDF
                var pdfBytes = await ExportBillAsPdfAsync(billId);
                var bill = await GetBillByIdAsync(billId);
                var filename = $"Bill_{bill?.BillNumber ?? billId.ToString()}_{DateTime.Now:yyyyMMdd_HHmmss}.pdf";

                // Save to file
                var filePath = await _fileService.SaveFileToDownloadsAsync(pdfBytes, filename, "application/pdf");

                _logger.LogInformation($"Bill {billId} exported as PDF to: {filePath}");
                return filePath;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Failed to export bill {billId} as PDF to file");
                throw;
            }
        }

        private void DrawPdfPageContent(SKCanvas canvas, Bill bill, int pageWidth, int pageHeight, int margin, int currentPage, int totalPages, ref int itemIndex, int itemsPerPage, int targetEndIndex = -1)
        {
            // White background
            canvas.Clear(SKColors.White);

            // Draw border
            using var borderPaint = new SKPaint
            {
                Color = SKColor.Parse("#E5E7EB"),
                Style = SKPaintStyle.Stroke,
                StrokeWidth = 1,
                IsAntialias = true
            };
            canvas.DrawRect(10, 10, pageWidth - 20, pageHeight - 20, borderPaint);

            var currentY = margin + 20;

            // Header (only on first page)
            if (currentPage == 1)
            {
                currentY = DrawPdfHeader(canvas, bill, pageWidth, margin, currentY);
            }
            else
            {
                // Page header for continuation pages
                using var pageHeaderPaint = new SKPaint
                {
                    Color = SKColor.Parse("#1F2937"),
                    TextSize = 16,
                    IsAntialias = true,
                    Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
                };
                canvas.DrawText($"Bill {bill.BillNumber} - Continued", margin + 20, currentY, pageHeaderPaint);
                currentY += 40;
            }

            // Items section
            currentY = DrawPdfItems(canvas, bill, pageWidth, margin, currentY, ref itemIndex, itemsPerPage, currentPage == 1, targetEndIndex);

            // Center logo on every page, positioned lower
            DrawCenterLogo(canvas, pageWidth, pageHeight);

            // Footer (only on last page)
            if (currentPage == totalPages)
            {
                DrawPdfFooter(canvas, bill, pageWidth, pageHeight, margin);
            }

            // Page number
            using var pageNumPaint = new SKPaint
            {
                Color = SKColor.Parse("#6B7280"),
                TextSize = 10,
                IsAntialias = true
            };
            canvas.DrawText($"Page {currentPage} of {totalPages}", pageWidth - 100, pageHeight - 20, pageNumPaint);
        }

        private int DrawPdfHeader(SKCanvas canvas, Bill bill, int pageWidth, int margin, int startY)
        {
            var currentY = startY;

            // Header Background
            using var headerBgPaint = new SKPaint
            {
                Color = SKColor.Parse("#F8FAFC"),
                Style = SKPaintStyle.Fill
            };
            canvas.DrawRect(margin, currentY, pageWidth - (margin * 2), 80, headerBgPaint);

            // Draw SABES Logo
            DrawSabesLogo(canvas, margin + 5, currentY + 10, 60);

            // Company name and details
            using var companyNamePaint = new SKPaint
            {
                Color = SKColor.Parse("#1F2937"),
                TextSize = 24,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };
            canvas.DrawText("SABES", margin + 70, currentY + 35, companyNamePaint);

            using var companySubPaint = new SKPaint
            {
                Color = SKColor.Parse("#6B7280"),
                TextSize = 12,
                IsAntialias = true
            };
            canvas.DrawText("Sami and Brothers Electric Store", margin + 70, currentY + 50, companySubPaint);
            canvas.DrawText("Professional Electric Solutions • Quality Products", margin + 70, currentY + 65, companySubPaint);

            currentY += 100;

            // Bill type
            using var billTypePaint = new SKPaint
            {
                Color = SKColor.Parse("#DC2626"),
                TextSize = 28,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };
            var billTitle = bill.Status == BillStatus.Quotation ? "QUOTATION" : "INVOICE";
            canvas.DrawText(billTitle, margin + 20, currentY, billTypePaint);
            currentY += 50;

            // Bill details in two columns
            using var labelPaint = new SKPaint
            {
                Color = SKColor.Parse("#374151"),
                TextSize = 12,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };

            using var valuePaint = new SKPaint
            {
                Color = SKColor.Parse("#1F2937"),
                TextSize = 12,
                IsAntialias = true
            };

            var leftCol = margin + 20;
            var rightCol = pageWidth - 200;

            // Left column
            canvas.DrawText("Bill Number:", leftCol, currentY, labelPaint);
            canvas.DrawText(bill.BillNumber, leftCol + 80, currentY, valuePaint);

            canvas.DrawText("Date:", leftCol, currentY + 20, labelPaint);
            canvas.DrawText(bill.CreatedAt.ToString("dd/MM/yyyy"), leftCol + 80, currentY + 20, valuePaint);

            canvas.DrawText("Status:", leftCol, currentY + 40, labelPaint);
            var statusColor = bill.Status switch
            {
                BillStatus.Paid => SKColor.Parse("#059669"),
                BillStatus.PaymentPending => SKColor.Parse("#D97706"),
                _ => SKColor.Parse("#6B7280")
            };
            using var statusPaint = new SKPaint
            {
                Color = statusColor,
                TextSize = 12,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };
            canvas.DrawText(bill.Status.ToString(), leftCol + 80, currentY + 40, statusPaint);

            // Right column - Customer details
            canvas.DrawText("Customer:", rightCol, currentY, labelPaint);
            canvas.DrawText(bill.CustomerName, rightCol, currentY + 15, valuePaint);

            canvas.DrawText("Phone:", rightCol, currentY + 35, labelPaint);
            canvas.DrawText(bill.CustomerPhone, rightCol, currentY + 50, valuePaint);

            return currentY + 80;
        }

        private int DrawPdfItems(SKCanvas canvas, Bill bill, int pageWidth, int margin, int startY, ref int itemIndex, int itemsPerPage, bool isFirstPage, int targetEndIndex = -1)
        {
            var currentY = startY;

            // Items header
            if (isFirstPage)
            {
                using var itemsHeaderBg = new SKPaint
                {
                    Color = SKColor.Parse("#F3F4F6"),
                    Style = SKPaintStyle.Fill
                };
                canvas.DrawRect(margin, currentY - 5, pageWidth - (margin * 2), 25, itemsHeaderBg);

                using var itemsHeaderPaint = new SKPaint
                {
                    Color = SKColor.Parse("#1F2937"),
                    TextSize = 14,
                    IsAntialias = true,
                    Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
                };
                canvas.DrawText("ITEMS & SERVICES", margin + 10, currentY + 10, itemsHeaderPaint);
                currentY += 35;
            }

            // Table headers
            using var tableHeaderPaint = new SKPaint
            {
                Color = SKColor.Parse("#6B7280"),
                TextSize = 10,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };

            canvas.DrawText("DESCRIPTION", margin + 10, currentY, tableHeaderPaint);
            canvas.DrawText("QTY", pageWidth - 200, currentY, tableHeaderPaint);
            canvas.DrawText("RATE", pageWidth - 150, currentY, tableHeaderPaint);
            canvas.DrawText("AMOUNT", pageWidth - 80, currentY, tableHeaderPaint);
            currentY += 20;

            // Items
            using var itemTextPaint = new SKPaint
            {
                Color = SKColor.Parse("#374151"),
                TextSize = 10,
                IsAntialias = true
            };

            using var itemAmountPaint = new SKPaint
            {
                Color = SKColor.Parse("#1F2937"),
                TextSize = 10,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };

            var itemsDrawn = 0;
            var items = bill.BillItems?.ToList() ?? new List<BillItem>();
            var maxY = 650; // Reduced space for items to prevent overlap with footer
            var endIndex = targetEndIndex > 0 ? Math.Min(targetEndIndex, items.Count) : items.Count;

            while (itemIndex < items.Count && itemIndex < endIndex && currentY < maxY)
            {
                var item = items[itemIndex];
                var itemName = item.ItemName ?? item.Item?.Name ?? "Unknown Item";

                // Truncate long item names
                if (itemName.Length > 35)
                {
                    itemName = itemName.Substring(0, 32) + "...";
                }

                canvas.DrawText(itemName, margin + 10, currentY, itemTextPaint);

                if (!string.IsNullOrEmpty(item.ItemCompany))
                {
                    var company = item.ItemCompany.Length > 20 ? item.ItemCompany.Substring(0, 17) + "..." : item.ItemCompany;
                    canvas.DrawText($"({company})", margin + 10, currentY + 12, new SKPaint
                    {
                        Color = SKColor.Parse("#9CA3AF"),
                        TextSize = 8,
                        IsAntialias = true
                    });
                    currentY += 12;
                }

                // Quantity, rate, amount
                canvas.DrawText(item.Quantity.ToString(), pageWidth - 200, currentY, itemTextPaint);
                canvas.DrawText($"₨{item.UnitPrice:N0}", pageWidth - 150, currentY, itemTextPaint);
                canvas.DrawText($"₨{item.LineTotal:N0}", pageWidth - 80, currentY, itemAmountPaint);

                currentY += 25;
                itemIndex++;
                itemsDrawn++;
            }

            return currentY;
        }

        private void DrawPdfFooter(SKCanvas canvas, Bill bill, int pageWidth, int pageHeight, int margin)
        {
            var footerY = pageHeight - 150;

            // Totals section
            using var totalLabelPaint = new SKPaint
            {
                Color = SKColor.Parse("#374151"),
                TextSize = 12,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };

            using var totalValuePaint = new SKPaint
            {
                Color = SKColor.Parse("#1F2937"),
                TextSize = 12,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };

            var rightAlign = pageWidth - 100;
            var labelAlign = pageWidth - 200;

            // Subtotal
            canvas.DrawText("Subtotal:", labelAlign, footerY, totalLabelPaint);
            canvas.DrawText($"₨{bill.SubTotal:N0}", rightAlign, footerY, totalValuePaint);

            // Discount
            if (bill.DiscountAmount > 0)
            {
                footerY += 20;
                canvas.DrawText("Discount:", labelAlign, footerY, totalLabelPaint);
                canvas.DrawText($"-₨{bill.DiscountAmount:N0}", rightAlign, footerY, totalValuePaint);
            }

            // Total
            footerY += 25;
            using var grandTotalBg = new SKPaint
            {
                Color = SKColor.Parse("#F3F4F6"),
                Style = SKPaintStyle.Fill
            };
            canvas.DrawRect(labelAlign - 20, footerY - 15, 220, 25, grandTotalBg);

            using var grandTotalPaint = new SKPaint
            {
                Color = SKColor.Parse("#16a085"),
                TextSize = 14,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };
            canvas.DrawText("Total:", labelAlign, footerY, grandTotalPaint);
            canvas.DrawText($"₨{bill.TotalAmount:N0}", rightAlign, footerY, grandTotalPaint);

            // Thank you message
            footerY += 40;
            using var thankYouPaint = new SKPaint
            {
                Color = SKColor.Parse("#16a085"),
                TextSize = 14,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold)
            };
            canvas.DrawText("Thank you for choosing SABES!", margin + 20, footerY, thankYouPaint);

            // Developer credit
            footerY += 25;
            using var creditPaint = new SKPaint
            {
                Color = SKColor.Parse("#6B7280"),
                TextSize = 8,
                IsAntialias = true
            };
            canvas.DrawText("Powered by Arslandevs - Professional Software Solutions", margin + 20, footerY, creditPaint);
            canvas.DrawText("Mobile Apps • Web Development • Custom Solutions", margin + 20, footerY + 12, creditPaint);
        }

        private void DrawSabesLogo(SKCanvas canvas, float x, float y, float size)
        {
            try
            {
                // Alternative paths to try
                var possiblePaths = new[]
                {
                    Path.Combine(AppContext.BaseDirectory, "wwwroot", "images", "sabes_logo.png"),
                    Path.Combine(Environment.CurrentDirectory, "wwwroot", "images", "sabes_logo.png"),
                    Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "wwwroot", "images", "sabes_logo.png")
                };

                SKBitmap? logoBitmap = null;
                
                // Try to load from embedded resource first
                try
                {
                    using var stream = FileSystem.Current.OpenAppPackageFileAsync("wwwroot/images/sabes_logo.png").Result;
                    logoBitmap = SKBitmap.Decode(stream);
                }
                catch
                {
                    // Try file system paths
                    foreach (var path in possiblePaths)
                    {
                        if (File.Exists(path))
                        {
                            logoBitmap = SKBitmap.Decode(path);
                            break;
                        }
                    }
                }

                if (logoBitmap != null)
                {
                    // Calculate aspect ratio and positioning
                    var aspectRatio = (float)logoBitmap.Width / logoBitmap.Height;
                    var logoRect = new SKRect(x, y, x + size, y + size);
                    
                    // Adjust rectangle to maintain aspect ratio
                    if (aspectRatio > 1) // Wider than tall
                    {
                        var newHeight = size / aspectRatio;
                        var offsetY = (size - newHeight) / 2;
                        logoRect = new SKRect(x, y + offsetY, x + size, y + offsetY + newHeight);
                    }
                    else if (aspectRatio < 1) // Taller than wide
                    {
                        var newWidth = size * aspectRatio;
                        var offsetX = (size - newWidth) / 2;
                        logoRect = new SKRect(x + offsetX, y, x + offsetX + newWidth, y + size);
                    }

                    // Draw the logo with high quality
                    using var paint = new SKPaint
                    {
                        IsAntialias = true,
                        FilterQuality = SKFilterQuality.High
                    };
                    
                    canvas.DrawBitmap(logoBitmap, logoRect, paint);
                    logoBitmap.Dispose();
                }
                else
                {
                    // Fallback: draw a simple circle if logo can't be loaded
                    DrawFallbackLogo(canvas, x, y, size);
                }
            }
            catch
            {
                // Fallback: draw a simple circle if any error occurs
                DrawFallbackLogo(canvas, x, y, size);
            }
        }

        private void DrawFallbackLogo(SKCanvas canvas, float x, float y, float size)
        {
            // Draw a simple green circle as fallback
            var centerX = x + size / 2;
            var centerY = y + size / 2;
            var radius = size / 2;

            using var paint = new SKPaint
            {
                Color = SKColor.Parse("#10B981"), // Green color
                Style = SKPaintStyle.Fill,
                IsAntialias = true
            };

            canvas.DrawCircle(centerX, centerY, radius, paint);

            // Add "SABES" text in white
            using var textPaint = new SKPaint
            {
                Color = SKColors.White,
                TextSize = size * 0.25f,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold),
                TextAlign = SKTextAlign.Center
            };

            canvas.DrawText("SABES", centerX, centerY + (textPaint.TextSize / 3), textPaint);
        }



        private void DrawCenterLogo(SKCanvas canvas, int pageWidth, int pageHeight)
        {
            // Make the logo much larger and add transparency for watermark effect
            var logoSize = Math.Min(pageWidth, pageHeight) * 0.6f; // 60% of the smaller dimension
            var centerX = pageWidth / 2 - logoSize / 2;
            // Position logo lower on the page (70% down from top)
            var centerY = (pageHeight * 0.6f) - logoSize / 2;
            
            // Save the current canvas state
            canvas.Save();
            
            // Apply transparency for fade effect (10% opacity)
            using var paint = new SKPaint
            {
                Color = SKColors.White.WithAlpha(25), // Very low opacity for fade effect
                BlendMode = SKBlendMode.Multiply
            };
            
            // Draw the faded logo
            DrawSabesLogoWithOpacity(canvas, centerX, centerY, logoSize, 25); // 25/255 = ~10% opacity
            
            // Restore canvas state
            canvas.Restore();
        }
        
        private void DrawSabesLogoWithOpacity(SKCanvas canvas, float x, float y, float size, byte opacity)
        {
            try
            {
                // Alternative paths to try
                var possiblePaths = new[]
                {
                    Path.Combine(AppContext.BaseDirectory, "wwwroot", "images", "sabes_logo.png"),
                    Path.Combine(Environment.CurrentDirectory, "wwwroot", "images", "sabes_logo.png"),
                    Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "wwwroot", "images", "sabes_logo.png")
                };

                SKBitmap? logoBitmap = null;
                
                // Try to load from embedded resource first
                try
                {
                    using var stream = FileSystem.Current.OpenAppPackageFileAsync("wwwroot/images/sabes_logo.png").Result;
                    logoBitmap = SKBitmap.Decode(stream);
                }
                catch
                {
                    // Try file system paths
                    foreach (var path in possiblePaths)
                    {
                        if (File.Exists(path))
                        {
                            logoBitmap = SKBitmap.Decode(path);
                            break;
                        }
                    }
                }

                if (logoBitmap != null)
                {
                    // Calculate aspect ratio and positioning
                    var aspectRatio = (float)logoBitmap.Width / logoBitmap.Height;
                    var logoRect = new SKRect(x, y, x + size, y + size);
                    
                    // Adjust rectangle to maintain aspect ratio
                    if (aspectRatio > 1) // Wider than tall
                    {
                        var newHeight = size / aspectRatio;
                        var offsetY = (size - newHeight) / 2;
                        logoRect = new SKRect(x, y + offsetY, x + size, y + offsetY + newHeight);
                    }
                    else if (aspectRatio < 1) // Taller than wide
                    {
                        var newWidth = size * aspectRatio;
                        var offsetX = (size - newWidth) / 2;
                        logoRect = new SKRect(x + offsetX, y, x + offsetX + newWidth, y + size);
                    }

                    // Draw the logo with transparency and high quality
                    using var paint = new SKPaint
                    {
                        IsAntialias = true,
                        FilterQuality = SKFilterQuality.High,
                        Color = SKColors.White.WithAlpha(opacity) // Apply opacity
                    };
                    
                    canvas.DrawBitmap(logoBitmap, logoRect, paint);
                    logoBitmap.Dispose();
                }
                else
                {
                    // Fallback: draw a faded circle if logo can't be loaded
                    DrawFallbackLogoWithOpacity(canvas, x, y, size, opacity);
                }
            }
            catch
            {
                // Fallback: draw a faded circle if any error occurs
                DrawFallbackLogoWithOpacity(canvas, x, y, size, opacity);
            }
        }
        
        private void DrawFallbackLogoWithOpacity(SKCanvas canvas, float x, float y, float size, byte opacity)
        {
            // Draw a faded green circle as fallback
            var centerX = x + size / 2;
            var centerY = y + size / 2;
            var radius = size / 2;

            using var paint = new SKPaint
            {
                Color = SKColor.Parse("#10B981").WithAlpha(opacity), // Green color with opacity
                Style = SKPaintStyle.Fill,
                IsAntialias = true
            };

            canvas.DrawCircle(centerX, centerY, radius, paint);

            // Add faded "SABES" text
            using var textPaint = new SKPaint
            {
                Color = SKColors.White.WithAlpha(opacity),
                TextSize = size * 0.25f,
                IsAntialias = true,
                Typeface = SKTypeface.FromFamilyName("Arial", SKFontStyle.Bold),
                TextAlign = SKTextAlign.Center
            };

            canvas.DrawText("SABES", centerX, centerY + (textPaint.TextSize / 3), textPaint);
        }
    }
}
