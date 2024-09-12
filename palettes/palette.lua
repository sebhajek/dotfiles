---@class RGBColor
---@field red integer
---@field green integer
---@field blue integer

---@class PColor
---@field name string
---@field rgb RGBColor
---@field hex string

---@class Palette
---@field fg PColor
---@field bg PColor
---@field ansi PColor[]

---@param path_to_csv string
---@return Palette
local get_palette = function(path_to_csv)
	local palette_csv = io.open(path_to_csv, 'r')
	if palette_csv == nil then
		error 'no palette found'
	end
	_ = palette_csv:read 'l'

	local palette = {
		ansi = {},
	}
	for line in palette_csv:lines 'l' do
		local values = {}
		for substring in string.gmatch(line, '([^,]+)') do
			values[#values + 1] = substring
		end

		local name = string.lower(values[1])
		local color = {
			name = name,
			rgb = {
				red = values[2],
				green = values[3],
				blue = values[4],
			},
			hex = values[5],
		}

		if name == 'foreground' or name == 'background' then
			palette[name] = color
		else
			palette.ansi[#palette.ansi + 1] = color
		end
	end

	palette_csv:close()
	return palette
end

return { get_palette = get_palette }
