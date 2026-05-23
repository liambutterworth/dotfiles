local gears = require('gears')
local naughty = require('naughty')
local filesystem = require('gears.filesystem')
local config = filesystem.get_configuration_dir()
local theme = {}

theme.transparent = '#00000000'
theme.black = '#1d1f21'
theme.red = '#cc6666'
theme.green = '#b5bd68'
theme.yellow = '#f0c674'
theme.blue = '#81a2be'
theme.magenta = '#b294bb'
theme.cyan = '#8abeb7'
theme.white = '#c8c093'
theme.bright_black = '#727169'
theme.bright_red = '#d54e53'
theme.bright_green = '#b9ca4a'
theme.bright_yellow = '#e7c547'
theme.bright_blue = '#7aa6da'
theme.bright_magenta = '#c397d8'
theme.bright_cyan = '#70c0b1'
theme.bright_white = '#eaeaea'

theme.font = 'SauceCodePro 10, sans 10'
theme.font_family = 'SauceCodePro'
theme.bg_normal = theme.black
theme.bg_focus = theme.black
theme.bg_urgent = theme.transparent
theme.bg_minimize = theme.transparent
theme.fg_normal = theme.bright_white
theme.fg_focus = theme.bright_white
theme.fg_urgent = theme.bright_white
theme.fg_minimize = theme.transparent
theme.border_normal = theme.transparent
theme.border_focus = theme.white
theme.border_marked = theme.transparent
theme.border_radius = 2
theme.border_width = 1
theme.useless_gap = 4

theme.awesome_icon = config .. 'icons/arch.png'
theme.wallpaper = config .. 'wallpapers/mountains.jpg'
theme.layout_fairh = config .. 'icons/fairhw.png'
theme.layout_fairv = config .. 'icons/fairvw.png'
theme.layout_floating = config .. 'icons/floatingw.png'
theme.layout_fullscreen = config .. 'icons/fullscreenw.png'
theme.layout_magnifier = config .. 'icons/magnifierw.png'
theme.layout_max = config .. 'icons/maxw.png'
theme.layout_cornernw = config .. 'icons/cornernww.png'
theme.layout_cornerne = config .. 'icons/cornernew.png'
theme.layout_cornersw = config .. 'icons/cornersww.png'
theme.layout_cornerse = config .. 'icons/cornersew.png'
theme.layout_dwindle = config .. 'icons/dwindlew.png'
theme.layout_spiral = config .. 'icons/spiralw.png'
theme.layout_tile = config .. 'icons/tilew.png'
theme.layout_tilebottom = config .. 'icons/tilebottomw.png'
theme.layout_tileleft = config .. 'icons/tileleftw.png'
theme.layout_tiletop = config .. 'icons/tiletopw.png'

theme.taglist_bg_focus = theme.transparent
theme.taglist_bg_urgent = theme.transparent
theme.taglist_fg_empty = theme.bright_black
theme.taglist_fg_focus = theme.bright_white
theme.taglist_fg_occupied = theme.bright_black
theme.taglist_fg_urgent = theme.bright_red
theme.taglist_fg_volatile = theme.red

theme.notificaiton_bg = theme.black
theme.notification_fg = theme.bright_wight
theme.notification_max_width = 512;
theme.notification_spacing = 16;

theme.notification_shape = function(context, width, height)
    gears.shape.rounded_rect(context, width, height, theme.border_radius)
end

naughty.config.defaults.ontop = true
naughty.config.defaults.icon_size = 32
naughty.config.defaults.timeout = 10
naughty.config.defaults.hover_timeout = 300
naughty.config.defaults.title = 'Status'
naughty.config.defaults.position = 'top_right'
naughty.config.defaults.margin = 16
naughty.config.defaults.border_width = 0

naughty.config.defaults.shape = function(context, width, height)
    gears.shape.rounded_rect(context, width, height, theme.border_radius)
end

return theme
