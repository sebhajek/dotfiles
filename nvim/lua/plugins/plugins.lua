return {
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		opts = {},
		config = function()
			local ibl = require 'ibl'
			ibl.setup {}
			ibl.overwrite {
				debounce = 256,
				indent = {
					char = '┆',
					tab_char = '┆',
				},
				whitespace = {
					highlight = { 'Whitespace', 'NonText' },
				},
			}
		end,
	},
	--[[{
		'echasnovski/mini.nvim',
		version = '*',
		config = function()
			require('mini.git').setup {}
			require('mini.diff').setup {}
			require('mini.statusline').setup {
				use_icons = false,
				content = {
					active = function()
						local mode, mode_hl = MiniStatusline.section_mode {
							trunc_width = 120,
						}
						local git = MiniStatusline.section_git {
							trunc_width = 40,
						}
						local filename = MiniStatusline.section_filename {
							trunc_width = 140,
						}
						local fileinfo = MiniStatusline.section_fileinfo {
							trunc_width = 120,
						}
						local location = MiniStatusline.section_location {
							trunc_width = 75,
						}

						local og_mode = vim.fn.mode()
						if og_mode == 'n' then
							mode = '-- NORMAL --'
						elseif og_mode == 'i' then
							mode = '-- INSERT --'
						elseif og_mode == 'v' then
							mode = '-- VISUAL --'
						elseif og_mode == 'r' or og_mode == 'R' then
							mode = '-- RPLACE --'
						elseif og_mode == 's' then
							mode = '-- SELECT --'
						elseif og_mode == 'V' then
							mode = '-- V-LINE --'
						elseif og_mode == '^V' then
							mode = '-- V-BLOK --'
						elseif og_mode == 'S' then
							mode = '-- S-LINE --'
						elseif og_mode == '^S' then
							mode = '-- S-BLOK --'
						elseif og_mode == 'ic' or og_mode == 'ix' then
							mode = '-- I-COMP --'
						else
							mode = '-- NORMAL --'
						end

						return MiniStatusline.combine_groups {
							{
								hl = mode_hl,
								strings = { mode },
							},
							'%<',
							{
								hl = 'MiniStatuslineDevinfo',
								strings = { git },
							},
							{
								hl = 'MiniStatuslineFilename',
								strings = { filename },
							},
							'%=',
							{
								hl = 'MiniStatuslineFileinfo',
								strings = { fileinfo },
							},
							{
								hl = mode_hl,
								strings = { location },
							},
						}
					end,
				},
			}
		end,
	},
	--]]
}
