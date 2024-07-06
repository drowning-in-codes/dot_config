-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
config.window_background_opacity = 0.8 
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font_with_fallback {
  'MesloLGS NF',
  "Monaspace Krypton",
  "Monaspace Xenon",
  'Fira Code', 
  'JetBrains Mono',
}
-- This is where you actually apply your config choices

config.keys = {
  {
    key = 'H',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.Search { CaseInSensitiveString = 'hash' },
  },
 { key = "f", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
  -- other keys
}
config.enable_scroll_bar = true
-- For example, changing the color scheme:
config.color_scheme = 'Pixiefloss (Gogh)'

-- Spawn a shell
-- powershell, nushell, bash and others.
config.default_prog = { 'D:\\Git\\bin\\bash.exe' }

-- and finally, return the configuration to wezterm
return config
