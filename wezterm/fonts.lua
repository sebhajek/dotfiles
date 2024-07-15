local fonts = {}


fonts.term_font_size = 12
fonts.gui_font_size = 8

--[ FONTS ]--
fonts.default_font = {
   family = 'IBM Plex Mono',
   weight = 'Regular',
   italic = false
}
fonts.nerd_font = {
   family = 'BlexMono Nerd Font',
   weight = 'Regular',
   italic = false
}
fonts.bitmap_font = {
   family = 'Cozette',
   weight = 'Medium',
   italic = false
}

--[ SETTING FALLBACKS ]--
local wezterm = require 'wezterm'

fonts.term_font = wezterm.font_with_fallback {
   fonts.default_font,
   fonts.nerd_font,
}

fonts.gui_font = wezterm.font_with_fallback {
   fonts.bitmap_font,
   fonts.default_font,
   fonts.nerd_font,
}

return fonts
