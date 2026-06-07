#if command -q start-hyprland; and status is-login
#    if test (tty) = /dev/tty1
#        exec start-hyprland
#    end
#end
