local fonts = {}


fonts.term_font_size = 11
fonts.gui_font_size = 9

--[ FONTS ]--
fonts.default_font = {
   family = 'IBM Plex Mono',
   weight = 'Regular',
   italic = false
}
fonts.glyph_font = {
   family = 'JuliaMono',
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
   fonts.glyph_font,
   fonts.nerd_font,
}

fonts.gui_font = wezterm.font_with_fallback {
   fonts.bitmap_font,
   fonts.glyph_font,
   fonts.nerd_font,
}

fonts.antialias = {
   load = 'Light',
   render = 'Light'
}

fonts.hsb = {
   hue = 1.0,
   saturation = 1.0,
   brightness = 0.92,
}

return fonts
