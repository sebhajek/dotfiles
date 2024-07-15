local wezterm = require 'wezterm'
local color_utils = require('colors')
local config = wezterm.config_builder()


local t_concat = function(t1, t2)
   for i = 1, #t2, 1 do
      t1[#t1 + 1] = t2[i]
   end
   return t1
end


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
local foreground = '#f2f4f8'
local background = '#000000'
local indexed = { [232] = '#000000' }

local grayscale_arr1 = color_utils.interpol_colors(color_utils.color_from_hex(background),
   color_utils.color_from_hex(ansi_colors[1]), 4)
local grayscale_arr2 = color_utils.interpol_colors(color_utils.color_from_hex(ansi_colors[1]),
   color_utils.color_from_hex(bright_colors[1]), 4)
local grayscale_arr3 = color_utils.interpol_colors(color_utils.color_from_hex(bright_colors[1]),
   color_utils.color_from_hex(ansi_colors[8]), 8)
local grayscale_arr4 = color_utils.interpol_colors(color_utils.color_from_hex(ansi_colors[8]),
   color_utils.color_from_hex(bright_colors[8]), 4)
local grayscale_arr5 = color_utils.interpol_colors(color_utils.color_from_hex(bright_colors[8]),
   color_utils.color_from_hex(foreground), 3)
local grayscale_arr6 = { color_utils.color_from_hex(foreground) }

local grayscale_arr = t_concat(grayscale_arr1, grayscale_arr2)
grayscale_arr = t_concat(grayscale_arr, grayscale_arr3)
grayscale_arr = t_concat(grayscale_arr, grayscale_arr4)
grayscale_arr = t_concat(grayscale_arr, grayscale_arr5)
grayscale_arr = t_concat(grayscale_arr, grayscale_arr6)

for i = 232, 255, 1 do
   indexed[i] = color_utils.hex_from_color(grayscale_arr[i - 231])
   print(i .. '->' .. color_utils.hex_from_color(grayscale_arr[i - 231]))
end

local colors = {
   foreground = foreground,
   background = background,
   ansi = ansi_colors,
   brights = bright_colors,
   indexed = indexed
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
