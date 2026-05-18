# Dependencies

[Alacritty Terminal](https://github.com/alacritty/alacritty)  
[Sauce Code Pro Nerd Font](https://github.com/ryanoasis/nerd-fonts)  

Linux: `tmux fish neovim git mysql httpie fd ripgrep skim`
Mac: `tmux fish neovim git mysql httpie fd rg sk`

# Install

Clone bare repo config

`git clone --bare https://github.com/liambutterworth/dotfiles ~/.dotfiles`

Checkout config files

`git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout`
