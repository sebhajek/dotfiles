local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local defaults = require('defaults')


local keybinds = require('keybinds')
config.keys = keybinds

config.enable_wayland = false --gnome wayland cursor fix


--[ SHELL SETTINGS]--
config.default_prog = defaults.default_shell


--[ APPEARANCE ]--

config.enable_scroll_bar = false


local colors = require('colors')
config.colors = colors


local fonts = require('fonts')
config.font = fonts.term_font
config.font_size = fonts.term_font_size


--[ TAB & WINDOW APPEARANCE ]--
config.window_frame = {
   font = fonts.gui_font,
   font_size = fonts.guit_font_size,
   active_titlebar_bg = colors.background,
   inactive_titlebar_bg = colors.background,
   active_titlebar_fg = colors.foreground,
   inactive_titlebar_fg = colors.ansi[8],

   inactive_titlebar_border_bottom = colors.background,
   active_titlebar_border_bottom = colors.background,
   button_fg = colors.ansi[3],
   button_bg = colors.background,
   button_hover_fg = colors.ansi[8],
   button_hover_bg = colors.ansi[1],
}

config.colors.tab_bar = {
   background = colors.background,

   active_tab = {
      bg_color = colors.background,
      fg_color = colors.foreground,
      intensity = 'Normal',
      underline = 'None'
   },

   inactive_tab = {
      bg_color = colors.background,
      fg_color = colors.ansi[3],
      intensity = 'Normal',
      underline = 'None'
   },
   inactive_tab_hover = {
      bg_color = colors.background,
      fg_color = colors.ansi[8],
      intensity = 'Normal',
      underline = 'None'
   },

   new_tab = {
      bg_color = colors.background,
      fg_color = colors.ansi[3],
   },
   new_tab_hover = {
      bg_color = colors.background,
      fg_color = colors.ansi[8],
      italic = true,
   },

   inactive_tab_edge = colors.ansi[1]
}


return config
