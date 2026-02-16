function New-Symlink {
    param (
        [Parameter(Mandatory)]
        [string]$DestPath,

        [Parameter(Mandatory)]
        [string]$SourcePath
    )

    if (Test-Path $DestPath) {
        Write-Warning "$DestPath already exists"
        return
    }

    if (-not (Test-Path $SourcePath)) {
        Write-Error "Source path does not exist: $SourcePath"
        return
    }

    New-Item -ItemType SymbolicLink `
             -Path $DestPath `
             -Target $SourcePath `
             -Force | Out-Null

    Write-Host "[Dst] $DestPath symlinked -> [Src] $SourcePath"
}

# Env Vars
[System.Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME",     "$HOME\Documents\GitHub\dotfiles\",                     "USER")
[System.Environment]::SetEnvironmentVariable("STARSHIP_CONFIG",     "$HOME\Documents\GitHub\dotfiles\config\starship.toml", "USER")
[System.Environment]::SetEnvironmentVariable("RIPGREP_CONFIG_PATH", "$HOME\Documents\GitHub\dotfiles\config\.ripgreprc",    "USER")

# Symlinks
New-Symlink `
    "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" `
    "$HOME\Documents\GitHub\dotfiles\config\Microsoft.PowerShell_profile.ps1"

New-Symlink `
    "$env:APPDATA\zed\settings.json" `
    "$HOME\Documents\GitHub\dotfiles\zed\settings.json"
