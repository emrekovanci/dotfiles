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

    $itemType = if ((Get-Item $SourcePath) -is [System.IO.DirectoryInfo]) {
        'Directory'
    } else {
        'File'
    }

    New-Item -ItemType SymbolicLink `
             -Path $DestPath `
             -Target $SourcePath `
             -Force | Out-Null

    Write-Host "[Dst] $DestPath symlinked → [Src] $SourcePath"
}


New-Symlink `
  "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" `
  "$HOME\Documents\GitHub\dotfiles\config\Microsoft.PowerShell_profile.ps1"

New-Symlink `
  "$HOME\.gitconfig" `
  "$HOME\Documents\GitHub\dotfiles\config\.gitconfig"

New-Symlink `
  "$env:APPDATA\.emacs" `
  "$HOME\Documents\GitHub\dotfiles\config\.emacs"

