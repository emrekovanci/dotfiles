# base
winget install -e --id Mozilla.Firefox -s winget
winget install -e --id Nvidia.GeForceExperience -s winget
winget install -e --id VideoLAN.VLC -s winget
winget install -e --id Notion.Notion -s winget
winget install -e --id Skillbrains.Lightshot -s winget
winget install -e --id Discord.Discord -s winget

# utils
winget install -e --id 7zip.7zip -s winget
winget install -e --id AntibodySoftware.WizTree -s winget
winget install -e --id Gyan.FFmpeg -s winget
winget install -e --id Microsoft.Sysinternals.ProcessExplorer -s winget
winget install -e --id Microsoft.Sysinternals.Autoruns -s winget

# network
# instances of cloudflared do not automatically update on Windows
# need to perform manual updates: "cloudflared update"
winget install -e --id Cloudflare.Warp -s winget
winget install -e --id Cloudflare.cloudflared -s winget

# terminal with streoids
winget install -e --id Starship.Starship -s winget
winget install -e --id ajeetdsouza.zoxide -s winget
winget install -e --id XAMPPRocky.tokei -s winget
winget install -e --id BurntSushi.ripgrep.MSVC -s winget
winget install -e --id sharkdp.fd -s winget
winget install -e --id sharkdp.bat -s winget
winget install -e --id junegunn.fzf -s winget
winget install -e --id chmln.sd -s winget
winget install -e --id Clement.bottom -s winget
winget install -e --id bootandy.dust -s winget
winget install -e --id muesli.duf -s winget
winget install -e --id JernejSimoncic.Wget -s winget
winget install -e --id eza-community.eza -s winget
winget install -e --id JesseDuffield.lazygit -s winget

# dev tools
winget install -e --id Git.Git -s winget
winget install -e --id GitHub.GitHubDesktop -s winget
winget install -e --id LLVM.LLVM -s winget
winget install -e --id Kitware.CMake -s winget
winget install -e --id HeidiSQL.HeidiSQL -s winget
winget install -e --id horsicq.DIE-engine -s winget
winget install -e --id Hex-Rays.IDA.Free -s winget

# gaming
winget install -e --id EpicGames.EpicGamesLauncher -s winget
winget install -e --id Valve.Steam -s winget
