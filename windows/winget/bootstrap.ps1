# base
winget install -e --id Mozilla.Firefox -s winget
winget install -e --id Nvidia.GeForceExperience -s winget
winget install -e --id VideoLAN.VLC -s winget
winget install -e --id Notion.Notion -s winget
winget install -e --id Skillbrains.Lightshot -s winget

# utils
winget install -e --id 7zip.7zip -s winget
winget install -e --id AntibodySoftware.WizTree -s winget

# network
# instances of cloudflared do not automatically update on Windows
# need to perform manual updates: "cloudflared update"
winget install -e --id Cloudflare.Warp -s winget
winget install -e --id Cloudflare.cloudflared -s winget

# terminal with streoids [~37mb]
winget install -e --id Starship.Starship -s winget
winget install -e --id ajeetdsouza.zoxide -s widget
winget install -e --id AlDanial.Cloc -s winget
winget install -e --id BurntSushi.ripgrep.MSVC -s winget
winget install -e --id dandavison.delta -s winget
winget install -e --id sharkdp.fd -s winget

# dev tools (sublime install will not add context action)
winget install -e --id Git.Git -s winget
winget install -e --id GitHub.GitHubDesktop -s winget
winget install -e --id LLVM.LLVM -s winget
winget install -e --id Kitware.CMake -s winget
winget install -e --id SublimeHQ.SublimeText.4 -s winget
winget install -e --id Microsoft.VisualStudioCode -s winget

# other dev tools
winget install -e --id Hex-Rays.IDA.Free -s winget

# chat
winget install -e --id Discord.Discord -s winget

# gaming
winget install -e --id EpicGames.EpicGamesLauncher -s winget
winget install -e --id Valve.Steam -s winget
