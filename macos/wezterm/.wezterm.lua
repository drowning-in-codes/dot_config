-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 18
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.show_new_tab_button_in_tab_bar = false
-- This is where you actually apply your config choices
config.window_background_opacity = 0.9
config.macos_window_background_blur = 50
config.text_background_opacity = 0.9
config.adjust_window_size_when_changing_font_size = false
config.window_padding = {
	left = 20,
	right = 20,
	top = 20,
	bottom = 5,
}
-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night Moon"

-- and finally, return the configuration to wezterm
return config
