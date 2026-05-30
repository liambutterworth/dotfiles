function launch -d "Launch app"
    argparse 'c/close' -- $argv
    command $argv & disown

    if set -q _flag_close
        exit
    end
end
