-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.wsl_domains = {
	{
		-- The name of this specific domain.  Must be unique amonst all types
		-- of domain in the configuration file.
		name = "WSL:Ubuntu",

		-- The name of the distribution.  This identifies the WSL distribution.
		-- It must match a valid distribution from your `wsl -l -v` output in
		-- order for the domain to be useful.
		distribution = "Ubuntu",
	},
}
config.default_domain = "WSL:Ubuntu"

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
--config.color_scheme = "tokyonight_storm"
config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })
--config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 11

config.keys = {
	-- Turn off the default CMD-m Hide action, allowing CMD-m to
	-- be potentially recognized and handled by the tab
	{
		key = "1",
		mods = "ALT",
		action = wezterm.action({ ActivateTab = 0 }),
	},
	{
		key = "2",
		mods = "ALT",
		action = wezterm.action({ ActivateTab = 1 }),
	},
	{
		key = "3",
		mods = "ALT",
		action = wezterm.action({ ActivateTab = 2 }),
	},
	{
		key = "4",
		mods = "ALT",
		action = wezterm.action({ ActivateTab = 3 }),
	},
	{
		key = "5",
		mods = "ALT",
		action = wezterm.action({ ActivateTab = 4 }),
	},
	{
		key = "6",
		mods = "ALT",
		action = wezterm.action({ ActivateTab = 5 }),
	},
	{
		key = "w",
		mods = "ALT",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "t",
		mods = "ALT",
		action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
	},
}

-- and finally, return the configuration to wezterm
return config
