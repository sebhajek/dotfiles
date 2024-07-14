local export_colors = {}

---@param color_code integer
---@return string
export_colors.ansi_fg_color_code = function(color_code)
   if color_code < 8 and color_code >= 0 then
      local ansi_code = 30 + color_code
      return '\27[' .. ansi_code .. 'm'
   else
      return '\27[38;5;' .. color_code .. 'm'
   end
   return export_colors.ansi_reset_code()
end

---@param color_code integer
---@return string
export_colors.ansi_bg_color_code = function(color_code)
   if color_code < 8 and color_code >= 0 then
      local ansi_code = 40 + color_code
      return '\27[' .. ansi_code .. 'm'
   else
      return '\27[48;5;' .. color_code .. 'm'
   end
   return export_colors.ansi_reset_code()
end

---@return string
export_colors.ansi_reset_code = function()
   return '\27[00m'
end

--print('This is red->' .. export_colors.ansi_fg_color_code(1) .. '■\n' .. export_colors.ansi_reset_code())
return export_colors
