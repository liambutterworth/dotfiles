function tree --description 'tree list for directory'
    command tree --dirsfirst -I 'node_modules|plugged|vendor' -C $argv
end
