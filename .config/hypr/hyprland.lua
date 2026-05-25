------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = '',
    mode     = 'preferred',
    position = 'auto',
    scale    = 'auto',
})

-------------------
---- AUTOSTART ----
-------------------

hl.on('hyprland.start', function()
    hl.exec_cmd('hyprpaper')
    hl.exec_cmd('waybar')
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env('XCURSOR_SIZE', '24')
hl.env('HYPRCURSOR_SIZE', '24')

-----------------------
---- LOOK AND FEEL ----
-----------------------

local colors = {
    transparent = 'rgba(00000000)',
    black = '#0d0c0c',
    red = '#c4746e',
    green = '#8a9a7b',
    yellow = '#c4b23a',
    blue = '#8ba4b0',
    magenta = '#a292a3',
    cyan = '#7aa89f',
    white = '#c8c093',
    bright_black = '#727169',
    bright_red = '#e46876',
    bright_green = '#87a987',
    bright_yellow = '#e6c384',
    bright_bluw = '#7fb4ca',
    bright_magenta = '#938aa9',
    bright_cyan = '#a3d4d5',
    bright_white = '#c5c9c5',
}

hl.config({
    general = {
        layout = 'master',
        gaps_in  = 8,
        gaps_out = 8,
        border_size = 1,

        col = {
            active_border = colors.white,
            inactive_border = colors.transparent,
        },
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

    animations = {
        enabled = true,
    },
})

hl.curve('easeOutQuint', { type = 'bezier', points = { {0.23, 1}, {0.32, 1} } })
hl.curve('easeInOutCubic',{ type = 'bezier', points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve('linear', { type = 'bezier', points = { {0, 0}, {1, 1} } } )
hl.curve('almostLinear', { type = 'bezier', points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve('quick', { type = 'bezier', points = { {0.15, 0}, {0.1, 1} } })
hl.curve('easy', { type = 'spring', mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = 'global', enabled = true, speed = 10, bezier = 'default' })
hl.animation({ leaf = 'border', enabled = true, speed = 5.39, bezier = 'easeOutQuint' })
hl.animation({ leaf = 'windows', enabled = true, speed = 4.79, spring = 'easy' })
hl.animation({ leaf = 'windowsIn', enabled = true, speed = 4.1, spring = 'easy', style = 'popin 87%' })
hl.animation({ leaf = 'windowsOut',enabled = true, speed = 1.49, bezier = 'linear', style = 'popin 87%' })
hl.animation({ leaf = 'fadeIn', enabled = true, speed = 1.73, bezier = 'almostLinear' })
hl.animation({ leaf = 'fadeOut', enabled = true, speed = 1.46, bezier = 'almostLinear' })
hl.animation({ leaf = 'fade', enabled = true, speed = 3.03, bezier = 'quick' })
hl.animation({ leaf = 'layers', enabled = true, speed = 3.81, bezier = 'easeOutQuint' })
hl.animation({ leaf = 'layersIn', enabled = true, speed = 4, bezier = 'easeOutQuint', style = 'fade' })
hl.animation({ leaf = 'layersOut', enabled = true, speed = 1.5, bezier = 'linear', style = 'fade' })
hl.animation({ leaf = 'fadeLayersIn', enabled = true, speed = 1.79, bezier = 'almostLinear' })
hl.animation({ leaf = 'fadeLayersOut', enabled = true, speed = 1.39, bezier = 'almostLinear' })
hl.animation({ leaf = 'workspaces', enabled = true, speed = 1.94, bezier = 'almostLinear', style = 'fade' })
hl.animation({ leaf = 'workspacesIn', enabled = true, speed = 1.21, bezier = 'almostLinear', style = 'fade' })
hl.animation({ leaf = 'workspacesOut', enabled = true, speed = 1.94, bezier = 'almostLinear', style = 'fade' })
hl.animation({ leaf = 'zoomFactor', enabled = true, speed = 7, bezier = 'quick' })

hl.config({
    startup = {
        'waybar',
    }
})

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = 'slave',
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = 'us',
        kb_variant = '',
        kb_model = '',
        kb_options = '',
        kb_rules = '',
        follow_mouse = 2,
        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})

---------------------
---- KEYBINDINGS ----
---------------------

hl.bind('SUPER + TAB', hl.dsp.focus({ last = true }))
hl.bind('SUPER + SPACE', hl.dsp.exec_cmd('rofi -show drun filter "^" -no-fixed-num-lines'))
hl.bind('SUPER + RETURN', hl.dsp.exec_cmd('ghostty'))
hl.bind('SUPER + Q', hl.dsp.window.close())
hl.bind('SUPER + SHIFT + Q', hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind('SUPER + W', function() hl.exec_cmd('killall -q hyprpaper && hyprpaper') end)
hl.bind('SUPER + R' , function() hl.exec_cmd('killall waybar && waybar') end)
hl.bind('SUPER + SHIFT + R', function() hl.exec_cmd('killall -q waybar && env GTK_DEBUG=interactive waybar') end)
hl.bind('SUPER + V', hl.dsp.window.float({ action = 'toggle' }))
hl.bind('SUPER + S', hl.dsp.exec_cmd('hyprshot -m region --clipboard-only'))
hl.bind('SUPER + F', hl.dsp.window.fullscreen({ action = 'toggle' }))
hl.bind('SUPER + M', hl.dsp.layout('focusmaster master'))
hl.bind('SUPER + SHIFT + M', hl.dsp.layout('swapwithmaster ignoremaster'))
hl.bind('SUPER + H', hl.dsp.focus({ direction = 'left' }))
hl.bind('SUPER + J', hl.dsp.focus({ direction = 'down' }))
hl.bind('SUPER + K', hl.dsp.focus({ direction = 'up' }))
hl.bind('SUPER + L', hl.dsp.focus({ direction = 'right' }))
hl.bind('SUPER + SHIFT + H', hl.dsp.window.move({ direction = 'left'}))
hl.bind('SUPER + SHIFT + J', hl.dsp.window.move({ direction = 'down'}))
hl.bind('SUPER + SHIFT + K', hl.dsp.window.move({ direction = 'up'}))
hl.bind('SUPER + SHIFT + L', hl.dsp.window.move({ direction = 'right'}))
hl.bind('SUPER + BRACKETLEFT', hl.dsp.layout('mfact -0.05'))
hl.bind('SUPER + BRACKETRIGHT', hl.dsp.layout('mfact +0.05'))
hl.bind('SUPER + BACKSLASH', hl.dsp.layout('mfact exact 0.5'))
hl.bind('SUPER + mouse:272', hl.dsp.window.drag(), { mouse = true })
hl.bind('SUPER + mouse:272', hl.dsp.window.resize(), { mouse = true })

for i = 1, 10 do
    local key = i % 10
    hl.bind('SUPER + ' .. key, hl.dsp.focus({ workspace = i}))
    hl.bind('SUPER + SHIFT + ' .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd('wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+'), { locked = true, repeating = true })
hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'), { locked = true, repeating = true })
hl.bind('XF86AudioMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'), { locked = true, repeating = true })
hl.bind('XF86AudioMicMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'), { locked = true, repeating = true })
hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd('brightnessctl -e4 -n2 set 5%+'), { locked = true, repeating = true })
hl.bind('XF86MonBrightnessDown',hl.dsp.exec_cmd('brightnessctl -e4 -n2 set 5%-'), { locked = true, repeating = true })
hl.bind('XF86AudioNext', hl.dsp.exec_cmd('playerctl next'), { locked = true })
hl.bind('XF86AudioPause', hl.dsp.exec_cmd('playerctl play-pause'), { locked = true })
hl.bind('XF86AudioPlay', hl.dsp.exec_cmd('playerctl play-pause'), { locked = true })
hl.bind('XF86AudioPrev', hl.dsp.exec_cmd('playerctl previous'), { locked = true })

---------------------
---- RULES ----
---------------------

hl.layer_rule({
    match = { namespace = 'waybar' },
    name = 'waybar-blur',
    blur = true,
    ignore_alpha = 0.1,
})

hl.window_rule({
    match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
    float = true,
    pin = true,
    -- stayfocused = false,
    no_blur = true,
    no_shadow = true,
    -- keepaspectratio = true,
})
