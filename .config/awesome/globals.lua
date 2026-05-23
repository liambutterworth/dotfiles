local gears = require('gears')
local awful = require('awful')

local global_keys = gears.table.join(
    awful.key({ 'Mod4' }, 'Tab', function()
        awful.client.focus.history.previous()
        if client.focus then client.focus:raise() end
    end),

    awful.key({ 'Mod4' }, 'Return', function()
        awful.spawn('alacritty')
    end),

    awful.key({ 'Mod4' }, 'space', function()
        awful.spawn.with_shell('rofi -show drun')
    end),

    awful.key({ 'Mod4' }, 'BackSpace', awful.tag.history.restore),
    awful.key({ 'Mod4' }, 'r', awesome.restart),
    awful.key({ 'Mod4' }, 'u', awful.client.urgent.jumpto),
    awful.key({ 'Mod4' }, 'n', function() awful.layout.inc(1) end),
    awful.key({ 'Mod4' }, 'p', function() awful.layout.inc(-1) end),
    awful.key({ 'Mod4' }, 'h', function() awful.tag.incmwfact(-0.05) end),
    awful.key({ 'Mod4' }, 'l', function() awful.tag.incmwfact(0.05) end),
    awful.key({ 'Mod4' }, 'j', function() awful.client.focus.byidx( 1) end),
    awful.key({ 'Mod4' }, 'k', function() awful.client.focus.byidx(-1) end),
    awful.key({ 'Mod4', 'Shift' }, 'j', function() awful.client.swap.byidx(1) end),
    awful.key({ 'Mod4', 'Shift' }, 'k', function() awful.client.swap.byidx(-1) end),

    awful.key({}, 'XF86AudioPlay', function()
        awful.util.spawn('playerctl --player playerctld play-pause')
    end),

    awful.key({}, 'XF86AudioNext', function()
        awful.util.spawn('playerctl next')
    end),

    awful.key({}, 'XF86AudioPrev', function()
        awful.util.spawn('playerctl previous')
    end),

    awful.key({}, 'XF86AudioRaiseVolume', function()
        awful.util.spawn('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+')
    end),

    awful.key({}, 'XF86AudioLowerVolume', function()
        awful.util.spawn('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-')
    end),

    awful.key({}, 'XF86AudioMute', function()
        awful.util.spawn('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle')
    end)
)

for index = 1, 9 do
    global_keys = gears.table.join(global_keys,
        awful.key({ 'Mod4' }, '#' .. index + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then tag:view_only() end
        end),

        awful.key({ 'Mod4', 'Control' }, '#' .. index + 9, function ()
            local screen = awful.screen.focused()
            local tag = screen.tags[index]

            if tag then
                awful.tag.viewtoggle(tag)
            end
        end),

        awful.key({ 'Mod4', 'Shift' }, '#' .. index + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[index]

                if tag then
                    client.focus:move_to_tag(tag)
                    tag:view_only()
                end
            end
        end)
    )
end

root.keys(global_keys)
