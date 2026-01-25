if not test -L $XDG_CONFIG_HOME/alacritty/alacritty.toml
    switch (uname)
        case Linux
            set -f alacritty_config '~/.config/alacritty/alacritty.linux.toml'
        case Darwin
            set -f alacritty_config '~/.config/alacritty/alacritty.mac.toml'
    end

    if set -q alacritty_config
        ln -s $alacritty_config ~/.config/alacritty/alacritty.toml
    end
end
