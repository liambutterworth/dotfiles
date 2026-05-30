function launch -d "Launch app and exit"
    command $argv & disown && exit
end
