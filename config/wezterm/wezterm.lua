local wezterm = require 'wezterm'
local mux = wezterm.mux
local config = {}

config.font = wezterm.font 'CaskaydiaMono Nerd Font Mono'
config.font_size = 11.0
config.color_scheme = 'Breeze (Gogh)'
config.hide_tab_bar_if_only_one_tab = true
config.audible_bell = "Disabled"
config.initial_cols = 150
config.initial_rows = 40


wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)


config.background = {
    {
        source = {
            File = wezterm.config_dir .. "/backgrounds/bg-synthwave.jpg",
            -- File = "~/.dotfiles/config/wezterm/backgrounds/bg-synthwave.jpg", For some reason this one doesn't work
        },
        hsb = { brightness = 0.03 }
    }
}
-- Cool parallax stuff here:  https://wezterm.org/config/lua/config/background.html?h=background#parallax-example

-- Looks like shaders are in progress:  https://github.com/wezterm/wezterm/issues/6985

config.keys = {
  {
    key = 'n',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}

return config
