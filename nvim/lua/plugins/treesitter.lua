return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		local configs = require 'nvim-treesitter.configs'

		configs.setup {
			ensure_installed = {
				'c',
				'lua',
				'vim',
				'html',
				'markdown',
				'bash',
				'json',
				'latex',
				'luadoc',
				'markdown_inline',
				'mermaid',
				'sql',
				'toml',
				'tsv',
				'csv',
				'xml',
				'css',
				'comment',
				'asm',
				'javascript',
				'php',
				'scala',
				'rust',
				'haskell',
				'ocaml',
				'clojure',
				'java',
				'odin',
				'pascal',
			},
			sync_install = false,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		}
	end,
}
