@echo off
echo Checking and enabling GameDVR settings...

:: Step 3: HKEY_CURRENT_USER\System\GameConfigStore
reg query "HKEY_CURRENT_USER\System\GameConfigStore" /v GameDVR_Enabled >nul 2>&1
if %errorlevel% neq 0 (
    echo GameDVR_Enabled not found, creating it...
    reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 1 /f
) else (
    echo GameDVR_Enabled exists, setting to 1...
    reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 1 /f
)

:: Step 4: HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled >nul 2>&1
if %errorlevel% neq 0 (
    echo AppCaptureEnabled not found, creating it...
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 1 /f
) else (
    echo AppCaptureEnabled exists, setting to 1...
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 1 /f
)

:: Step 5: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR >nul 2>&1
if %errorlevel% neq 0 (
    echo AllowGameDVR not found, creating it...
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 1 /f
) else (
    echo AllowGameDVR exists, setting to 1...
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 1 /f
)

echo.
echo Done! Restart your PC for changes to take effect.
pause