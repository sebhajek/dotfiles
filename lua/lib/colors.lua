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
   local red_delta = (color1.red - color2.red)
   ---@type integer
   local green_delta = (color1.green - color2.green)
   ---@type integer
   local blue_delta = (color1.blue - color2.blue)

   for i = 0, n, 1 do
      local n_red = red_delta * step * i
      local n_green = green_delta * step * i
      local n_blue = blue_delta * step * i
      col_arr[#col_arr + 1] = export_colors.color_from_rgb(n_red, n_green, n_blue)
   end

   return col_arr
end


return export_colors
