local awful = require('awful')
local gears = require('gears')
local theme = require('theme')

local client_keys = gears.table.join(
    awful.key({ 'Mod4' }, 'q', function(client)
        client:kill()
    end),

    awful.key({ 'Mod4' }, 't', function(client)
        client.ontop = not client.ontop
    end),

    awful.key({ 'Mod4' }, 'm', function()
        client.focus = awful.client.getmaster()
    end),

    awful.key({ 'Mod4', 'Shift' }, 'm', function()
        if not client.focus then return end
        client.focus:swap(awful.client.getmaster())
    end),

    awful.key({ 'Mod4' }, 'v', function(client)
        client.maximized_vertical = not client.maximized_vertical
        client:raise()
    end),

    awful.key({ 'Mod4' }, 's', function(client)
        client.maximized_horizontal = not client.maximized_horizontal
        client:raise()
    end),

    awful.key({ 'Mod4' }, 'f', function(client)
        client.maximized = not client.maximized
        client:raise()
    end),

    awful.key({ 'Mod4', 'Shift' }, 'f', function(client)
        client.fullscreen = not client.fullscreen
        client:raise()
    end)
)

local client_buttons = gears.table.join(
    awful.button({}, 1, function(client)
        client:emit_signal('request::activate', 'mouse_click', { raise = true })
    end),

    awful.button({ 'Mod4' }, 1, function(client)
        client:emit_signal('request::activate', 'mouse_click', { raise = true })
        awful.mouse.client.move(client)
    end),

    awful.button({ 'Mod4' }, 3, function(client)
        client:emit_signal('request::activate', 'mouse_click', { raise = true })
        awful.mouse.client.resize(client)
    end)
)

awful.rules.rules = {
    {
        rule = {},

        properties = {
            border_width = theme.border_width,
            border_color = theme.border_normal,
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

client.connect_signal('manage', function(client)
    client.shape = function(context, width, height)
        gears.shape.rounded_rect(context, width, height, 4)
    end

    if awesome.startup
      and not client.size_hints.user_position
      and not client.size_hints.program_position then
        awful.placement.no_offscreen(client)
    else
        awful.client.setslave(client)
    end
end)

client.connect_signal('focus', function(client)
    client.border_color = theme.border_focus
end)

client.connect_signal('unfocus', function(client)
    client.border_color = theme.border_normal
end)

