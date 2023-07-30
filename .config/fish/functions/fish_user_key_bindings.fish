function fish_user_key_bindings
    fish_vi_key_bindings
    fzf_key_bindings

    bind -M insert \cf accept-autosuggestion
    bind -M insert \cx accept-autosuggestion execute
    bind -M insert \cp history-search-backward
    bind -M insert \cn history-search-forward
    bind -M insert \cg fzf-cd-widget
end
