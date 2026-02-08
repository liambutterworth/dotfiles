# Dependencies

- [Alacritty](https://github.com/alacritty/alacritty)
- [Sauce Code Pro](https://github.com/ryanoasis/nerd-fonts)
- CLI Packages `tmux fish neovim git mysql httpie fd rg sk`
- LSP Packages `intelephense vscode-langservers-extracted`

# Install

Clone bare repo config

`git clone --bare https://github.com/liambutterworth/dotfiles ~/.dotfiles`

Checkout config files

`git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout`
