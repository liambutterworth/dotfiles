local awful = require('awful')
local gears = require('gears')
local theme = require('theme')
local layouts = require('layouts')
local wibox = require('wibox')
local widgets = require('widgets')

local function create_taglist(screen)
    return awful.widget.taglist({
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
end

local function create_layoutbox(screen)
    local layoutbox = awful.widget.layoutbox(screen)

    layoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc( 1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc( 1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)
    ))

    return layoutbox
end

local function attach_bar(screen)
    local wibar = awful.wibar({
        position = 'top',
        screen = screen,
        height = 36,
        bg = theme.bg_normal .. 'e8',
    })

    local layoutbox = create_layoutbox(screen)
    local taglist = create_taglist(screen)

    awful.tag({ '1', '2', '3', '4', '5', '6', '7', '8', '9' }, screen, layouts[1])

    wibar:setup({
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
                    widgets.launcher,
                    taglist,
                },

                nil, -- spacer

                {
                    layout = wibox.layout.fixed.horizontal,
                    spacing = 16,
                    widgets.date,
                    widgets.time,
                    layoutbox,
                },
            },
        },
    })
end

local function attach_wallpaper(screen)
    gears.wallpaper.maximized(theme.wallpaper, screen, true)
end

screen.connect_signal('property::geometry', attach_wallpaper)

awful.screen.connect_for_each_screen(function(screen)
    attach_wallpaper(screen)
    attach_bar(screen)
end)
