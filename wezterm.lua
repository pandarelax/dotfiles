-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

config.leader = { key = "a", mods = "ALT", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "o", mods = "LEADER|ALT", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "LEADER|ALT", action = act.CloseCurrentTab({ confirm = false }) },
	{ key = "p", mods = "LEADER|ALT", action = act.ActivateTabRelative(-1) },
	{ key = "n", mods = "LEADER|ALT", action = act.ActivateTabRelative(1) },
	{ key = "-", mods = "LEADER|ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "ü", mods = "LEADER|ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER|ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER|ALT", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER|ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER|ALT", action = act.ActivatePaneDirection("Right") },
	{ key = "RightArrow", mods = "LEADER|ALT", action = act.AdjustPaneSize({ "Right", 5 }) },
	{ key = "LeftArrow", mods = "LEADER|ALT", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "DownArrow", mods = "LEADER|ALT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "UpArrow", mods = "LEADER|ALT", action = act.AdjustPaneSize({ "Up", 5 }) },
}
config.default_prog = { "powershell" }

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.font_size = 10.0

config.color_scheme = "Kanagawa (Gogh)"
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
-- config.color_scheme = "Catppuccin Frappé (Gogh)"

-- Kanso Theme - Mist
-- config.force_reverse_video_cursor = true
-- config.colors = {
-- 	foreground = "#C5C9C7",
-- 	background = "#22262D",
--
-- 	cursor_bg = "#C5C9C7",
-- 	cursor_fg = "#22262D",
-- 	cursor_border = "#C5C9C7",
--
-- 	selection_fg = "#C5C9C7",
-- 	selection_bg = "#43464E",
--
-- 	scrollbar_thumb = "#43464E",
-- 	split = "#43464E",
--
-- 	ansi = {
-- 		"#22262D",
-- 		"#C4746E",
-- 		"#8A9A7B",
-- 		"#C4B28A",
-- 		"#8BA4B0",
-- 		"#A292A3",
-- 		"#8EA4A2",
-- 		"#a4a7a4",
-- 	},
-- 	brights = {
-- 		"#5C6066",
-- 		"#E46876",
-- 		"#87A987",
-- 		"#E6C384",
-- 		"#7FB4CA",
-- 		"#938AA9",
-- 		"#7AA89F",
-- 		"#C5C9C7",
-- 	},
-- }

-- and finally, return the configuration to wezterm
return config
