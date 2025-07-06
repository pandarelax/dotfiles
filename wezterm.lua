-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action
local wsl = wezterm.default_wsl_domains()

-- config.default_domain = "WSL:Ubuntu"
config.wsl_domains = wsl

config.leader = { key = "a", mods = "ALT", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "f", mods = "LEADER|ALT", action = act.Search({ CaseSensitiveString = "" }) },
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "o", mods = "LEADER|ALT", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "q", mods = "LEADER|ALT", action = act.CloseCurrentTab({ confirm = false }) },
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
	{
		key = ",",
		mods = "LEADER|ALT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}
config.default_prog = { "powershell" }

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.font_size = 10.0

config.color_scheme = "Kanagawa (Gogh)"
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false
-- config.color_scheme = "Catppuccin Frappé (Gogh)"
--
-- tmux status
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#b7bdf8" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

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
