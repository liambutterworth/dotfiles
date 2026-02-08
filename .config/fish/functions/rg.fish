function rg
    command rg \
        --colors 'path:fg:blue' \
        --colors 'column:fg:magenta' \
        --colors 'line:fg:magenta' \
        --colors 'match:fg:red' \
        $argv
end
