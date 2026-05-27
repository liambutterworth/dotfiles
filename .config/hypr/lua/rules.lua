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
    float = true,
    no_blur = true,
    no_shadow = true,
    pin = true,

    match = {
        title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$",
    },
})
