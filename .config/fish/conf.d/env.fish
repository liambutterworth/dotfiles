set -x EDITOR 'nvim'
set -x LS_COLORS 'di=34:ln=35:so=32:pi=33:ex=31:ow=34'
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_STATE_HOME "$HOME/.local/state"


# TODO move below to ~/.config/fish/functions/skim_key_bindings.fish and rewrite
# ------------------------------------------------------------------------------

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

set -x SKIM_DEFAULT_OPTIONS (string join ' ' -- \
    "--color=$color" \
    "--prompt='❯ '" \
    "--selector='❯'" \
    "--multi-selector='+'"
)

set -x SKIM_ALT_C_COMMAND 'fd --color=never --type directory'
set -x SKIM_CTRL_T_COMMAND 'fd --color=never --type file'
set -x SKIM_TMUX_OPTS '80%,80%'

