local wibox = require('wibox')
local filesystem = require('gears.filesystem')

return wibox.widget({
    widget = wibox.container.background,

    {
        layout = wibox.layout.fixed.horizontal,
        spacing = 5,

        {
            widget = wibox.widget.imagebox,
            image = filesystem.get_configuration_dir() .. 'icons/clock.png',
        },

        {
            widget = wibox.widget.textclock,
            format = '%H:%M',
        },
    },
})
