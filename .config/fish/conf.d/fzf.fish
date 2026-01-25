set -x FZF_ALT_C_COMMAND "fd --type directory"
set -x FZF_CTRL_T_COMMAND "rg --files --no-require-git"
set -x FZF_DEFAULT_COMMAND "fd --type file --follow"
set -x FZF_DEFAULT_OPTS "--color=$FZF_COLORS"

set -x FZF_COLORS (string join ',' \
    'bg:-1' \
    'bg+:-1' \
    'fg:white' \
    'fg+:white' \
    'info:yellow' \
    'border:-1' \
    'header:white' \
    'hl:green' \
    'hl+:green' \
    'marker:green' \
    'pointer:magenta' \
    'prompt:blue' \
    'spinner:cyan' \
)
