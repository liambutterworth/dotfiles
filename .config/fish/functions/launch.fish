function launch -d "Launch app"
    command $argv &>/dev/null & disown && exit
end
