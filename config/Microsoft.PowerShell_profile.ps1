if ($PSVersionTable.PSVersion.Major -ge 7) {
    $PSStyle.FileInfo.Directory = $PSStyle.Foreground.White
}

# aliases
Set-Alias -Name vi -Value nvim

function vim {
    nvim --clean @args
}

Set-PSReadLineOption -EditMode Emacs
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

# starship
# https://learn.microsoft.com/en-us/windows/terminal/tutorials/new-tab-same-directory
Invoke-Expression (&starship init powershell)
function Invoke-Starship-PreCommand {
    $loc = $executionContext.SessionState.Path.CurrentLocation;
    $prompt = "$([char]27)]9;12$([char]7)"
    if ($loc.Provider.Name -eq "FileSystem") {
        $prompt += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
    }
    $host.ui.Write($prompt)
}

# zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# others
function sview() {
    $currentStyle = (Get-PSReadLineOption).PredictionViewStyle
    if ($currentStyle -eq "InlineView") {
        Set-PSReadLineOption -PredictionViewStyle ListView
    } else {
        Set-PSReadLineOption -PredictionViewStyle InlineView
    }
}
