---------------------------
-- Default awesome theme --
---------------------------

-- local theme_assets = require('beautiful.theme_assets')
-- local xresources = require('beautiful.xresources')
local filesystem = require('gears.filesystem')
local themes_path = filesystem.get_themes_dir()
local share_path = filesystem.get_xdg_data_home()
local config_path = filesystem.get_configuration_dir()
-- local dpi = xresources.apply_dpi
local theme = {}

-- -- nord
-- theme.black = "#373e4d"
-- theme.red = "#94545d"
-- theme.green = "#809575"
-- theme.yellow = "#b29e75"
-- theme.blue = "#68809a"
-- theme.magenta = "#8c738c"
-- theme.cyan = "#6d96a5"
-- theme.white = "#aeb3bb"
-- theme.bright_black = "#616e88"
-- theme.bright_red = "#bf616a"
-- theme.bright_green = "#a3be8c"
-- theme.bright_yellow = "#ebcb8b"
-- theme.bright_blue = "#81a1c1"
-- theme.bright_magenta = "#b48ead"
-- theme.bright_cyan = "#8fbcbb"
-- theme.bright_white = "#eceff4"

-- tomorrow night
theme.black = "#1d1f21"
theme.red = "#cc6666"
theme.green = "#b5bd68"
theme.yellow = "#f0c674"
theme.blue = "#81a2be"
theme.magenta = "#b294bb"
theme.cyan = "#8abeb7"
theme.white = "#373b41"
theme.bright_black = "#666666"
theme.bright_red = "#d54e53"
theme.bright_green = "#b9ca4a"
theme.bright_yellow = "#e7c547"
theme.bright_blue = "#7aa6da"
theme.bright_magenta = "#c397d8"
theme.bright_cyan = "#70c0b1"
theme.bright_white = "#eaeaea"

theme.font = 'SauceCodePro 10, sans 10'

theme.bg_normal = theme.black
theme.bg_focus = '#535d6c'
theme.bg_urgent = '#ff0000'
theme.bg_minimize = '#444444'

theme.fg_normal = theme.bright_black
theme.fg_focus = '#ffffff'
theme.fg_urgent = '#ffffff'
theme.fg_minimize = '#4c566a'

theme.border_width = 1
theme.border_normal = '#000000'
theme.border_focus = '#ebcb8b'
theme.border_marked = '#91231c'

theme.taglist_fg_focus = theme.bright_white
theme.taglist_fg_empty = theme.bright_black
theme.taglist_fg_urgent = theme.yellow
theme.taglist_fg_volatile = theme.red
theme.taglist_bg_focus = theme.black
theme.taglist_bg_urgent = theme.black

theme.useless_gap = 4

-- theme.tasklist_plain_task_name = true
-- theme.tasklist_disable_task_name = true

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = '#ff0000'

-- Generate taglist squares:
-- local taglist_square_size = dpi(4)
-- theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
--     taglist_square_size, theme.fg_normal
-- )
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
--     taglist_square_size, theme.fg_normal
-- )

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
-- theme.menu_submenu_icon = themes_path .. 'default/submenu.png'
-- theme.menu_height = dpi(15)
-- theme.menu_width = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = '#cc0000'

theme.awesome_icon = config_path .. 'icons/arch-linux.png'
theme.wallpaper = config_path .. 'wallpapers/mountains.jpg'

theme.layout_fairh = config_path .. 'icons/fairhw.png'
theme.layout_fairv = config_path .. 'icons/fairvw.png'
theme.layout_floating = config_path .. 'icons/floatingw.png'
theme.layout_magnifier = config_path .. 'icons/magnifierw.png'
theme.layout_max = config_path .. 'icons/maxw.png'
theme.layout_fullscreen = config_path .. 'icons/fullscreenw.png'
theme.layout_tilebottom = config_path .. 'icons/tilebottomw.png'
theme.layout_tileleft = config_path .. 'icons/tileleftw.png'
theme.layout_tile = config_path .. 'icons/tilew.png'
theme.layout_tiletop = config_path .. 'icons/tiletopw.png'
theme.layout_spiral = config_path .. 'icons/spiralw.png'
theme.layout_dwindle = config_path .. 'icons/dwindlew.png'
theme.layout_cornernw = config_path .. 'icons/cornernww.png'
theme.layout_cornerne = config_path .. 'icons/cornernew.png'
theme.layout_cornersw = config_path .. 'icons/cornersww.png'
theme.layout_cornerse = config_path .. 'icons/cornersew.png'

return theme
