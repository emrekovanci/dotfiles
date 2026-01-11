# create Profile file
# New-Item -Path $PROFILE -Type File -Force

# create symlink for profile
# Default: New-Item -Path ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -ItemType SymbolicLink -Value ~\Documents\GitHub\dotfiles\config\Microsoft.PowerShell_profile.ps1
# PWSH 7+: New-Item -Path ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -ItemType SymbolicLink -Value ~\Documents\GitHub\dotfiles\config\Microsoft.PowerShell_Profile.ps1

if ($PSVersionTable.PSVersion.Major -ge 7)
{
    $PSStyle.FileInfo.Directory = $PSStyle.Background.FromRgb(20, 70, 50) + $PSStyle.Foreground.White
}

# aliases
Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim
Set-Alias -Name grep -Value rg

# env variables
$ENV:XDG_CONFIG_HOME = "$HOME\Documents\GitHub\dotfiles\"
$ENV:STARSHIP_CONFIG = "$HOME\Documents\GitHub\dotfiles\config\starship.toml"
$ENV:RIPGREP_CONFIG_PATH = "$HOME\Documents\GitHub\dotfiles\config\.ripgreprc"

# https://github.com/starship/starship
Invoke-Expression (&starship init powershell)

# Install-Module -Name PowerShellGet -Force (required for PowerShell 5.1)
# Install-Module PSReadLine
# https://github.com/PowerShell/PSReadLine
$PSReadLineOptions = @{
    Colors = @{
        "Command"          = "#89ddff" # blue5
        "Comment"          = "#565f89" # Gray
        "Operator"         = "#8181f7" # Purple
        "InlinePrediction" = "#565f89" # gray
        "String"           = "#9ece6a" # green
        "Parameter"        = "#ff9e64" # orange
        "Variable"         = "#2ac3de" # blue1
    }
}
Set-PSReadLineOption @PSReadLineOptions

# https://github.com/ajeetdsouza/zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

function whereis($command)
{
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function sview()
{
    $currentStyle = (Get-PSReadLineOption).PredictionViewStyle
    if ($currentStyle -eq "InlineView") {
        Set-PSReadLineOption -PredictionViewStyle ListView
    } else {
        Set-PSReadLineOption -PredictionViewStyle InlineView
    }
}

# https://learn.microsoft.com/en-us/windows/terminal/tutorials/new-tab-same-directory
function Invoke-Starship-PreCommand
{
    $loc = $executionContext.SessionState.Path.CurrentLocation;
    $prompt = "$([char]27)]9;12$([char]7)"
    if ($loc.Provider.Name -eq "FileSystem")
    {
        $prompt += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
    }
    $host.ui.Write($prompt)
}
