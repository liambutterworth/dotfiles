function skim_key_bindings
    function skim-file-widget -d "List files and folders"
        set -l commandline (__skim_parse_commandline)
        set -l dir $commandline[1]
        set -l skim_query $commandline[2]

        test -n "$SKIM_CTRL_T_COMMAND"; or set -l SKIM_CTRL_T_COMMAND "
        command find -L \$dir -mindepth 1 \\( -path \$dir'*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
        -o -type f -print \
        -o -type d -print \
        -o -type l -print 2> /dev/null | sed 's@^\./@@'"

        begin
            set -lx SKIM_DEFAULT_OPTIONS "--reverse $SKIM_DEFAULT_OPTIONS $SKIM_CTRL_T_OPTS"
            eval "$SKIM_CTRL_T_COMMAND | "(__skimcmd)' -m --query "'$skim_query'"' | while read -l r; set result $result $r; end
        end

        if [ -z "$result" ]
            commandline -f repaint
            return
        else
            commandline -t ""
        end

        for i in $result
            commandline -it -- (string escape $i)
            commandline -it -- ' '
        end

        commandline -f repaint
    end

    function skim-history-widget -d "Show command history"
        begin
            set -lx SKIM_DEFAULT_OPTIONS "$SKIM_DEFAULT_OPTIONS --bind=ctrl-r:toggle-sort $SKIM_CTRL_R_OPTS --no-multi"
            set -l FISH_MAJOR (echo $version | cut -f1 -d.)
            set -l FISH_MINOR (echo $version | cut -f2 -d.)

            if [ "$FISH_MAJOR" -gt 2 -o \( "$FISH_MAJOR" -eq 2 -a "$FISH_MINOR" -ge 4 \) ];
                history -z | eval (__skimcmd) --read0 --print0 -q '(commandline)' | read -lz result
                and commandline -- $result
            else
                history | eval (__skimcmd) -q '(commandline)' | read -l result
                and commandline -- $result
            end
        end

        commandline -f repaint
    end

    function skim-cd-widget -d "Change directory"
        set -l commandline (__skim_parse_commandline)
        set -l dir $commandline[1]
        set -l skim_query $commandline[2]

        test -n "$SKIM_ALT_C_COMMAND"; or set -l SKIM_ALT_C_COMMAND "
        command find -L \$dir -mindepth 1 \\( -path \$dir'*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
        -o -type d -print 2> /dev/null | sed 's@^\./@@'"

        begin
            set -lx SKIM_DEFAULT_OPTIONS "--reverse $SKIM_DEFAULT_OPTIONS $SKIM_ALT_C_OPTS"
            eval "$SKIM_ALT_C_COMMAND | "(__skimcmd)' --no-multi --query "'$skim_query'"' | read -l result

            if [ -n "$result" ]
                cd $result
                commandline -t ""
            end
        end

        commandline -f repaint
    end

    function __skimcmd
        test -n "$SKIM_TMUX"; or set SKIM_TMUX 0
        test -n "$SKIM_TMUX_HEIGHT"; or set SKIM_TMUX_HEIGHT 40%

        if [ -n "$SKIM_TMUX_OPTS" ]
            echo "sk --tmux=$SKIM_TMUX_OPTS "
        else if [ $SKIM_TMUX -eq 1 ]
            echo "sk --tmux=center,$SKIM_TMUX_HEIGHT"
        else
            echo "sk"
        end
    end

    bind \ct skim-file-widget
    bind \cr skim-history-widget
    bind \cg skim-cd-widget

    if bind -M insert > /dev/null 2>&1
        bind -M insert \ct skim-file-widget
        bind -M insert \cr skim-history-widget
        bind -M insert \cg skim-cd-widget
    end

    function __skim_parse_commandline -d 'Parse the current command line token and return split of existing filepath and rest of token'
        set -l commandline (eval "printf '%s' "(commandline -t))

        if [ -z $commandline ]
            set dir '.'
            set skim_query ''
        else
            set dir (__skim_get_dir $commandline)

            if [ "$dir" = "." -a (string sub -l 1 -- $commandline) != '.' ]
                set skim_query $commandline
            else
                set skim_query (string replace -r "^$dir/?" -- '' "$commandline")
            end
        end

        echo $dir
        echo $skim_query
    end

    function __skim_get_dir -d 'Find the longest existing filepath from input string'
        set dir $argv

        if [ (string length -- $dir) -gt 1 ]
            set dir (string replace -r '/*$' -- '' $dir)
        end

        while [ ! -d "$dir" ]
            set dir (dirname -- "$dir")
        end

        echo $dir
    end
end
