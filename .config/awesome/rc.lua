pcall(require, 'luarocks.loader')

local gears = require('gears')
local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local naughty = require('naughty')
local menubar = require('menubar')
local hotkeys_popup = require('awful.hotkeys_popup')

require('awful.autofocus')
require('awful.hotkeys_popup.keys')

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

    awesome.connect_signal('debug::error', function (err)
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
local editor = os.getenv('EDITOR') or 'nvim'

awful.layout.layouts = {
    -- awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

local menu = awful.menu({
   { 'terminal', terminal },
   { 'hotkeys', function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { 'manual', terminal .. ' -e man awesome' },
   { 'config', terminal .. ' -e ' .. editor .. ' ' .. awesome.conffile },
   { 'restart', awesome.restart },
   { 'quit', function() awesome.quit() end },
})

local launcher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = menu
})

menubar.utils.terminal = terminal

local clock = wibox.widget.textclock()
local tags = { '1', '2', '3', '4', '5', '6', '7', '8', '9' }

local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t) t:view_only() end),

    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),

    awful.button({}, 3, awful.tag.viewtoggle),

    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),

    awful.button({}, 4, function(tag) awful.tag.viewnext(tag.screen) end),
    awful.button({}, 5, function(tag) awful.tag.viewprev(tag.screen) end)
)

local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal('request::activate', 'tasklist', { raise = true })
        end
    end),

    awful.button({}, 3, function()
        awful.menu.client_list({ theme = { width = 250 } })
    end),

    awful.button({}, 4, function () awful.client.focus.byidx(1) end),
    awful.button({}, 5, function () awful.client.focus.byidx(-1) end)
)

local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper

        if type(wallpaper) == 'function' then
            wallpaper = wallpaper(s)
        end

        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when screen geometry changes
screen.connect_signal('property::geometry', set_wallpaper)

awful.screen.connect_for_each_screen(function(screen)
    screen.prompt = awful.widget.prompt()
    screen.layoutbox = awful.widget.layoutbox(screen)

    screen.taglist = awful.widget.taglist {
        screen  = screen,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    screen.tasklist = awful.widget.tasklist {
        screen  = screen,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    screen.mywibox = awful.wibar({ position = 'top', screen = screen })

    set_wallpaper(screen)

    awful.tag(tags, screen, awful.layout.layouts[1])

    screen.layoutbox:buttons(
        gears.table.join(
            awful.button({}, 1, function () awful.layout.inc( 1) end),
            awful.button({}, 3, function () awful.layout.inc(-1) end),
            awful.button({}, 4, function () awful.layout.inc( 1) end),
            awful.button({}, 5, function () awful.layout.inc(-1) end)
        )
    )

    screen.mywibox:setup({
        layout = wibox.layout.align.horizontal,

        {
            layout = wibox.layout.fixed.horizontal,
            launcher,
            screen.taglist,
            screen.prompt,
        },

        screen.tasklist,

        {
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            clock,
            screen.layoutbox,
        },
    })
end)

-- {{{ Mouse bindings
root.buttons(
    gears.table.join(
        awful.button({}, 3, function () menu:toggle() end),
        awful.button({}, 4, awful.tag.viewnext),
        awful.button({}, 5, awful.tag.viewprev)
    )
)
-- }}}

-- {{{ Key bindings
local global_keys = gears.table.join(
    awful.key({ modkey }, 's', hotkeys_popup.show_help, {
        description = 'show help',
        group = 'awesome',
    }),

    awful.key({ modkey }, 'Left', awful.tag.viewprev, {
        description = 'view previous',
        group = 'tag',
    }),

    awful.key({ modkey }, 'Right', awful.tag.viewnext, {
        description = 'view next',
        group = 'tag',
    }),

    awful.key({ modkey }, 'Escape', awful.tag.history.restore, {
        description = 'go back',
        group = 'tag',
    }),

    awful.key({ modkey }, 'j', function ()
        awful.client.focus.byidx( 1)
    end, {
        description = 'focus next by index',
        group = 'client',
    }),

    awful.key({ modkey }, 'k', function ()
            awful.client.focus.byidx(-1)
    end, {
        description = 'focus previous by index',
        group = 'client',
    }),

    awful.key({ modkey }, 'w', function ()
        menu:show()
    end, {
        description = 'show main menu',
        group = 'awesome',
    }),

    -- Layout manipulation
    awful.key({ modkey, 'Shift' }, 'j', function ()
        awful.client.swap.byidx(1)
    end, {
        description = 'swap with next client by index',
        group = 'client',
    }),

    awful.key({ modkey, 'Shift' }, 'k', function ()
        awful.client.swap.byidx(-1)
    end, {
        description = 'swap with previous client by index',
        group = 'client',
    }),

    awful.key({ modkey, 'Control' }, 'j', function ()
        awful.screen.focus_relative(1)
    end, {
        description = 'focus the next screen',
        group = 'screen',
    }),

    awful.key({ modkey, 'Control' }, 'k', function ()
        awful.screen.focus_relative(-1)
    end, {
        description = 'focus the previous screen',
        group = 'screen',
    }),

    awful.key({ modkey }, 'u', awful.client.urgent.jumpto, {
        description = 'jump to urgent client',
        group = 'client',
    }),

    awful.key({ modkey }, 'Tab', function ()
        awful.client.focus.history.previous()
        if client.focus then client.focus:raise() end
    end, {
        description = 'go back',
        group = 'client',
    }),

    -- Standard program
    awful.key({ modkey }, 'Return', function ()
        awful.spawn(terminal)
    end, {
        description = 'open a terminal',
        group = 'launcher',
    }),

    awful.key({ modkey, 'Control' }, 'r', awesome.restart, {
        description = 'reload awesome',
        group = 'awesome',
    }),

    awful.key({ modkey, 'Shift' }, 'q', awesome.quit, {
        description = 'quit awesome',
        group = 'awesome',
    }),

    awful.key({ modkey }, 'l', function ()
        awful.tag.incmwfact(0.05)
    end, {
        description = 'increase master width factor',
        group = 'layout',
    }),

    awful.key({ modkey }, 'h', function ()
        awful.tag.incmwfact(-0.05)
    end, {
        description = 'decrease master width factor',
        group = 'layout',
    }),

    awful.key({ modkey, 'Shift' }, 'h', function ()
        awful.tag.incnmaster(1, nil, true)
    end, {
        description = 'increase the number of master clients',
        group = 'layout',
    }),

    awful.key({ modkey, 'Shift' }, 'l', function ()
        awful.tag.incnmaster(-1, nil, true)
    end, {
        description = 'decrease the number of master clients',
        group = 'layout',
    }),

    awful.key({ modkey, 'Control' }, 'h', function ()
        awful.tag.incncol(1, nil, true)
    end, {
        description = 'increase the number of columns',
        group = 'layout',
    }),

    awful.key({ modkey, 'Control' }, 'l', function ()
        awful.tag.incncol(-1, nil, true)
    end, {
        description = 'decrease the number of columns',
        group = 'layout',
    }),

    awful.key({ modkey }, 'space', function ()
        awful.layout.inc(1)
    end, {
        description = 'select next',
        group = 'layout',
    }),

    awful.key({ modkey, 'Shift' }, 'space', function ()
        awful.layout.inc(-1)
    end, {
        description = 'select previous',
        group = 'layout',
    }),

    awful.key({ modkey, 'Control' }, 'n', function ()
          local c = awful.client.restore()

          if c then
              c:emit_signal('request::activate', 'key.unminimize', { raise = true })
          end
      end, {
          description = 'restore minimized',
          group = 'client',
      }),

    -- Prompt
    awful.key({ modkey }, 'r', function ()
        awful.screen.focused().prompt:run()
    end, {
        description = 'run prompt',
        group = 'launcher',
    }),

    awful.key({ modkey }, 'x', function ()
        awful.prompt.run {
            prompt = 'Run Lua code: ',
            textbox = awful.screen.focused().prompt.widget,
            exe_callback = awful.util.eval,
            history_path = awful.util.get_cache_dir() .. '/history_eval'
        }
      end, {
          description = 'lua execute prompt',
          group = 'awesome',
      }),

    awful.key({ modkey }, 'p', function()
        menubar.show()
    end, {
        description = 'show the menubar',
        group = 'launcher',
    })
)

local client_keys = gears.table.join(
    awful.key({ modkey }, 'f', function (client)
        client.fullscreen = not client.fullscreen
        client:raise()
    end, {
        description = 'toggle fullscreen', group = 'client'
    }),

    awful.key({ modkey, 'Shift' }, 'c', function (client)
        client:kill()
    end, {
        description = 'close',
        group = 'client',
    }),

    awful.key({ modkey, 'Control' }, 'space', awful.client.floating.toggle, {
        description = 'toggle floating',
        group = 'client',
    }),

    awful.key({ modkey, 'Control' }, 'Return', function (client)
        client:swap(awful.client.getmaster())
    end, {
        description = 'move to master',
        group = 'client',
    }),

    awful.key({ modkey }, 'o', function (client)
        client:move_to_screen()
    end, {
        description = 'move to screen',
        group = 'client',
    }),

    awful.key({ modkey }, 't', function (client)
        client.ontop = not client.ontop
    end, {
        description = 'toggle keep on top',
        group = 'client',
    }),

    -- awful.key({ modkey }, 'n', function (client)
    --     -- The client currently has the input focus, so it cannot be
    --     -- minimized, since minimized clients can't have the focus.
    --     client.minimized = true
    -- end , {
    --     description = 'minimize',
    --     group = 'client',
    -- }),

    awful.key({ modkey }, 'm', function (client)
        client.maximized = not client.maximized
        client:raise()
    end, {
        description = '(un)maximize',
        group = 'client',
    }),

    awful.key({ modkey, 'Control' }, 'm', function (client)
        client.maximized_vertical = not client.maximized_vertical
        client:raise()
    end, {
        description = '(un)maximize vertically',
        group = 'client',
    }),

    awful.key({ modkey, 'Shift' }, 'm', function (client)
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
        awful.key({ modkey }, '#' .. index + 9, function ()
            local screen = awful.screen.focused()
            local tag = screen.tags[index]

            if tag then
                tag:view_only()
            end
        end, {
            description = 'view tag #'..index, group = 'tag'
        }),

        -- Toggle tag display.
        awful.key({ modkey, 'Control' }, '#' .. index + 9, function ()
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
        awful.key({ modkey, 'Shift' }, '#' .. index + 9, function ()
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
        awful.key({ modkey, 'Control', 'Shift' }, '#' .. index + 9, function ()
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
    awful.button({}, 1, function (client)
        client:emit_signal('request::activate', 'mouse_click', { raise = true })
    end),

    awful.button({ modkey }, 1, function (client)
        client:emit_signal('request::activate', 'mouse_click', { raise = true })
        awful.mouse.client.move(client)
    end),

    awful.button({ modkey }, 3, function (client)
        client:emit_signal('request::activate', 'mouse_click', { raise = true })
        awful.mouse.client.resize(client)
    end)
)

-- Set keys
root.keys(global_keys)
-- }}}

-- {{{ Rules
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

    { -- Floating clients.
        rule_any = {
            instance = {
                'DTA', -- Firefox addon DownThemAll.
                'copyq', -- Includes session name in class.
                'pinentry',
            },

            class = {
                'Arandr',
                'Blueman-manager',
                'Gpick',
                'Kruler',
                'MessageWin', -- kalarm.
                'Sxiv',
                'Tor Browser', -- Needs a fixed window size to avoid fingerprinting by screen size.
                'Wpa_gui',
                'veromix',
                'xtightvncviewer'},

                -- Note that the name property shown in xprop might be set slightly after creation of the client
                -- and the name shown there might not match defined rules here.
                name = {
                    'Event Tester', -- xev.
                },

                role = {
                    'AlarmWindow', -- Thunderbird's calendar.
                    'ConfigManager', -- Thunderbird's about:config.
                    'pop-up', -- e.g. Google Chrome's (detached) Developer Tools.
                }
            },

            properties = {
                floating = true,
            },
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
            titlebars_enabled = false,
            placement = awful.placement.no_offscreen,
        }
    },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal('manage', function (client)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not client.size_hints.user_position
      and not client.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(client)
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
-- client.connect_signal('mouse::enter', function(client)
--     client:emit_signal('request::activate', 'mouse_enter', { raise = false })
-- end)

client.connect_signal('focus', function(client)
    client.border_color = beautiful.border_focus
end)

client.connect_signal('unfocus', function(client)
    client.border_color = beautiful.border_normal
end)
-- }}}

-- Ensure dark mode is set for all apps
awful.spawn.with_shell('gsettings set org.gnome.desktop.interface color-scheme prefer-dark')
