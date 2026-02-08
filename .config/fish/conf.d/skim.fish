set -l color (string join ',' \
    'fg:8' \
    'bg:-1' \
    'matched:1' \
    'matched_bg:-1' \
    'current:15' \
    'current_bg:-1' \
    'current_match:1' \
    'current_match_bg:-1' \
    'spinner:2' \
    'info:2' \
    'prompt:13' \
    'cursor:13' \
    'selected:10' \
    'header:1' \
    'border:7'
)

set -x SKIM_TMUX_OPTS '80%,80%'
set -x SKIM_ALT_C_COMMAND 'fd --type directory'
set -x SKIM_CTRL_T_COMMAND 'rg --files'
set -x SKIM_DEFAULT_OPTIONS "--color=$color --prompt='❯ ' --selector='❯' --multi-selector='+'"
