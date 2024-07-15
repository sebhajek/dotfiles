local color_utils = require('color')

local t_concat = function(t1, t2)
   for i = 1, #t2, 1 do
      t1[#t1 + 1] = t2[i]
   end
   return t1
end

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


local indexed = {}

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
end

local block_arr1 = color_utils.bi_interpol_colors(color_utils.color_from_hex(ansi_colors[1]),
   color_utils.color_from_hex(bright_colors[5]), color_utils.color_from_hex(ansi_colors[3]),
   color_utils.color_from_hex(ansi_colors[7]), 6, 6)
for i = 16, 51, 1 do
   indexed[i] = color_utils.hex_from_color(block_arr1[i - 15])
end

local block_arr2 = color_utils.bi_interpol_colors(color_utils.color_from_hex(ansi_colors[2]),
   color_utils.color_from_hex(ansi_colors[5]), color_utils.color_from_hex(ansi_colors[3]),
   color_utils.color_from_hex(ansi_colors[7]), 6, 6)
for i = 52, 87, 1 do
   indexed[i] = color_utils.hex_from_color(block_arr2[i - 51])
end

local block_arr3 = color_utils.bi_interpol_colors(color_utils.color_from_hex(ansi_colors[2]),
   color_utils.color_from_hex(ansi_colors[6]), color_utils.color_from_hex(ansi_colors[4]),
   color_utils.color_from_hex(ansi_colors[7]), 6, 6)
for i = 88, 123, 1 do
   indexed[i] = color_utils.hex_from_color(block_arr3[i - 87])
end

local block_arr4 = color_utils.bi_interpol_colors(color_utils.color_from_hex(ansi_colors[2]),
   color_utils.color_from_hex(ansi_colors[6]), color_utils.color_from_hex(bright_colors[3]),
   color_utils.color_from_hex(bright_colors[7]), 6, 6)
for i = 124, 159, 1 do
   indexed[i] = color_utils.hex_from_color(block_arr4[i - 123])
end

local block_arr5 = color_utils.bi_interpol_colors(color_utils.color_from_hex(ansi_colors[2]),
   color_utils.color_from_hex(bright_colors[6]), color_utils.color_from_hex(bright_colors[3]),
   color_utils.color_from_hex(ansi_colors[8]), 6, 6)
for i = 160, 195, 1 do
   indexed[i] = color_utils.hex_from_color(block_arr5[i - 159])
end

local block_arr6 = color_utils.bi_interpol_colors(color_utils.color_from_hex(bright_colors[2]),
   color_utils.color_from_hex(bright_colors[6]), color_utils.color_from_hex(bright_colors[4]),
   color_utils.color_from_hex(bright_colors[8]), 6, 6)
for i = 196, 231, 1 do
   indexed[i] = color_utils.hex_from_color(block_arr6[i - 195])
end


local colors = {
   foreground = foreground,
   background = background,
   ansi = ansi_colors,
   brights = bright_colors,
   indexed = indexed
}

return colors

