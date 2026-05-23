local awful = require('awful')
local gears = require('gears')
local theme = require('theme')
local layouts = require('layouts')
local wibox = require('wibox')

local config_path = gears.filesystem.get_configuration_dir()

local launcher = awful.widget.launcher({
    image = config_path .. 'icons/arch-linux.png',
    command = 'rofi -show drun',
})

local function set_wallpaper(screen)
    gears.wallpaper.maximized(config_path .. 'wallpapers/mountains.jpg', screen, true)
end

screen.connect_signal('property::geometry', set_wallpaper)

awful.screen.connect_for_each_screen(function(screen)
    screen.prompt = awful.widget.prompt()
    screen.layoutbox = awful.widget.layoutbox(screen)

    screen.taglist = awful.widget.taglist({
        screen  = screen,
        filter  = awful.widget.taglist.filter.all,

        buttons = gears.table.join(
            awful.button({}, 1, function(tag) tag:view_only() end),
            awful.button({}, 3, awful.tag.viewtoggle)
        ),

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
        height = 36,
        bg = theme.bg_normal .. 'e8',
    })

    set_wallpaper(screen)

    awful.tag({ '1', '2', '3', '4', '5', '6', '7', '8', '9' }, screen, layouts[1])

    screen.layoutbox:buttons(
        gears.table.join(
            awful.button({}, 1, function() awful.layout.inc( 1) end),
            awful.button({}, 3, function() awful.layout.inc(-1) end),
            awful.button({}, 4, function() awful.layout.inc( 1) end),
            awful.button({}, 5, function() awful.layout.inc(-1) end)
        )
    )

    local date_container = wibox.widget.background()
    date_container:set_widget(wibox.widget.textclock('%a %b %d'))
    date_container:set_fg(theme.palette.white)

    local time_container = wibox.widget.background()
    time_container:set_widget(wibox.widget.textclock('%H:%M'))
    time_container:set_fg(theme.palette.magenta)

    local clock_icon = wibox.widget.imagebox()
    clock_icon:set_image(config_path .. 'icons/clock.png')

    local calendar_icon = wibox.widget.imagebox()
    calendar_icon:set_image(config_path .. 'icons/calendar.png')

    screen.wibar:setup({
        margins = 4,
        widget = wibox.container.margin,

        {
            layout = wibox.container.margin,
            margins = 4,

            {
                layout = wibox.layout.align.horizontal,

                {
                    layout = wibox.layout.fixed.horizontal,
                    spacing = 4,
                    launcher,
                    screen.taglist,
                    screen.prompt,
                },

                nil, -- spacer

                {
                    layout = wibox.layout.fixed.horizontal,
                    spacing = 16,

                    {
                        layout = wibox.layout.fixed.horizontal,
                        spacing = 4,
                        calendar_icon,
                        date_container,
                    },

                    {
                        layout = wibox.layout.fixed.horizontal,
                        spacing = 4,
                        clock_icon,
                        time_container,
                    },

                    screen.layoutbox,
                },
            },
        },
    })
end)
