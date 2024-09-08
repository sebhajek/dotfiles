local palette = require('palette')['oxoargon']

local CELL_SIZE = 16 * 4
local TEXT_SIZE = 8 * 4
local BORDER_SIZE = 8 * 4

---@param color PColor
---@return string
local color_tostring = function(color)
	return 'rgb('
		.. tostring(color.rgb.red)
		.. ','
		.. tostring(color.rgb.green)
		.. ','
		.. tostring(color.rgb.blue)
		.. ')'
end

---@param height number
---@param width number
---@param x number
---@param y number
---@param color PColor
---@param r number
---@return string
local svg_square = function(height, width, x, y, color, r)
	return '<rect width="'
		.. tostring(width)
		.. '" height="'
		.. tostring(height)
		.. '" x="'
		.. tostring(x)
		.. '" y="'
		.. tostring(y)
		.. '" rx="'
		.. tostring(r)
		.. '" ry="'
		.. tostring(r)
		.. '" fill="'
		.. color_tostring(color)
		.. '" />\n'
end

---@param fg_color PColor
---@param bg_color PColor
---@param ansi_colors PColor[]
---@return string
local svg_wrap = function(fg_color, bg_color, ansi_colors)
	local svg_height = BORDER_SIZE
		+ CELL_SIZE
		+ BORDER_SIZE
		+ CELL_SIZE
		+ BORDER_SIZE
	local svg_width = BORDER_SIZE + 8 * (BORDER_SIZE + CELL_SIZE)

	local svg_content = svg_square(svg_height, svg_width, 0, 0, bg_color, 0)

	for k, v in pairs(ansi_colors) do
		svg_content = svg_content
			.. svg_square(
				CELL_SIZE,
				CELL_SIZE,
				((BORDER_SIZE + (k * BORDER_SIZE)) + (k * CELL_SIZE))
					% (svg_width - BORDER_SIZE),
				BORDER_SIZE + (math.floor(k / 8) * (BORDER_SIZE + CELL_SIZE)),
				v,
				4
			)
	end

	return '<svg width="'
		.. tostring(svg_width)
		.. '" height="'
		.. tostring(svg_height)
		.. '" xmlns="http://www.w3.org/2000/svg">\n'
		.. svg_content
		.. '</svg>'
end

local main = function()
	local svg_file = io.open('./palette.svg', 'w+')
	io.output(svg_file)

	local file_str = svg_wrap(palette['fg'], palette['bg'], palette['ansi'])
	print(file_str)
	io.write(file_str)
	io.close(svg_file)
end
return main()
