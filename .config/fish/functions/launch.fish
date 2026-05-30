function launch -d "Launch app"
    argparse 'q/quit' -- $argv

    command $argv & disown

    if set -q _flag_quit
        exit
    end
end
