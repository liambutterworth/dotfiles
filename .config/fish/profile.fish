fish_add_path $HOME/.local/bin
fish_add_path /usr/local/sbin

set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH

eval (dircolors -c $HOME/.config/dircolors/dircolors)
