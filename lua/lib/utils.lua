local export_utils = {}

---@param txt string | integer
---@param n integer
---@return string
export_utils.prepend_zeroes = function(txt, n)
   if not (type(txt) == "string") then
      txt = tostring(txt)
   end
   while #txt < n do
      txt = '0' .. txt
   end
   return txt
end

---@param txt any
---@param n integer
---@return string
export_utils.prepend_spaces = function(txt, n)
   if not (type(txt) == "string") then
      txt = tostring(txt)
   end
   while #txt < n do
      txt = ' ' .. txt
   end
   return txt
end

return export_utils
