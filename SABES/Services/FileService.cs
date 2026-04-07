using Microsoft.Extensions.Logging;

namespace SABES.Services
{
    public interface IFileService
    {
        Task<string> SaveImageToDownloadsAsync(byte[] imageBytes, string filename);
        Task<string> SaveFileToDownloadsAsync(byte[] fileBytes, string filename, string mimeType);
        Task<bool> CheckStoragePermissionAsync();
        Task<bool> RequestStoragePermissionAsync();
        Task OpenDownloadsFolderAsync();
        Task ShareImageAsync(byte[] imageBytes, string filename, string title = "Share Bill");
        Task ShareFileAsync(byte[] fileBytes, string filename, string mimeType, string title = "Share Bill");
    }

    public class FileService : IFileService
    {
        private readonly ILogger<FileService> _logger;

        public FileService(ILogger<FileService> logger)
        {
            _logger = logger;
        }

        public async Task<string> SaveImageToDownloadsAsync(byte[] imageBytes, string filename)
        {
            return await SaveFileToDownloadsAsync(imageBytes, filename, "image/png");
        }

        public async Task<string> SaveFileToDownloadsAsync(byte[] fileBytes, string filename, string mimeType)
        {
            try
            {
                _logger.LogInformation($"Starting file save: {filename}, Size: {fileBytes.Length} bytes, MIME: {mimeType}");

#if ANDROID
                // Check and request permissions first
                var hasPermission = await CheckStoragePermissionAsync();
                if (!hasPermission)
                {
                    hasPermission = await RequestStoragePermissionAsync();
                    if (!hasPermission)
                    {
                        _logger.LogWarning("Storage permission denied, using app directory");
                    }
                }

                // Method 1: Try MediaStore for Android 10+ (most compatible)
                if (Android.OS.Build.VERSION.SdkInt >= Android.OS.BuildVersionCodes.Q)
                {
                    try
                    {
                        var mediaStorePath = await SaveToMediaStoreAsync(fileBytes, filename, mimeType);
                        if (!string.IsNullOrEmpty(mediaStorePath))
                        {
                            _logger.LogInformation($"File saved via MediaStore: {mediaStorePath}");
                            return mediaStorePath;
                        }
                    }
                    catch (Exception ex)
                    {
                        _logger.LogError(ex, "MediaStore save failed, trying alternative methods");
                    }
                }

                // Method 2: Try app's external files directory (most reliable fallback)
                try
                {
                    var appExternalDir = Android.App.Application.Context.GetExternalFilesDir(Android.OS.Environment.DirectoryDownloads);
                    if (appExternalDir != null)
                    {
                        var filePath = Path.Combine(appExternalDir.AbsolutePath, filename);
                        await File.WriteAllBytesAsync(filePath, fileBytes);

                        _logger.LogInformation($"File saved to app external dir: {filePath}");

                        // Try to make it visible in Downloads
                        var context = Platform.CurrentActivity ?? Android.App.Application.Context;
                        Android.Media.MediaScannerConnection.ScanFile(context, new[] { filePath }, new[] { mimeType }, null);

                        return filePath;
                    }
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, "Failed to save to app external directory");
                }

                // Method 3: Try traditional Downloads folder (older Android)
                if (hasPermission)
                {
                    try
                    {
                        var downloadsPath = Android.OS.Environment.GetExternalStoragePublicDirectory(Android.OS.Environment.DirectoryDownloads);
                        if (downloadsPath != null && downloadsPath.Exists())
                        {
                            var filePath = Path.Combine(downloadsPath.AbsolutePath, filename);
                            await File.WriteAllBytesAsync(filePath, fileBytes);

                            // Notify media scanner about the new file
                            var context = Platform.CurrentActivity ?? Android.App.Application.Context;
                            Android.Media.MediaScannerConnection.ScanFile(context, new[] { filePath }, new[] { mimeType }, null);

                            _logger.LogInformation($"File saved to Downloads: {filePath}");
                            return filePath;
                        }
                    }
                    catch (Exception ex)
                    {
                        _logger.LogError(ex, "Failed to save to Downloads folder");
                    }
                }
#endif
                // Final fallback: save to app data directory (always works)
                var appDataPath = FileSystem.AppDataDirectory;
                var fallbackPath = Path.Combine(appDataPath, filename);
                await File.WriteAllBytesAsync(fallbackPath, fileBytes);

                _logger.LogInformation($"File saved to app data directory: {fallbackPath}");
                _logger.LogInformation("Note: File saved to app private directory. Use file manager to access.");
                return fallbackPath;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Failed to save file: {filename}");
                throw;
            }
        }

        public async Task<bool> CheckStoragePermissionAsync()
        {
            try
            {
#if ANDROID
                var status = await Permissions.CheckStatusAsync<Permissions.StorageWrite>();
                return status == PermissionStatus.Granted;
#endif
                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to check storage permission");
                return false;
            }
        }

        public async Task<bool> RequestStoragePermissionAsync()
        {
            try
            {
#if ANDROID
                var status = await Permissions.RequestAsync<Permissions.StorageWrite>();
                return status == PermissionStatus.Granted;
#endif
                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to request storage permission");
                return false;
            }
        }

#if ANDROID
        private async Task<string> SaveToMediaStoreAsync(byte[] fileBytes, string filename, string mimeType)
        {
            try
            {
                var context = Platform.CurrentActivity?.ApplicationContext ?? Android.App.Application.Context;
                if (context?.ContentResolver == null)
                {
                    throw new InvalidOperationException("Unable to access ContentResolver");
                }

                var resolver = context.ContentResolver;

                // Create content values for the file
                var contentValues = new Android.Content.ContentValues();
                contentValues.Put(Android.Provider.MediaStore.IMediaColumns.DisplayName, filename);
                contentValues.Put(Android.Provider.MediaStore.IMediaColumns.MimeType, mimeType);

                // Only set RelativePath for Android 10+
                if (Android.OS.Build.VERSION.SdkInt >= Android.OS.BuildVersionCodes.Q)
                {
                    contentValues.Put(Android.Provider.MediaStore.IMediaColumns.RelativePath, Android.OS.Environment.DirectoryDownloads);
                }

                // Insert the file into MediaStore
                var uri = resolver.Insert(Android.Provider.MediaStore.Downloads.ExternalContentUri, contentValues);
                if (uri == null)
                {
                    throw new InvalidOperationException("Failed to create MediaStore entry");
                }

                if (uri != null)
                {
                    // Write the file data
                    using var outputStream = resolver.OpenOutputStream(uri);
                    if (outputStream != null)
                    {
                        await outputStream.WriteAsync(fileBytes, 0, fileBytes.Length);
                        await outputStream.FlushAsync();

                        _logger.LogInformation($"File saved to MediaStore: {uri}");

                        // Show notification to user
                        await ShowDownloadNotificationAsync(filename);

                        return uri.ToString();
                    }
                }

                throw new Exception("Failed to create MediaStore entry");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to save to MediaStore");
                throw;
            }
        }

        private async Task ShowDownloadNotificationAsync(string filename)
        {
            try
            {
                var context = Platform.CurrentActivity?.ApplicationContext ?? Android.App.Application.Context;

                // Create notification channel (required for Android 8.0+)
                if (Android.OS.Build.VERSION.SdkInt >= Android.OS.BuildVersionCodes.O)
                {
                    var channelId = "download_channel";
                    var channelName = "Downloads";
                    var channel = new Android.App.NotificationChannel(channelId, channelName, Android.App.NotificationImportance.Default)
                    {
                        Description = "Download notifications"
                    };

                    var notificationManager = (Android.App.NotificationManager)context.GetSystemService(Android.Content.Context.NotificationService);
                    notificationManager.CreateNotificationChannel(channel);
                }

                // Create notification
                var builder = new AndroidX.Core.App.NotificationCompat.Builder(context, "download_channel")
                    .SetSmallIcon(Android.Resource.Drawable.StatSysDownloadDone)
                    .SetContentTitle("Download Complete")
                    .SetContentText($"Bill exported: {filename}")
                    .SetAutoCancel(true)
                    .SetPriority(AndroidX.Core.App.NotificationCompat.PriorityDefault);

                var notificationManagerCompat = AndroidX.Core.App.NotificationManagerCompat.From(context);
                notificationManagerCompat.Notify(1001, builder.Build());

                _logger.LogInformation("Download notification shown");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to show notification");
                // Don't throw - notification is optional
            }
        }
#endif

        public async Task OpenDownloadsFolderAsync()
        {
            try
            {
#if ANDROID
                var context = Platform.CurrentActivity ?? Android.App.Application.Context;

                // Create intent to open Downloads folder
                var intent = new Android.Content.Intent(Android.Content.Intent.ActionView);
                intent.SetType("*/*");
                intent.PutExtra("android.provider.extra.INITIAL_URI", Android.Provider.MediaStore.Downloads.ExternalContentUri);
                intent.AddFlags(Android.Content.ActivityFlags.NewTask);

                // Try to open Downloads app
                try
                {
                    context.StartActivity(intent);
                    _logger.LogInformation("Opened Downloads folder");
                }
                catch
                {
                    // Fallback: Open file manager
                    var fileManagerIntent = new Android.Content.Intent(Android.Content.Intent.ActionGetContent);
                    fileManagerIntent.SetType("*/*");
                    fileManagerIntent.AddFlags(Android.Content.ActivityFlags.NewTask);
                    context.StartActivity(fileManagerIntent);
                    _logger.LogInformation("Opened file manager as fallback");
                }
#endif
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to open Downloads folder");
                // Don't throw - this is optional functionality
            }
        }

        public async Task ShareImageAsync(byte[] imageBytes, string filename, string title = "Share Bill")
        {
            await ShareFileAsync(imageBytes, filename, "image/png", title);
        }

        public async Task ShareFileAsync(byte[] fileBytes, string filename, string mimeType, string title = "Share Bill")
        {
            try
            {
                _logger.LogInformation($"Starting file share: {filename}, Size: {fileBytes.Length} bytes, MIME: {mimeType}");

#if ANDROID
                var context = Platform.CurrentActivity ?? Android.App.Application.Context;
                if (context == null)
                {
                    throw new InvalidOperationException("Unable to access Android context");
                }

                // Create a temporary file in cache directory for sharing
                var cacheDir = context.CacheDir;
                if (cacheDir == null)
                {
                    throw new InvalidOperationException("Unable to access cache directory");
                }

                var tempFile = new Java.IO.File(cacheDir, filename);

                // Write file bytes to temporary file
                using (var fileOutputStream = new Java.IO.FileOutputStream(tempFile))
                {
                    await fileOutputStream.WriteAsync(fileBytes);
                    fileOutputStream.Flush();
                }

                // Create content URI using FileProvider
                var authority = $"{context.PackageName}.fileprovider";
                var contentUri = AndroidX.Core.Content.FileProvider.GetUriForFile(context, authority, tempFile);

                // Create share intent
                var shareIntent = new Android.Content.Intent(Android.Content.Intent.ActionSend);
                shareIntent.SetType(mimeType);
                shareIntent.PutExtra(Android.Content.Intent.ExtraStream, contentUri);
                shareIntent.PutExtra(Android.Content.Intent.ExtraText, $"SABES Bill - {filename}");
                shareIntent.PutExtra(Android.Content.Intent.ExtraSubject, title);
                shareIntent.AddFlags(Android.Content.ActivityFlags.GrantReadUriPermission);

                // Create chooser to show all available sharing apps
                var chooserIntent = Android.Content.Intent.CreateChooser(shareIntent, title);
                chooserIntent?.AddFlags(Android.Content.ActivityFlags.NewTask);

                if (chooserIntent != null)
                {
                    context.StartActivity(chooserIntent);
                    _logger.LogInformation($"Share intent launched for: {filename}");
                }
                else
                {
                    throw new InvalidOperationException("Unable to create share chooser");
                }
#else
                // For other platforms, fall back to saving file
                await SaveFileToDownloadsAsync(fileBytes, filename, mimeType);
                _logger.LogInformation($"File saved instead of shared on non-Android platform: {filename}");
#endif
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Failed to share file: {filename}");
                throw;
            }
        }
    }
}
