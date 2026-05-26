# Dependencies

## Arch

`hyprland hyprpaper hyprshot waybar rofi ghostty`

## Linux

`fish neovim git fd ripgrep skim ttf-sourcecodepro-nerd`

## Mac

`fish neovim git fd rg sk font-sauce-code-pro-nerd-font`

# Install

Clone bare repo config

`git clone --bare https://github.com/liambutterworth/dotfiles ~/.dotfiles`

Checkout config files

`git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout`

Stop git from showing untracked files (optional)

`git --git-dir=$HOME/.dotfiles config status.showUntrackedFiles no`

Change shell to fish (optional)

`chsh -s $(which fish)`
