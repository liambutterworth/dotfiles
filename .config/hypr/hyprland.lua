-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")


------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = '',
    mode     = 'preferred',
    position = 'auto',
    scale    = 'auto',
})

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
-- local terminal = 'kitty'
-- local fileManager = 'dolphin'
-- local menu = 'hyprlauncher'


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on('hyprland.start', function()
    hl.exec_once('waybar')
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env('XCURSOR_SIZE', '24')
hl.env('HYPRCURSOR_SIZE', '24')


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

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

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        layout = 'master',
        gaps_in  = 7,
        gaps_out = 7,
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

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve('easeOutQuint', { type = 'bezier', points = { {0.23, 1}, {0.32, 1} } })
hl.curve('easeInOutCubic',{ type = 'bezier', points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve('linear', { type = 'bezier', points = { {0, 0}, {1, 1} } } )
hl.curve('almostLinear', { type = 'bezier', points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve('quick', { type = 'bezier', points = { {0.15, 0}, {0.1, 1} } })

-- Default springs
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

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = 'slave',
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
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
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
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

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

hl.bind('SUPER + SPACE', hl.dsp.exec_cmd('rofi -show drun filter "^" -no-fixed-num-lines'))
hl.bind('SUPER + RETURN', hl.dsp.exec_cmd('kitty'))
hl.bind('SUPER + SHIFT + Q', hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind('SUPER + Q', hl.dsp.window.kill())
hl.bind('SUPER + R' , function() hl.exec_cmd('killall waybar && waybar') end)
hl.bind('SUPER + V', hl.dsp.window.float({ action = 'toggle' }))
hl.bind('SUPER + P', hl.dsp.window.pseudo())
hl.bind('SUPER + O', hl.dsp.layout('togglesplit'))    -- dwindle only
hl.bind('SUPER + S', hl.dsp.exec_cmd('hyprshot -m region --clipboard-only'))
hl.bind('SUPER + M', hl.dsp.window.fullscreen({ action = 'toggle' }))
hl.bind('SUPER + H', hl.dsp.focus({ direction = 'left' }))
hl.bind('SUPER + J', hl.dsp.focus({ direction = 'down' }))
hl.bind('SUPER + K', hl.dsp.focus({ direction = 'up' }))
hl.bind('SUPER + L', hl.dsp.focus({ direction = 'right' }))
hl.bind('SUPER + SHIFT + H', hl.dsp.window.move({ direction = 'left'}))
hl.bind('SUPER + SHIFT + J', hl.dsp.window.move({ direction = 'down'}))
hl.bind('SUPER + SHIFT + K', hl.dsp.window.move({ direction = 'up'}))
hl.bind('SUPER + SHIFT + L', hl.dsp.window.move({ direction = 'right'}))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind('SUPER + ' .. key, hl.dsp.focus({ workspace = i}))
    hl.bind('SUPER + SHIFT + ' .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
-- hl.bind('SUPER + S', hl.dsp.workspace.toggle_special("magic"))
-- hl.bind('SUPER + SHIFT + S', hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
-- hl.bind('SUPER + mouse:272', hl.dsp.window.drag(),   { mouse = true })
-- hl.bind('SUPER + mouse:273', hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd('wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+'), { locked = true, repeating = true })
hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'), { locked = true, repeating = true })
hl.bind('XF86AudioMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'), { locked = true, repeating = true })
hl.bind('XF86AudioMicMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'), { locked = true, repeating = true })
hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd('brightnessctl -e4 -n2 set 5%+'), { locked = true, repeating = true })
hl.bind('XF86MonBrightnessDown',hl.dsp.exec_cmd('brightnessctl -e4 -n2 set 5%-'), { locked = true, repeating = true })

-- Requires playerctl
hl.bind('XF86AudioNext', hl.dsp.exec_cmd('playerctl next'), { locked = true })
hl.bind('XF86AudioPause', hl.dsp.exec_cmd('playerctl play-pause'), { locked = true })
hl.bind('XF86AudioPlay', hl.dsp.exec_cmd('playerctl play-pause'), { locked = true })
hl.bind('XF86AudioPrev', hl.dsp.exec_cmd('playerctl previous'), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

-- local suppressMaximizeRule = hl.window_rule({
--     -- Ignore maximize requests from all apps. You'll probably like this.
--     name  = "suppress-maximize-events",
--     match = { class = ".*" },

--     suppress_event = "maximize",
-- })
-- suppressMaximizeRule:set_enabled(false)


hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.config({
    exec_once = {
        'waybar',
    }
})
