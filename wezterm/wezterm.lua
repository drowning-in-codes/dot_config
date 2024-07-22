-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
config.window_background_opacity = 0.8
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font_with_fallback({
	"MesloLGS NF",
	"Monaspace Krypton",
	"Monaspace Xenon",
	"Fira Code",
	"JetBrains Mono",
})
-- wallpaper
local dimmer = { brightness = 0.1 }
config.enable_scroll_bar = true
config.min_scroll_bar_height = "2cell"
config.background = {
	{
		source = { File = "~/dotfiles/wezterm/images/eva.jpg" },
		repeat_x = "Mirror",
		hsb = dimmer,
		-- When the viewport scrolls, move this layer 10% of the number of
		-- pixels moved by the main viewport. This makes it appear to be
		-- further behind the text.
		attachment = { Parallax = 0.1 },
	},
}

-- This is where you actually apply your config choices
config.keys = {
	{
		key = "H",
		mods = "SHIFT|CTRL",
		action = wezterm.action.Search({ CaseInSensitiveString = "hash" }),
	},
	{ key = "f", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	-- other keys
}
config.enable_scroll_bar = true
-- For example, changing the color scheme:
config.color_scheme = "Pixiefloss (Gogh)"

-- Spawn a shell
-- powershell, nushell, bash and others.
config.default_prog = { "D:\\Git\\bin\\bash.exe" }

-- and finally, return the configuration to wezterm
return config
