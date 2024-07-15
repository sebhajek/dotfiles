local utils = require('lua/utils')
local colors = require('lua/colors')


local show_ansi_8 = function()
   io.write('ANSI 8:\n')
   for i = 0, 7, 1 do
      io.write(colors.ansi_term.ansi_bg_color_code(255) ..
         colors.ansi_term.ansi_fg_color_code(i) ..
         '  ' .. utils.prepend_zeroes(i, 3) .. ' ' .. colors.ansi_term.ansi_reset_code())
   end
   io.write('\n')
   for i = 0, 7, 1 do
      io.write(colors.ansi_term.ansi_bg_color_code(i) ..
         '  ' .. utils.prepend_zeroes(i, 3) .. ' ' .. colors.ansi_term.ansi_reset_code())
   end
   io.write('\n')
end

local show_bright_8 = function()
   io.write('BRIGHT 8:\n')
   for i = 8, 15, 1 do
      io.write(colors.ansi_term.ansi_fg_color_code(i) ..
         '  ' .. utils.prepend_zeroes(i, 3) .. ' ' .. colors.ansi_term.ansi_reset_code())
   end
   io.write('\n')
   for i = 8, 15, 1 do
      io.write(colors.ansi_term.ansi_fg_color_code(232) ..
         colors.ansi_term.ansi_bg_color_code(i) ..
         '  ' .. utils.prepend_zeroes(i, 3) .. ' ' .. colors.ansi_term.ansi_reset_code())
   end
   io.write('\n')
end

local show_666_8bit = function()
   io.write('8BIT 6X6X6 GRADIENTS:\n')
   local gradient_indexes = {}
   for i = 1, 6, 1 do
      gradient_indexes[i] = {}
   end
   for i = 1, 36, 1 do
      gradient_indexes[1][i] = 15 + i
      gradient_indexes[2][i] = 51 + i
      gradient_indexes[3][i] = 87 + i
      gradient_indexes[4][i] = 123 + i
      gradient_indexes[5][i] = 159 + i
      gradient_indexes[6][i] = 195 + i
   end

   for i = 1, 12, 1 do
      for j = 1, 3, 1 do
         for k = 1, 6, 1 do
            local y = 0
            local x = (i - 1) * 6
            if i > 6 then
               y = 3
               x = (i - 7) * 6
            end

            local color_n = gradient_indexes[y + j][x + k]
            io.write(colors.ansi_term.ansi_bg_color_code(color_n) ..
               ' ' .. utils.prepend_zeroes(color_n, 3) .. colors.ansi_term.ansi_reset_code())
         end
         io.write('  ')
      end
      io.write('\n')
      if i == 6 then
         io.write('\n')
      end
   end
end

local show_grayscale_8bit = function()
   io.write('GRAYSCALE 8BIT:\n')
   for i = 232, 255, 1 do
      io.write(colors.ansi_term.ansi_fg_color_code(i) ..
         ' ' .. utils.prepend_zeroes(i, 3) .. ' ' .. colors.ansi_term.ansi_reset_code())
   end
   io.write('\n')
   for i = 232, 255, 1 do
      io.write(colors.ansi_term.ansi_bg_color_code(i) ..
         ' ' .. utils.prepend_zeroes(i, 3) .. ' ' .. colors.ansi_term.ansi_reset_code())
   end
   io.write('\n')
end

local main = function()
   show_ansi_8()
   show_bright_8()
   show_666_8bit()
   show_grayscale_8bit()
end
main()
