# Install Dotfiles

Install dependencies

`ghostty fish git neovim nodejs npm fd ripgrep skim docker docker-compose`

Clone bare repo config

`git clone --bare https://github.com/liambutterworth/dotfiles ~/.dotfiles`

Checkout config files

`git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout`

Stop git from showing untracked files (optional)

`git --git-dir=$HOME/.dotfiles config status.showUntrackedFiles no`

Change shell to fish (optional)

`chsh -s (which fish)`

# Setup SSH

Generate the key

`ssh-keygen -t ed25519 -C "your@email.com"`

Start the agent

`eval (ssh-agent -c)`

Add the key

`ssh-add ~/.ssh/id_ed25519`

Copy the key (paste into github)

`cat ~/.ssh/id_ed25519.pub | wl-copy`

Verify authentication

`ssh -T git@github.com`
