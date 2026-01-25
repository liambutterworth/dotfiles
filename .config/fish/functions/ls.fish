function ls --description 'list directory'
    switch (uname)
        case Darwin
            command ls -G $argv
        case Linux
            command ls --color=always --group-directories-first $argv case '*'
            command ls
    end
end
