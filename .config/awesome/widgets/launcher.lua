local awful = require('awful')
local theme = require('theme')

return awful.widget.launcher({
    image = theme.awesome_icon,
    command = 'rofi -show drun',
})
