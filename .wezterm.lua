-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

config.keys = {
    { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
}
config.default_prog = { 'powershell' }

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'GruvboxDarkHard'

-- and finally, return the configuration to wezterm
return config
