@echo off
:: https://privacy.sexy — v0.13.3 — Mon, 13 May 2024 15:34:31 GMT
:: Ensure admin privileges
fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)
:: Initialize environment
setlocal EnableExtensions DisableDelayedExpansion


:: ----------------------------------------------------------
:: ------------Disable Bing search in start menu-------------
:: ----------------------------------------------------------
echo --- Disable Bing search in start menu
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t "REG_DWORD" /d "0" /f
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable web search in search bar-------------
:: ----------------------------------------------------------
echo --- Disable web search in search bar
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t "REG_DWORD" /d "1" /f
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable web results in Windows Search-----------
:: ----------------------------------------------------------
echo --- Disable web results in Windows Search
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t "REG_DWORD" /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t "REG_DWORD" /d "0" /f
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $ignoreWindows10 =  $false; $ignoreWindows11 =  $false; $warn =  $false; $osVersion = [System.Environment]::OSVersion.Version; function Test-IsWindows10 { ($osVersion.Major -eq 10) -and ($osVersion.Build -lt 22000) }; function Test-IsWindows11 { ($osVersion.Major -gt 10) -or (($osVersion.Major -eq 10) -and ($osVersion.Build -ge 22000)) }; if (($ignoreWindows10 -and (Test-IsWindows10)) -or ($ignoreWindows11 -and (Test-IsWindows11))) {; echo "^""Skipping"^""; exit 0 <# Skip #>; }; if ($warn) {; Write-Warning "^""$message"^""; } else {; Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: Pause the script to view the final state
pause
:: Restore previous environment settings
endlocal
:: Exit the script successfully
exit /b 0
