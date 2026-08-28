hl.layer_rule({
    blur = true,
    ignore_alpha = 0.1,
    name = 'waybar-blur',

    match = {
        namespace = 'waybar',
    },
})

hl.layer_rule({
    animation = 'popin 90%',

    match = {
        namespace = 'rofi',
    },
})

hl.window_rule({
    match = {
        title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$",
    },

    keep_aspect_ratio = true,
    float = true,
    no_blur = true,
    no_shadow = true,
    pin = true,
})

hl.window_rule({ -- hide battle.net empty system tray
    match = {
        xwayland = true,
        title = '^$',
        initial_title = '^$',
    },

    opacity = '0.0 override 0.0 override',
    float = true,
    no_blur = true,
})
