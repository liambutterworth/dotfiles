function ls
    switch (uname)
        case Darwin; command ls -G $argv
        case Linux; command ls --color=auto $argv
    end
end
