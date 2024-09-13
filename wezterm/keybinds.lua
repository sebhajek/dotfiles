local wezterm = require 'wezterm'
local defaults = require 'defaults'

local keybinds = {
	{
		key = 'h',
		mods = 'CTRL|ALT',
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = 'l',
		mods = 'CTRL|ALT',
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = 'j',
		mods = 'CTRL|ALT',
		action = wezterm.action.SpawnCommandInNewTab {
			domain = 'CurrentPaneDomain',
			args = defaults.default_shell,
		},
	},
	{
		key = 'k',
		mods = 'CTRL|ALT',
		action = wezterm.action.CloseCurrentTab { confirm = true },
	},
	{
		key = 'p',
		mods = 'CTRL|ALT',
		action = wezterm.action.ActivateCommandPalette,
	},
	{
		key = 'd',
		mods = 'SHIFT|CTRL|ALT',
		action = wezterm.action.ShowDebugOverlay,
	},
	{
		key = 'c',
		mods = 'SHIFT|CTRL',
		action = wezterm.action.CopyTo 'Clipboard',
	},
	{
		key = 'v',
		mods = 'SHIFT|CTRL',
		action = wezterm.action.PasteFrom 'Clipboard',
	},
}

return keybinds
