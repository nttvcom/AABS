@echo off
setlocal enabledelayedexpansion

:: AABS - Android App Backup System
echo ==============================
echo Android App Backup System
echo ==============================
echo.

:: 1. Check ADB connection
echo Checking ADB connection...
adb devices >nul 2>&1

if %errorlevel% neq 0 (
    echo ADB is not installed or device is not connected.
    pause
    exit /b
)

echo Device detected.
echo.

:: 2. Create output folder
set "OUTPUT_DIR=backups"
mkdir %OUTPUT_DIR% 2>nul

:: 3. Get list of installed user apps
echo Retrieving installed applications...
adb shell pm list packages -3 > apps.txt

echo.
echo Starting backup process...
echo ---------------------------------

:: 4. Process each application
for /f "tokens=2 delims=:" %%a in (apps.txt) do (
    set "package=%%a"
    set "package=!package: =!"

    echo Backing up: !package!

    :: Get APK path
    for /f "tokens=2 delims=:" %%b in ('adb shell pm path !package! 2^>nul') do (
        set "apkPath=%%b"
        set "apkPath=!apkPath: =!"

        :: Save APK locally
        adb pull "!apkPath!" "%OUTPUT_DIR%\!package!.apk" >nul 2>&1

        if !errorlevel! == 0 (
            echo   SUCCESS
        ) else (
            echo   FAILED
        )
    )
)

echo.
echo Backup completed.
echo Files saved in: %OUTPUT_DIR%
pause
