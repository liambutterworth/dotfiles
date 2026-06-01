hl.config({
    animations = {
        enabled = true,
    },

    decoration = {
        rounding = 5,
        rounding_power = 1,

        shadow = {
            color = 0xee1a1a1a,
            enabled = true,
            range = 4,
            render_power = 3,
        },

        blur = {
            enabled = true,
            passes = 1,
            size = 3,
            vibrancy = 0.1696,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    general = {
        border_size = 2,
        gaps_in  = 4,
        gaps_out = 8,
        layout = 'dwindle',

        col = {
            active_border = '#c8c093',
            inactive_border = 'rgba(00000000)',
        },
    },

    group = {
        groupbar = {
            blur = true,
            font_size = 16,
            gaps_in = 4,
            gradients = true,
            gradient_rounding = 2,
            height = 24,
            indicator_gap = 4,
            indicator_height = 0,
            keep_upper_gap = false,
            render_titles = false,

            col = {
                active = 'rgba(c5c9c5cc)',
                inactive = 'rgba(c5c9c588)',
                locked_active = 'rgba(0d0c0ccc)',
                locked_inactive = 'rgba(0d0c0c88)',
            },
        },
    },

    input = {
        follow_mouse = 2,
    },

    master = {
        new_status = 'slave',
    },
})
