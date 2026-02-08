function pad_prompt -e fish_preexec -e fish_postexec
    echo
end

function fish_prompt
    set -l directory (dirs)
    set -l branch (git branch --show-current 2>/dev/null)

    set -l character (
        switch $fish_bind_mode
            case default
                echo '❮'

            case insert
                echo '❯'
        end
    )

    # echo (set_color -o blue)"$directory"
    # echo (set_color -o brblack)"$branch"
    # echo -n (set_color -o magenta)"$character"

    printf '%s %s\n%s ' \
        (set_color -o blue)"$directory" \
        (set_color -o brblack)"$branch" \
        (set_color -o magenta)"$character"

    set_color normal
end
