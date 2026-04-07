using Microsoft.Extensions.Logging;
using Microsoft.EntityFrameworkCore;
using SABES.Data;
using SABES.Services;

namespace SABES
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                });

            builder.Services.AddMauiBlazorWebView();

#if ANDROID && DEBUG
            // Android emulator specific settings for debugging
            try
            {
                if (Android.OS.Build.VERSION.SdkInt >= Android.OS.BuildVersionCodes.Kitkat)
                {
                    Android.Webkit.WebView.SetWebContentsDebuggingEnabled(true);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"WebView debugging setup error: {ex.Message}");
            }
#endif

            // Configure SQLite Database
            var dbPath = Path.Combine(FileSystem.AppDataDirectory, "sabes.db");
            builder.Services.AddDbContext<SabesDbContext>(options =>
                options.UseSqlite($"Data Source={dbPath}"));

            // Register Services
            builder.Services.AddScoped<ICategoryService, CategoryService>();
            builder.Services.AddScoped<IItemService, ItemService>();
            builder.Services.AddScoped<IBillService, BillService>();
            builder.Services.AddScoped<IFileService, FileService>();

#if DEBUG
    		builder.Services.AddBlazorWebViewDeveloperTools();
    		builder.Logging.AddDebug();
#endif

            var app = builder.Build();

            // Initialize Database
            using (var scope = app.Services.CreateScope())
            {
                var context = scope.ServiceProvider.GetRequiredService<SabesDbContext>();
                context.Database.EnsureCreated();
            }

            return app;
        }
    }
}
