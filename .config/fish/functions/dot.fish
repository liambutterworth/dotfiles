function dot -w git -d "Manage dotfiles"
    git --git-dir=$HOME/.dotfiles --work-tree=$HOME $argv
end
