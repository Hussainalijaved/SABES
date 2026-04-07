using Android.App;
using Android.Content.PM;
using Android.OS;
using Android.Views;

namespace SABES
{
    [Activity(
        Theme = "@style/Maui.SplashTheme",
        MainLauncher = true,
        LaunchMode = LaunchMode.SingleTop,
        ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation | ConfigChanges.UiMode | ConfigChanges.ScreenLayout | ConfigChanges.SmallestScreenSize | ConfigChanges.Density,
        WindowSoftInputMode = SoftInput.AdjustResize)]
    public class MainActivity : MauiAppCompatActivity
    {
        protected override void OnCreate(Bundle? savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Enable keyboard resize handling
            Window?.SetSoftInputMode(SoftInput.AdjustResize);

            // Set status bar color
            if (Build.VERSION.SdkInt >= BuildVersionCodes.Lollipop)
            {
                Window?.SetStatusBarColor(Android.Graphics.Color.ParseColor("#16a085"));
            }

            // Android emulator specific fixes
            try
            {
                // Enable hardware acceleration for emulator
                if (Build.VERSION.SdkInt >= BuildVersionCodes.Honeycomb)
                {
                    Window?.SetFlags(WindowManagerFlags.HardwareAccelerated, WindowManagerFlags.HardwareAccelerated);
                }

                // Fix for WebView in emulator
                if (Build.VERSION.SdkInt >= BuildVersionCodes.Kitkat)
                {
                    Android.Webkit.WebView.SetWebContentsDebuggingEnabled(true);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"MainActivity OnCreate error: {ex.Message}");
            }
        }
    }
}
