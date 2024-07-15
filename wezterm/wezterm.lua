local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local colors = require('colors')
config.colors = colors

config.enable_wayland = false --gnome wayland cursor fix

--[ SHELL SETTINGS]--
local default_shell = { 'fish', '-l' }
config.default_prog = default_shell

--[ APPEARANCE ]--
config.enable_scroll_bar = false

--[ FONTS ]--
local default_font = {
   family = 'IBM Plex Mono',
   weight = 'Regular',
   italic = false
}
local nerd_font = {
   family = 'BlexMono Nerd Font',
   weight = 'Regular',
   italic = false
}
local bitmap_font = {
   family = 'Cozette',
   weight = 'Medium',
   italic = false
}

config.font = wezterm.font_with_fallback {
   default_font,
   nerd_font,
}


--[ TAB & WINDOW APPEARANCE ]--
config.window_frame = {
   font = wezterm.font_with_fallback {
      bitmap_font,
      default_font,
      nerd_font,
   },
   font_size = 8,
   active_titlebar_bg = '#333333',
   inactive_titlebar_bg = '#333333',
}

--[ KEYBINDS ]--
config.keys = {
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
         args = default_shell
      }
   },
   {
      key = 'k',
      mods = 'CTRL|ALT',
      action = wezterm.action.CloseCurrentTab { confirm = true }
   }
}



return config
