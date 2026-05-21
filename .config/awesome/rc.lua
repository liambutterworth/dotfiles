pcall(require, 'luarocks.loader')

local gears = require('gears')
local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local naughty = require('naughty')

require('awful.autofocus')

-- {{{ Error handling
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = 'Oops, there were errors during startup!',
        text = awesome.startup_errors,
    })
end

do
    local in_error = false

    awesome.connect_signal('debug::error', function(err)
        if in_error then return end

        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = 'Oops, an error happened!',
            text = tostring(err),
        })

        in_error = false
    end)
end
-- }}}

beautiful.init('~/.config/awesome/theme/theme.lua')

local modkey = 'Mod4'
local terminal = 'alacritty'

awful.layout.layouts = {
    -- awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

local launcher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    command = 'rofi -show drun',
})

local tags = { '1', '2', '3', '4', '5', '6', '7', '8', '9' }

local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(tag)
        tag:view_only()
    end),

    awful.button({ modkey }, 1, function(tag)
        if client.focus then
            client.focus:move_to_tag(tag)
        end
    end),

    awful.button({}, 3, awful.tag.viewtoggle),

    awful.button({ modkey }, 3, function(tag)
        if client.focus then
            client.focus:toggle_tag(tag)
        end
    end),

    awful.button({}, 4, function(tag)
        awful.tag.viewnext(tag.screen)
    end),

    awful.button({}, 5, function(tag)
        awful.tag.viewprev(tag.screen)
    end)
)

local function set_wallpaper(screen)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper

        if type(wallpaper) == 'function' then
            wallpaper = wallpaper(screen)
        end

        gears.wallpaper.maximized(wallpaper, screen, true)
    end
end

-- Re-set wallpaper when screen geometry changes
screen.connect_signal('property::geometry', set_wallpaper)

awful.screen.connect_for_each_screen(function(screen)
    screen.prompt = awful.widget.prompt()
    screen.layoutbox = awful.widget.layoutbox(screen)

    screen.taglist = awful.widget.taglist({
        screen  = screen,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,

        widget_template = {
            {
                {
                    id = 'text_role',
                    widget = wibox.widget.textbox,
                },

                left = 8,
                right = 8,
                widget = wibox.container.margin,
            },

            id = 'background_role',
            widget = wibox.container.background,
        },
    })

    screen.wibar = awful.wibar({
        position = 'top',
        screen = screen,
        height = 32,
    })

    set_wallpaper(screen)

    awful.tag(tags, screen, awful.layout.layouts[1])

    screen.layoutbox:buttons(
        gears.table.join(
            awful.button({}, 1, function() awful.layout.inc( 1) end),
            awful.button({}, 3, function() awful.layout.inc(-1) end),
            awful.button({}, 4, function() awful.layout.inc( 1) end),
            awful.button({}, 5, function() awful.layout.inc(-1) end)
        )
    )

    local spacing = 8
    local margin = 4
    local date = wibox.widget.textclock('%a %b %d')
    local time = wibox.widget.textclock('%H:%M')
    local calendar_icon = wibox.widget.imagebox()
    local clock_icon = wibox.widget.imagebox()
    local config_path = gears.filesystem.get_configuration_dir()

    clock_icon:set_image(config_path .. 'icons/clock.png')
    calendar_icon:set_image(config_path .. 'icons/calendar.png')

    screen.wibar:setup({
        {
            layout = wibox.layout.align.horizontal,

            {
                layout = wibox.layout.fixed.horizontal,
                spacing = spacing,
                launcher,
                screen.taglist,
                screen.prompt,
            },

            {
                widget = wibox.widget.textbox,
            },

            {
                layout = wibox.layout.fixed.horizontal,
                spacing = spacing,
                calendar_icon,
                date,
                clock_icon,
                time,
                screen.layoutbox,
            },
        },

        top = margin,
        bottom = margin,
        left = margin,
        right = margin,
        widget = wibox.container.margin,
    })
end)

local global_keys = gears.table.join(
    awful.key({ modkey }, 'p', awful.tag.viewprev, {
        description = 'view previous',
        group = 'tag',
    }),

    awful.key({ modkey }, 'n', awful.tag.viewnext, {
        description = 'view next',
        group = 'tag',
    }),

    awful.key({ modkey }, 'BackSpace', awful.tag.history.restore, {
        description = 'go back',
        group = 'tag',
    }),

    awful.key({ modkey }, 'j', function()
        awful.client.focus.byidx( 1)
    end, {
        description = 'focus next by index',
        group = 'client',
    }),

    awful.key({ modkey }, 'k', function()
            awful.client.focus.byidx(-1)
    end, {
        description = 'focus previous by index',
        group = 'client',
    }),

    -- Layout manipulation
    awful.key({ modkey, 'Shift' }, 'j', function()
        awful.client.swap.byidx(1)
    end, {
        description = 'swap with next client by index',
        group = 'client',
    }),

    awful.key({ modkey, 'Shift' }, 'k', function()
        awful.client.swap.byidx(-1)
    end, {
        description = 'swap with previous client by index',
        group = 'client',
    }),

    awful.key({ modkey, 'Control' }, 'j', function()
        awful.screen.focus_relative(1)
    end, {
        description = 'focus the next screen',
        group = 'screen',
    }),

    awful.key({ modkey, 'Control' }, 'k', function()
        awful.screen.focus_relative(-1)
    end, {
        description = 'focus the previous screen',
        group = 'screen',
    }),

    awful.key({ modkey }, 'u', awful.client.urgent.jumpto, {
        description = 'jump to urgent client',
        group = 'client',
    }),

    awful.key({ modkey }, 'Tab', function()
        awful.client.focus.history.previous()
        if client.focus then client.focus:raise() end
    end, {
        description = 'go back',
        group = 'client',
    }),

    awful.key({ modkey }, 'Return', function()
        awful.spawn(terminal)
    end, {
        description = 'open a terminal',
        group = 'launcher',
    }),

    awful.key({ modkey, 'Shift' }, 'r', awesome.restart, {
        description = 'reload awesome',
        group = 'awesome',
    }),

    awful.key({ modkey }, 'l', function()
        awful.tag.incmwfact(0.05)
    end, {
        description = 'increase master width factor',
        group = 'layout',
    }),

    awful.key({ modkey }, 'h', function()
        awful.tag.incmwfact(-0.05)
    end, {
        description = 'decrease master width factor',
        group = 'layout',
    }),

    awful.key({ modkey, 'Shift' }, 'h', function()
        awful.tag.incnmaster(1, nil, true)
    end, {
        description = 'increase the number of master clients',
        group = 'layout',
    }),

    awful.key({ modkey, 'Shift' }, 'l', function()
        awful.tag.incnmaster(-1, nil, true)
    end, {
        description = 'decrease the number of master clients',
        group = 'layout',
    }),

    awful.key({ modkey, 'Control' }, 'h', function()
        awful.tag.incncol(1, nil, true)
    end, {
        description = 'increase the number of columns',
        group = 'layout',
    }),

    awful.key({ modkey, 'Control' }, 'l', function()
        awful.tag.incncol(-1, nil, true)
    end, {
        description = 'decrease the number of columns',
        group = 'layout',
    }),

    awful.key({ modkey }, 'space', function()
        awful.layout.inc(1)
    end, {
        description = 'select next',
        group = 'layout',
    }),

    awful.key({ modkey, 'Shift' }, 'space', function()
        awful.layout.inc(-1)
    end, {
        description = 'select previous',
        group = 'layout',
    }),

    -- awful.key({ modkey, 'Control' }, 'n', function()
    --     local c = awful.client.restore()
    --     if c then
    --         c:emit_signal('request::activate', 'key.unminimize', { raise = true })
    --     end
    -- end, {
    --     description = 'restore minimized',
    --     group = 'client',
    -- }),

    awful.key({ modkey }, 'r', function()
        awful.spawn.with_shell('rofi -show drun')
    end, {
        description = 'run rofi',
        group = 'launcher',
    })
)

local client_keys = gears.table.join(
    awful.key({ modkey }, 'f', function(client)
        client.fullscreen = not client.fullscreen
        client:raise()
    end, {
        description = 'toggle fullscreen', group = 'client'
    }),

    awful.key({ modkey, 'Shift' }, 'q', function(client)
        client:kill()
    end, {
        description = 'close',
        group = 'client',
    }),

    awful.key({ modkey, 'Control' }, 'space', awful.client.floating.toggle, {
        description = 'toggle floating',
        group = 'client',
    }),

    -- awful.key({ modkey, 'Control' }, 'Return', function(client)
    --     client:swap(awful.client.getmaster())
    -- end, {
    --     description = 'move to master',
    --     group = 'client',
    -- }),

    -- awful.key({ modkey }, 'o', function(client)
    --     client:move_to_screen()
    -- end, {
    --     description = 'move to screen',
    --     group = 'client',
    -- }),

    awful.key({ modkey }, 't', function(client)
        client.ontop = not client.ontop
    end, {
        description = 'toggle keep on top',
        group = 'client',
    }),

    -- awful.key({ modkey }, 'n', function(client)
    --     -- The client currently has the input focus, so it cannot be
    --     -- minimized, since minimized clients can't have the focus.
    --     client.minimized = true
    -- end , {
    --     description = 'minimize',
    --     group = 'client',
    -- }),

    awful.key({ modkey }, 'm', function(client)
        client.maximized = not client.maximized
        client:raise()
    end, {
        description = '(un)maximize',
        group = 'client',
    }),

    awful.key({ modkey, 'Control' }, 'm', function(client)
        client.maximized_vertical = not client.maximized_vertical
        client:raise()
    end, {
        description = '(un)maximize vertically',
        group = 'client',
    }),

    awful.key({ modkey, 'Shift' }, 'm', function(client)
        client.maximized_horizontal = not client.maximized_horizontal
        client:raise()
    end, {
        description = '(un)maximize horizontally',
        group = 'client',
    })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for index = 1, 9 do
    global_keys = gears.table.join(global_keys,
        -- View tag only.
        awful.key({ modkey }, '#' .. index + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[index]

            if tag then
                tag:view_only()
            end
        end, {
            description = 'view tag #'..index, group = 'tag'
        }),

        -- Toggle tag display.
        awful.key({ modkey, 'Control' }, '#' .. index + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end, {
            description = 'toggle tag #' .. index,
            group = 'tag',
        }),

        -- Move client to tag.
        awful.key({ modkey, 'Shift' }, '#' .. index + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[index]

                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end, {
            description = 'move focused client to tag #'..index,
            group = 'tag',
        }),

      -- Toggle tag on focused client.
        awful.key({ modkey, 'Control', 'Shift' }, '#' .. index + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[index]

                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end, {
            description = 'toggle focused client on tag #' .. index,
            group = 'tag',
        })
    )
end

local client_buttons = gears.table.join(
    awful.button({}, 1, function(client)
        client:emit_signal('request::activate', 'mouse_click', { raise = true })
    end),

    awful.button({ modkey }, 1, function(client)
        client:emit_signal('request::activate', 'mouse_click', { raise = true })
        awful.mouse.client.move(client)
    end),

    awful.button({ modkey }, 3, function(client)
        client:emit_signal('request::activate', 'mouse_click', { raise = true })
        awful.mouse.client.resize(client)
    end)
)

root.keys(global_keys)

awful.rules.rules = {
    {
        rule = {},

        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = client_keys,
            buttons = client_buttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen,
        }
    },


    {
        rule = {
            instance = 'Toolkit',
            name = 'Picture-in-Picture',
        },

        properties = {
            floating = true,
            ontop = true,
            skip_taskbar = true,
            placement = awful.placement.no_offscreen,
        }
    },
}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal('manage', function(client)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    client.shape = function(context, width, height)
        gears.shape.rounded_rect(context, width, height, 4)
    end

    if awesome.startup
      and not client.size_hints.user_position
      and not client.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(client)
    end
end)

client.connect_signal('focus', function(client)
    client.border_color = beautiful.border_focus
end)

client.connect_signal('unfocus', function(client)
    client.border_color = beautiful.border_normal
end)
-- }}}

awful.spawn.with_shell('gsettings set org.gnome.desktop.interface color-scheme prefer-dark')
awful.spawn.with_shell('picom')
