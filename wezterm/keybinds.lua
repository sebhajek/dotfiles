local wezterm = require 'wezterm'
local defaults = require('defaults')

local keybinds = {
   {
      key = 'h',
      mods = 'CTRL|ALT',
      action = wezterm.action.ActivateTabRelative(-1)
   },
   {
      key = 'l',
      mods = 'CTRL|ALT',
      action = wezterm.action.ActivateTabRelative(1)
   },
   {
      key = 'j',
      mods = 'CTRL|ALT',
      action = wezterm.action.SpawnCommandInNewTab {
         domain = 'CurrentPaneDomain',
         args = defaults.default_shell
      }
   },
   {
      key = 'k',
      mods = 'CTRL|ALT',
      action = wezterm.action.CloseCurrentTab { confirm = true }
   }
}

return keybinds
