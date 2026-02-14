if ($PSVersionTable.PSVersion.Major -ge 7) {
    $PSStyle.FileInfo.Directory = $PSStyle.Foreground.White
}

# aliases
Set-Alias -Name vi -Value nvim

function fh {
    Get-Content (Get-PSReadLineOption).HistorySavePath | fzf --style minimal --tac --no-sort | Invoke-Expression
}

function fdf {
    fd --type f | fzf --style minimal --preview 'bat -n --color=always {}' --multi --bind 'enter:become(nvim {+})'
}

function vrg {
    rg --vimgrep --trim $args | fzf --style minimal --delimiter ':' --bind 'enter:become(nvim {1} +{2})'
}

# colors
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
