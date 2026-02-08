function fish_user_key_bindings
    fish_vi_key_bindings
    skim_key_bindings
    # fzf_key_bindings

    bind --mode insert \cf accept-autosuggestion
    bind --mode insert \cx accept-autosuggestion execute
    bind --mode insert \cp history-search-backward
    bind --mode insert \cn history-search-forward
end
