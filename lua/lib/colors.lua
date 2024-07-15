local export_colors = {}


--[ ANSI COLOR CONVERSION ]--
export_colors.ansi_term = {}

---@param color_code integer
---@return string
export_colors.ansi_term.ansi_fg_color_code = function(color_code)
   if color_code < 8 and color_code >= 0 then
      local ansi_code = 30 + color_code
      return '\27[' .. ansi_code .. 'm'
   elseif color_code <= 255 then
      return '\27[38;5;' .. color_code .. 'm'
   end
   return export_colors.ansi_reset_code()
end

---@param color_code integer
---@return string
export_colors.ansi_term.ansi_bg_color_code = function(color_code)
   if color_code < 8 and color_code >= 0 then
      local ansi_code = 40 + color_code
      return '\27[' .. ansi_code .. 'm'
   elseif color_code <= 255 then
      return '\27[48;5;' .. color_code .. 'm'
   end
   return export_colors.ansi_reset_code()
end

---@return string
export_colors.ansi_term.ansi_reset_code = function()
   return '\27[00m'
end

--[ COLOR UTILS ]--
---@class Color
---@field red integer
---@field green integer
---@field blue integer

---@param r number
---@param g number
---@param b number
---@return Color
export_colors.color_from_rgb = function(r, g, b)
   r = math.max(math.min(math.floor(r), 255), 0)
   g = math.max(math.min(math.floor(g), 255), 0)
   b = math.max(math.min(math.floor(b), 255), 0)

   return {
      red = r,
      green = g,
      blue = b
   }
end

---@param hex string
---@return Color
export_colors.color_from_hex = function(hex)
   if (#hex % 2) ~= 0 then
      hex = hex:sub(2)
   end

   local r_hex = hex:sub(1, 2)
   local g_hex = hex:sub(3, 4)
   local b_hex = hex:sub(5, 6)

   local r = tonumber(r_hex, 16)
   local g = tonumber(g_hex, 16)
   local b = tonumber(b_hex, 16)

   return export_colors.color_from_rgb(r, g, b)
end


---@param color Color
---@return string
export_colors.hex_from_color = function(color)
   local r_hex = string.format("%X", tostring(color.red))
   local g_hex = string.format("%X", tostring(color.green))
   local b_hex = string.format("%X", tostring(color.blue))
   while #r_hex < 2 do r_hex = '0' .. r_hex end
   while #g_hex < 2 do g_hex = '0' .. g_hex end
   while #b_hex < 2 do b_hex = '0' .. b_hex end
   local hex = '#' .. r_hex .. g_hex .. b_hex
   hex = hex:lower()
   return hex
end

---@param color1 Color
---@param color2 Color
---@param n integer
---@return Color[]
export_colors.interpol_colors = function(color1, color2, n)
   ---@type number
   local step = 1 / n
   ---@type Color[]
   local col_arr = {}

   ---@type integer
   local red_delta = (color2.red - color1.red)
   ---@type integer
   local green_delta = (color2.green - color1.green)
   ---@type integer
   local blue_delta = (color2.blue - color1.blue)

   for i = 1, n, 1 do
      local n_red = color1.red + (red_delta * step * i)
      local n_green = color1.green + (green_delta * step * i)
      local n_blue = color1.blue + (blue_delta * step * i)
      col_arr[#col_arr + 1] = export_colors.color_from_rgb(n_red, n_green, n_blue)
   end

   return col_arr
end

---@param color1 Color top-left
---@param color2 Color top-right
---@param color3 Color bottom-left
---@param color4 Color bottom-right
---@param x number 1/n
---@param y number 1/n
---@return Color
export_colors.bilinear_colors = function(color1, color2, color3, color4, x, y)
   ---@param a integer
   ---@param b integer
   ---@param c integer
   ---@param d integer
   ---@return number
   local bilinear_interpol = function(a, b, c, d)
      local top_col = a + ((b - a) * x)
      local bot_col = c + ((d - c) * x)
      local t_col = top_col + ((bot_col - top_col) * y)
      return t_col
   end

   local result_r = bilinear_interpol(color1.red, color2.red, color3.red, color4.red)
   local result_g = bilinear_interpol(color1.green, color2.green, color3.green, color4.green)
   local result_b = bilinear_interpol(color1.blue, color2.blue, color3.blue, color4.blue)
   return export_colors.color_from_rgb(result_r, result_g, result_b)
end

---@param color1 Color
---@param color2 Color
---@param color3 Color
---@param color4 Color
---@param width integer
---@param height integer
---@return Color[]
export_colors.bi_interpol_colors = function(color1, color2, color3, color4, width, height)
   local x_step = 1 / (width + 1)
   local y_step = 1 / (height + 1)
   local col_arr = {}

   for y = 1, height, 1 do
      for x = 1, width, 1 do
         col_arr[#col_arr + 1] = export_colors.bilinear_colors(color1, color2, color3, color4, x * x_step, y * y_step)
      end
   end

   return col_arr
end

return export_colors
