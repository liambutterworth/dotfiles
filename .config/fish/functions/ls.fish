function ls
    if type -q exa
        exa -al --color=always --icons=always --group-directories-first $argv
    else
        ls $argv
    end
end
