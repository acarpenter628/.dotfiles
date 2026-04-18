local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'CaskaydiaMono Nerd Font Mono'
config.font_size = 11.0
config.color_scheme = 'Breeze (Gogh)'
config.hide_tab_bar_if_only_one_tab = true
config.audible_bell = "Disabled"

-- might as well do the other config instead of this one
-- config.window_background_image = '/path/to/wallpaper.jpg'
-- config.window_background_image_hsb = {
--   brightness = 0.1,
--   hue = 1.0,
--   saturation = 1.0,
-- }
--
--
-- config.background = {
--     {
--         source = {
--             File = wezterm.config_dir .. "/backgrounds/synthwave.png",
--         },
--         hsb = { brightness = 0.1 }  -- maybe I need to call this a local variable first?  that would seem dumb
--     }
-- }
-- Cool parallax stuff here:  https://wezterm.org/config/lua/config/background.html?h=background#parallax-example

-- Looks like shaders are in progress:  https://github.com/wezterm/wezterm/issues/6985


return config
