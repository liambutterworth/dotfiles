hl.config({
    animations = {
        enabled = true,
    },

    decoration = {
        rounding = 2,
        rounding_power = 2,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    general = {
        layout = 'master',
        gaps_in  = 8,
        gaps_out = 8,
        border_size = 1,

        col = {
            active_border = '#c8c093',
            inactive_border = 'rgba(00000000)',
        },
    },

    input = {
        follow_mouse = 2,
    },

    master = {
        new_status = 'slave',
    },
})
