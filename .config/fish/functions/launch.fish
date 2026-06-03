function launch -d "Launch app"
    for app in $argv
        command $app &>/dev/null & disown
    end
end
