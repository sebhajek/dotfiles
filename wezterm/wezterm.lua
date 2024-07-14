local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.enable_wayland = false --gnome wayland cursor fix

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

--[ COLORS ]--
local ansi_colors = {
   '#161616',
   '#ee5396',
   '#374f49',
   '#ff6f00',
   '#33b1ff',
   '#673ab7',
   '#08bdba',
   '#90a4ae',
}
local bright_colors = {
   '#393939',
   '#ff7eb6',
   '#42be65',
   '#ffab91',
   '#78a9ff',
   '#be95ff',
   '#3ddbd9',
   '#dde1e6',
}
local colors = {
   foreground = '#f2f4f8',
   background = '#000000',
   ansi = ansi_colors,
   brights = bright_colors,
}
config.colors = colors

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
      action = wezterm.action.SpawnTab 'CurrentPaneDomain'
   },
   {
      key = 'k',
      mods = 'CTRL|ALT',
      action = wezterm.action.CloseCurrentTab { confirm = true }
   }
}

return config
