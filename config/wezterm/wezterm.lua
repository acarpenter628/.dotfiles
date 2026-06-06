local wezterm = require 'wezterm'
local mux = wezterm.mux
local config = {}

-- config.font = wezterm.font 'CaskaydiaMono Nerd Font Mono'
config.font_size = 12.0
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
            File = wezterm.config_dir .. "/backgrounds/bg-synthwave2.jpg",
            -- File = wezterm.config_dir .. "/backgrounds/bg-synthwave3.jpg",
            -- File = wezterm.config_dir .. "/backgrounds/bg-city.jpeg",
            -- File = wezterm.config_dir .. "/backgrounds/bg-triangles.jpeg",
            -- File = "~/.dotfiles/config/wezterm/backgrounds/bg-synthwave.jpg", For some reason this one doesn't work
        },
        hsb = { brightness = 0.10 }
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
  {
    key = '[',
    mods = 'SUPER',
    action = wezterm.action.SendKey {
      key = 'Escape',
    },
  },
    -- Make option work as ctrl
  { key = 'a', mods = 'ALT', action = wezterm.action.SendKey { key = 'a', mods = 'CTRL', }, },
  { key = 'x', mods = 'ALT', action = wezterm.action.SendKey { key = 'x', mods = 'CTRL', }, },
  { key = 'e', mods = 'ALT', action = wezterm.action.SendKey { key = 'e', mods = 'CTRL', }, },
  { key = 'g', mods = 'ALT', action = wezterm.action.SendKey { key = 'g', mods = 'CTRL', }, },
  { key = 'd', mods = 'ALT', action = wezterm.action.SendKey { key = 'd', mods = 'CTRL', }, },
  { key = 't', mods = 'ALT', action = wezterm.action.SendKey { key = 't', mods = 'CTRL', }, },
  { key = 'r', mods = 'ALT', action = wezterm.action.SendKey { key = 'r', mods = 'CTRL', }, },  -- history
  { key = 'z', mods = 'ALT', action = wezterm.action.SendKey { key = 'z', mods = 'CTRL', }, },
  { key = 'v', mods = 'ALT', action = wezterm.action.SendKey { key = 'v', mods = 'CTRL', }, },
  -- {
  --   key = 'RightAlt',
  --   action = wezterm.action.SendKey {
  --     key = 'RightControl',
  --   },
  -- },
    -- Sounds like if I switch to a mac, I might be able to remap the alt/ctrl/super keys
    -- Actually maybe I don't want that - it applies in the terminal, not only over ssh?
    --  https://wezterm.org/config/keys.html#available-actions
    --  https://wezterm.org/config/lua/keyassignment/SendKey.html
    --  Actually, I think this is exactly what I want:  https://seb.bearblog.dev/wezterm-and-neovim-keybindings-in-macos/       (mostly)
    --  
    --  Map CTRLV GAXD to Alt, get it to stop doing the fancy characters

    -- use CMD hjkl for arrows :eyes emoji:
  { key = 'h', mods = 'CMD', action = wezterm.action.SendKey { key = 'LeftArrow', }, },
  { key = 'j', mods = 'CMD', action = wezterm.action.SendKey { key = 'DownArrow', }, },
  { key = 'k', mods = 'CMD', action = wezterm.action.SendKey { key = 'UpArrow', }, },
  { key = 'l', mods = 'CMD', action = wezterm.action.SendKey { key = 'RightArrow', }, },
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
