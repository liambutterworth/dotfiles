fish_add_path $HOME/.local/bin
fish_add_path /usr/local/sbin

set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH

eval (dircolors -c $HOME/.config/dircolors/dircolors)

alias cl2-stage="mysql --login-path=cl2-stage --pager=less --vertical recruiting"
alias cl2-prod="mysql --login-path=cl2-prod --pager=less --vertical recruiting"
