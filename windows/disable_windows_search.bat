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


:: -----------------------------------------------
:: ------------Disable Windows Search-------------
:: -----------------------------------------------
echo --- Disable Windows Search
PowerShell -ExecutionPolicy Unrestricted -Command "Set-Service -StartupType Disabled WSearch"


:: Pause the script to view the final state
pause
:: Restore previous environment settings
endlocal
:: Exit the script successfully
exit /b 0
