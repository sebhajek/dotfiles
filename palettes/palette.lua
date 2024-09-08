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

---@type table<string, Palette>
local palettes = {

	['oxoargon'] = {

		['fg'] = {
			name = 'foreground',
			rgb = { red = 242, green = 244, blue = 248 },
			hex = '#f2f4f8',
		},

		['bg'] = {
			name = 'background',
			rgb = { red = 0, green = 0, blue = 0 },
			hex = '#000000',
		},

		ansi = {
			[0] = {
				name = 'regular black',
				rgb = { red = 22, green = 22, blue = 22 },
				hex = '#161616',
			},

			[1] = {
				name = 'regular red',
				rgb = { red = 238, green = 83, blue = 150 },
				hex = '#ee5396',
			},

			[2] = {
				name = 'regular green',
				rgb = { red = 55, green = 79, blue = 73 },
				hex = '#374f49',
			},

			[3] = {
				name = 'regular yellow',
				rgb = { red = 255, green = 111, blue = 0 },
				hex = '#ff6f00',
			},

			[4] = {
				name = 'regular blue',
				rgb = { red = 51, green = 177, blue = 255 },
				hex = '#33b1ff',
			},

			[5] = {
				name = 'regular magenta',
				rgb = { red = 103, green = 58, blue = 183 },
				hex = '#673ab7',
			},

			[6] = {
				name = 'regular cyan',
				rgb = { red = 8, green = 189, blue = 186 },
				hex = '#08bdba',
			},

			[7] = {
				name = 'regular white',
				rgb = { red = 144, green = 164, blue = 174 },
				hex = '#90a4ae',
			},

			[8] = {
				name = 'bright black',
				rgb = { red = 57, green = 57, blue = 57 },
				hex = '#393939',
			},

			[9] = {
				name = 'bright red',
				rgb = { red = 255, green = 126, blue = 182 },
				hex = '#ff7eb6',
			},

			[10] = {
				name = 'bright green',
				rgb = { red = 66, green = 190, blue = 101 },
				hex = '#42be65',
			},

			[11] = {
				name = 'bright yellow',
				rgb = { red = 255, green = 171, blue = 145 },
				hex = '#ffab91',
			},

			[12] = {
				name = 'bright blue',
				rgb = { red = 120, green = 169, blue = 255 },
				hex = '#78a9ff',
			},

			[13] = {
				name = 'bright magenta',
				rgb = { red = 190, green = 149, blue = 255 },
				hex = '#be95ff',
			},

			[14] = {
				name = 'bright cyan',
				rgb = { red = 61, green = 219, blue = 217 },
				hex = '#3ddbd9',
			},

			[15] = {
				name = 'bright white',
				rgb = { red = 221, green = 225, blue = 230 },
				hex = '#dde1e6',
			},
		},
	},
}

return palettes
