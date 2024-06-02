# profile file
# New-Item -Path $PROFILE -Type File -Force

# create symlink for profile file
# New-Item -Path ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -ItemType SymbolicLink -Value ~\Documents\GitHub\dotfiles\config\Microsoft.PowerShell_profile.ps1

# aliases
Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim
Set-Alias -Name grep -Value rg

# env variables
$ENV:STARSHIP_CONFIG = "$HOME\Documents\GitHub\dotfiles\config\starship.toml"
$ENV:RIPGREP_CONFIG_PATH = "$HOME\Documents\GitHub\dotfiles\config\.ripgreprc"
$ENV:XDG_CONFIG_HOME = "$HOME\Documents\GitHub\dotfiles\"

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
