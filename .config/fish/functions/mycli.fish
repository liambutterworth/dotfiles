function mycli
    mkdir -p ~/.local/state/mycli
    command mycli --myclirc $XDG_CONFIG_HOME/mycli/myclirc $argv
end
