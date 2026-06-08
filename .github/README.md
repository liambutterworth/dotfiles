# Install

## Linux

```
ghostty fish neovim git fd ripgrep skim ttf-sourcecodepro-nerd
hyprland hypridle hyprlock hyprpaper hyprpicker hyprshot wayber
nvidia-open pipewire pipewire-alsa pipewire-pulse
transmission-cli transmission-qt vlc vlc-gui-ncurses
```

## Mac

`fish neovim git fd rg sk font-sauce-code-pro-nerd-font`

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
