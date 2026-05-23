local wibox = require('wibox')
local theme = require('theme')
local filesystem = require('gears.filesystem')

return wibox.widget({
    widget = wibox.container.background,
    fg = theme.palette.white,

    {
        layout = wibox.layout.fixed.horizontal,
        spacing = 4,

        {
            widget = wibox.widget.imagebox,
            image = filesystem.get_configuration_dir() .. 'icons/clock.png',
        },

        {
            widget = wibox.widget.textclock,
            format = '%a %b %d',
        },
    },
})
