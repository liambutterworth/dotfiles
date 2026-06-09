# Install Packages

System packages

`efibootmgr limine snap-pac nvidia-open pipewire-alsa pipewire-jack pipewire-pulse`

Desktop packages

`hyprland hypridle hyprlock hyprpaper hyprshot dunst rofi waybar ttf-sourcecodepro-nerd`

Terminal packages

`ghostty fish git neovim fd ripgrep skim viu btop docker docker-compose`

Application packages

`obsidian reaper blender discord steam obs-studio mpv-mpris yt-dlp transmission-cli`

Arch User Repository packages

`zen-browser-bin`

# Clone Config

Clone bare repo config

`git clone --bare https://github.com/liambutterworth/dotfiles ~/.dotfiles`

Checkout config files

`git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout`

Stop git from showing untracked files (optional)

`git --git-dir=$HOME/.dotfiles config status.showUntrackedFiles no`

Change shell to fish (optional)

`chsh -s $(which fish)`

# Setup SSH

Generate the key

`ssh-keygen -t ed25519 -c 'my@email.com'`

Start the agent

`eval (ssh-agent -s)`

Add the key

`ssh-add ~/.ssh/id_ed25519`

Copy the key (paste into github)

`cat ~/.ssh/id_ed25519.pub | wl-copy`
