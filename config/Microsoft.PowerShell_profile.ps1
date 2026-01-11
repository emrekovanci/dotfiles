if ($PSVersionTable.PSVersion.Major -ge 7) {
    $PSStyle.FileInfo.Directory = $PSStyle.Background.FromRgb(20, 70, 50) + $PSStyle.Foreground.White
}

# aliases
Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim
Set-Alias -Name grep -Value rg

# env variables
$env:XDG_CONFIG_HOME     = "$HOME\Documents\GitHub\dotfiles\"
$env:STARSHIP_CONFIG     = "$HOME\Documents\GitHub\dotfiles\config\starship.toml"
$env:RIPGREP_CONFIG_PATH = "$HOME\Documents\GitHub\dotfiles\config\.ripgreprc"

# terminal utils
Invoke-Expression (&starship init powershell)

# https://learn.microsoft.com/en-us/windows/terminal/tutorials/new-tab-same-directory
function Invoke-Starship-PreCommand {
    $loc = $executionContext.SessionState.Path.CurrentLocation;
    $prompt = "$([char]27)]9;12$([char]7)"
    if ($loc.Provider.Name -eq "FileSystem") {
        $prompt += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
    }
    $host.ui.Write($prompt)
}

Invoke-Expression (& { (zoxide init powershell | Out-String) })
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

# others
function whereis($command) {
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

function countdown($seconds) {
    for ($i=$seconds; $i -ge 0; $i--) {
        Write-Host -NoNewline "`rCountdown: $i   "
        Start-Sleep 1
    }
    Write-Host
    [console]::Beep(1000, 500)
}
