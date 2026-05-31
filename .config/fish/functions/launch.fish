function launch -d "Launch app"
    argparse 'q/quit' -- $argv

    command $argv &>/dev/null & disown

    if set -q _flag_quit
        exit
    end
end
