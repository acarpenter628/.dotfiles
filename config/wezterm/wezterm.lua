local wezterm = require 'wezterm'
local mux = wezterm.mux
local config = {}

-- config.font = wezterm.font 'CaskaydiaMono Nerd Font Mono'
config.font_size = 12.5
config.color_scheme = 'Breeze (Gogh)'
config.hide_tab_bar_if_only_one_tab = true
config.audible_bell = "Disabled"
config.initial_cols = 150
config.initial_rows = 40

-- These don't seem to work
config.use_ime = false
config.use_dead_keys = false

-- config.debug_key_events = true  -- Need to run wezterm from another terminal


wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)


config.background = {
    {
        source = {
            -- File = wezterm.config_dir .. "/backgrounds/bg-synthwave.jpg",
            -- File = wezterm.config_dir .. "/backgrounds/bg-circuit.jpeg",
            -- File = wezterm.config_dir .. "/backgrounds/bg-floral.jpeg",
            -- File = wezterm.config_dir .. "/backgrounds/bg-synthwave2.jpg",
            File = wezterm.config_dir .. "/backgrounds/synthwave-purple.jpg",
            -- File = wezterm.config_dir .. "/backgrounds/mountains.jpg",
            -- File = wezterm.config_dir .. "/backgrounds/bg-synthwave3.jpg",
            -- File = wezterm.config_dir .. "/backgrounds/bg-city.jpeg",
            -- File = wezterm.config_dir .. "/backgrounds/bg-triangles.jpeg",
            -- File = "~/.dotfiles/config/wezterm/backgrounds/bg-synthwave.jpg", For some reason this one doesn't work
        },
        hsb = { brightness = 0.25 },
        width = 'Cover',
        height = 'Cover',
        horizontal_align = 'Center',
        vertical_align = 'Middle',
        repeat_x = 'NoRepeat',
        repeat_y = 'NoRepeat',
        halignment_mode = 'Contain', 
    }
}
-- config.window_background_gradient = {
--   colors = { '#0d114f', '#0d4f27' },
--   -- Specifies a Linear gradient starting in the top left corner.
--   orientation = { Linear = { angle = -75.0 } },
-- }

-- Cool parallax stuff here:  https://wezterm.org/config/lua/config/background.html?h=background#parallax-example

-- Looks like shaders are in progress:  https://github.com/wezterm/wezterm/issues/6985

config.keys = {
    {key = 'n', mods = 'SHIFT|CTRL', action = wezterm.action.ToggleFullScreen,},
    {key = '[', mods = 'ALT', action = wezterm.action.SendKey { key = 'Escape',},}, -- exit insert mode
    {key = ',', mods = 'CTRL', action = wezterm.action.SendKey { key = 'F2', },},
    {key = '.', mods = 'CTRL', action = wezterm.action.SendKey { key = 'F3', },},
    {key = ',', mods = 'ALT', action = wezterm.action.SendKey { key = 'h', mods = 'ALT',},}, -- for zellij tab changes
    {key = '.', mods = 'ALT', action = wezterm.action.SendKey { key = 'l', mods = 'ALT',},},

}
-- local function bind_alt_to_ctrl(key)
--   return function(window, pane)
--     -- local is_nvim = pane:get_foreground_process_name():match(".*/([^/]+)$") == "nvim"
--     -- if not is_nvim then return end
--
--     window:perform_action({ SendKey = { key = key, mods = 'CTRL' } }, pane)
--   end
-- end

-- local function bind_alt_to_ctrl(key)
-- table.insert(config.keys, {  key = key, mods = 'ALT', action = wezterm.action.SendKey { key = key, mods = 'CTRL', }, })
-- end
--
-- 


return config
