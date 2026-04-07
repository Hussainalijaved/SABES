# SABES App Installation Script for Google Pixel 4
# This script installs the SABES app directly to your connected Android device

Write-Host "🚀 SABES App Installation Script" -ForegroundColor Green
Write-Host "=================================" -ForegroundColor Green

# Check if device is connected
Write-Host "📱 Checking for connected Android devices..." -ForegroundColor Yellow

# Find ADB in Android SDK
$possibleAdbPaths = @(
    "$env:ANDROID_HOME\platform-tools\adb.exe",
    "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe",
    "C:\Users\$env:USERNAME\AppData\Local\Android\Sdk\platform-tools\adb.exe",
    "C:\Android\platform-tools\adb.exe"
)

$adbPath = $null
foreach ($path in $possibleAdbPaths) {
    if (Test-Path $path) {
        $adbPath = $path
        break
    }
}

if (-not $adbPath) {
    Write-Host "❌ ADB not found. Please ensure Android SDK is installed." -ForegroundColor Red
    Write-Host "💡 Alternative: Manually copy APK to device and install via file manager." -ForegroundColor Yellow
    Write-Host "📁 APK Location: .\bin\Release\net9.0-android\" -ForegroundColor Cyan
    exit 1
}

Write-Host "✅ Found ADB at: $adbPath" -ForegroundColor Green

# Check connected devices
$devices = & $adbPath devices
if ($devices -match "device$") {
    Write-Host "✅ Android device connected!" -ForegroundColor Green
} else {
    Write-Host "❌ No Android device found. Please:" -ForegroundColor Red
    Write-Host "   1. Connect your Google Pixel 4 via USB" -ForegroundColor Yellow
    Write-Host "   2. Enable USB Debugging in Developer Options" -ForegroundColor Yellow
    Write-Host "   3. Accept USB Debugging prompt on device" -ForegroundColor Yellow
    exit 1
}

# Find APK file
$apkPath = ".\bin\Release\net9.0-android\com.arslandevs.sabes-Signed.apk"
if (-not (Test-Path $apkPath)) {
    Write-Host "❌ APK file not found at: $apkPath" -ForegroundColor Red
    Write-Host "💡 Building release APK first..." -ForegroundColor Yellow
    
    # Build release APK
    dotnet publish -f net9.0-android -c Release -p:AndroidPackageFormat=apk
    
    if (-not (Test-Path $apkPath)) {
        Write-Host "❌ Failed to build APK. Please check build errors." -ForegroundColor Red
        exit 1
    }
}

Write-Host "✅ Found APK: $apkPath" -ForegroundColor Green

# Install APK
Write-Host "📱 Installing SABES app to your Google Pixel 4..." -ForegroundColor Yellow
$installResult = & $adbPath install -r $apkPath

if ($LASTEXITCODE -eq 0) {
    Write-Host "🎉 SABES app successfully installed!" -ForegroundColor Green
    Write-Host "📱 You can now find 'SABES - Electric Store' in your app drawer" -ForegroundColor Cyan
    Write-Host "" -ForegroundColor White
    Write-Host "🔧 New Features to Test:" -ForegroundColor Yellow
    Write-Host "   ✅ Export as Image (Fixed - No more crashes!)" -ForegroundColor Green
    Write-Host "   ✅ Share Image (NEW - Opens WhatsApp, Gmail, etc.)" -ForegroundColor Green
    Write-Host "   ✅ Professional UI with SABES branding" -ForegroundColor Green
    Write-Host "" -ForegroundColor White
    Write-Host "📋 Test Steps:" -ForegroundColor Cyan
    Write-Host "   1. Open SABES app on your Pixel 4" -ForegroundColor White
    Write-Host "   2. Create or view any bill" -ForegroundColor White
    Write-Host "   3. Click 'Share Image' button" -ForegroundColor White
    Write-Host "   4. Select WhatsApp from share menu" -ForegroundColor White
    Write-Host "   5. Choose contact and send!" -ForegroundColor White
} else {
    Write-Host "❌ Installation failed. Error details:" -ForegroundColor Red
    Write-Host $installResult -ForegroundColor Red
    Write-Host "" -ForegroundColor White
    Write-Host "💡 Manual Installation:" -ForegroundColor Yellow
    Write-Host "   1. Copy APK to your device's Downloads folder" -ForegroundColor White
    Write-Host "   2. Open Files app on your Pixel 4" -ForegroundColor White
    Write-Host "   3. Navigate to Downloads and tap the APK" -ForegroundColor White
    Write-Host "   4. Allow installation from unknown sources if prompted" -ForegroundColor White
}

Write-Host "" -ForegroundColor White
Write-Host "🚀 SABES - Powered by Arslandevs" -ForegroundColor Green
