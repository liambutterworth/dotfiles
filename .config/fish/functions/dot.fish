function dot --wraps git -d "Manage dotfiles"
    git --git-dir=$HOME/.dotfiles --work-tree=$HOME $argv
end
