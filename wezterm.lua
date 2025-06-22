-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "n", mods = "LEADER|CTRL", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "LEADER|CTRL", action = act.CloseCurrentTab({ confirm = false }) },
}
config.default_prog = { "powershell" }

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = 'Catppuccin Frappé (Gogh)'
--

-- Kanso Theme - Mist
config.force_reverse_video_cursor = true
config.colors = {
	foreground = "#C5C9C7",
	background = "#22262D",

	cursor_bg = "#C5C9C7",
	cursor_fg = "#22262D",
	cursor_border = "#C5C9C7",

	selection_fg = "#C5C9C7",
	selection_bg = "#43464E",

	scrollbar_thumb = "#43464E",
	split = "#43464E",

	ansi = {
		"#22262D",
		"#C4746E",
		"#8A9A7B",
		"#C4B28A",
		"#8BA4B0",
		"#A292A3",
		"#8EA4A2",
		"#a4a7a4",
	},
	brights = {
		"#5C6066",
		"#E46876",
		"#87A987",
		"#E6C384",
		"#7FB4CA",
		"#938AA9",
		"#7AA89F",
		"#C5C9C7",
	},
}

-- and finally, return the configuration to wezterm
return config
