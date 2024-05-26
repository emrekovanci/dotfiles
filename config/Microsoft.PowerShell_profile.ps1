# profile file
# New-Item -Path $PROFILE -Type File -Force

# create symlink for profile file
# New-Item -Path ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -ItemType SymbolicLink -Value ~\Documents\GitHub\dotfiles\config\Microsoft.PowerShell_profile.ps1

# aliases
Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim
Set-Alias -Name grep -Value findstr

# env variables
$ENV:STARSHIP_CONFIG = "$HOME\Documents\GitHub\dotfiles\config\starship.toml"
$ENV:RIPGREP_CONFIG_PATH = "$HOME\Documents\GitHub\dotfiles\config\.ripgreprc"
$ENV:XDG_CONFIG_HOME = "$HOME\Documents\GitHub\dotfiles\"
$ENV:POWERSHELL_TELEMETRY_OPTOUT = 1
$ENV:DOTNET_CLI_TELEMETRY_OPTOUT = 1

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

# Functions
function whereis($command)
{
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Ps-readline view toggle
function set-predictionview
{
    [cmdletbinding(SupportsShouldProcess)]
    [alias("spv", "sview")]
    [OutputType("none")]
    Param(
        [Parameter(Position = 0, HelpMessage = "Specify the prediction style. Toggle will switch to the unused style.")]
        [ValidateSet("List", "InLine", "Toggle")]
        [string]$View = "Toggle",
        [switch]$Passthru
    )

    Try
    {
        Switch ($View)
        {
            "List" { $style = "ListView" }
            "Inline" { $style = "InLineView" }
            "Toggle"
            {
                Switch ((Get-PSReadLineOption).PredictionViewStyle) 
                {
                    "InLineview" { $style = "ListView" }
                    "ListView" { $style = "InLineView" }
                    Default { Write-Warning "Could not determine a view style. Are you running PSReadline v2.2.2 or later?" }
                }
            }
        }

        if ($style -AND ($PSCmdlet.ShouldProcess($style, "Set prediction view style")))
        {
            Set-PSReadLineOption -PredictionViewStyle $style
            if ($Passthru)
            {
                Get-PredictionView
            }
        }
    }
    Catch
    {
        Write-Warning "There was a problem. Could not determine a view style. Are you running PSReadline v2.2.2 or later? $($_.exception.message)."
    }
}
