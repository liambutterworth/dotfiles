if status is-interactive; \
    and type -q fastfetch; \
    and test $LINES -ge 20; \
    and test $COLUMNS -ge 80
    fastfetch
end
