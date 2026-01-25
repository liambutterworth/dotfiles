# Dotfiles

## Dependencies

[Alacritty](https://github.com/alacritty/alacritty)
[Nerd Font - Sauce Code Pro](https://github.com/ryanoasis/nerd-fonts)
Packages `fish git neovim tmux fzf ripgrep`
LSP `intelephense vscode-langservers-extracted`

## Install

Clone bare repo config into hidden directory

`git clone --bare https://github.com/liambutterworth/dotfiles ~/.dotfiles`

Checkout config files

`git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout`

Symlink correct alacritty config

`ln -s ~/.config/alacritty/alacritty.{linux,mac}.toml ~/.config/alacritty/alacritty.toml`
