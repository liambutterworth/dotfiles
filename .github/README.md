# Install

System packages

`efibootmgr grub grub-btrfs snapper snap-pac nvidia-open pipewire pipewire-alsa pipewire-pulse`

Desktop packages

`hyprland hypridle hyprlock hyprpaper hyprpicker hyprshot dunst rofi waybar`

Terminal packages

`ghostty fish git neovim node npm fd ripgrep skim ttf-sourcecodepro-nerd`

Application packages

`discord steam obsidian reaper blender krita vlc transmission-cli transmission-qt`

Arch User Repository packages

`zen-browser-bin`

# Config

Clone bare repo config

`git clone --bare https://github.com/liambutterworth/dotfiles ~/.dotfiles`

Checkout config files

`git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout`

Stop git from showing untracked files (optional)

`git --git-dir=$HOME/.dotfiles config status.showUntrackedFiles no`

Change shell to fish (optional)

`chsh -s $(which fish)`

# SSH

Generate the key

`ssh-keygen -t ed25519 -c 'my@email.com'`

Start the agent

`eval (ssh-agent -s)`

Add the key

`ssh-add ~/.ssh/id_ed25519`

Copy the key (paste into github)

`cat ~/.ssh/id_ed25519.pub | wl-copy`

# Mac

Install terminal

`brew install --cask ghostty font-sauce-code-pro-nerd-font`

Install dependencies

`fish neovim git fd rg sk node`
