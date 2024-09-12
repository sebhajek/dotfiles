return {
	{
		'williamboman/mason.nvim',
		dependencies = {
			'WhoIsSethDaniel/mason-tool-installer.nvim',
		},
		config = function() end,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = {
			{
				'williamboman/mason.nvim',
				config = true,
			},
			{
				'folke/neodev.nvim',
				opts = {},
			},
		},
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{
				'williamboman/mason.nvim',
				config = true,
			},
			'williamboman/mason-lspconfig.nvim',
			'WhoIsSethDaniel/mason-tool-installer.nvim',
		},
		config = function()
			require('mason').setup()

			require('mason-lspconfig').setup {
				ensure_installed = {
					'lua_ls',
					'clangd',
					'harper_ls',
					'texlab',
					'vimls',
					'autotools_ls',
					'bashls',
					'typos_lsp',
					'ruff',
					'basedpyright',
				},
			}

			local lspconfig = require 'lspconfig'

			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			lspconfig.lua_ls.setup {
				capabilities = capabilities,
			}
			lspconfig.bashls.setup {
				filetypes = { 'sh', 'bash' },
				settings = {
					bashIde = {
						globPattern = '*@(.sh|.inc|.bash|.command|.fish)',
					},
				},
				capabilities = capabilities,
			}
			lspconfig.clangd.setup {
				capabilities = capabilities,
			}
			lspconfig.vimls.setup {}
			lspconfig.typos_lsp.setup {}
			lspconfig.texlab.setup {
				capabilities = capabilities,
			}
			lspconfig.autotools_ls.setup {
				root_dir = function(fname)
					return lspconfig.util.root_pattern(
						'configure.ac',
						'Makefile',
						'Makefile.am',
						'*.mk',
						'makefile'
					)(fname) or lspconfig.util.find_git_ancestor(fname)
				end,
			}
			lspconfig.ruff.setup {
				capabilities = capabilities,
			}
			lspconfig.basedpyright.setup {
				pyright = {
					disableOrganizeImports = true,
				},
				basedpyright = {
					analysis = {
						typeCheckingMode = 'none',
					},
				},
			}
			lspconfig.harper_ls.setup {
				['harper-ls'] = {
					linters = {
						long_sentences = false,
						repeated_words = false,
					},
					codeActions = {
						forceStable = true,
					},
				},
				filetypes = {
					'bib',
					'gitcommit',
					'markdown',
					'org',
					'plaintex',
					'rst',
					'rnoweb',
					'tex',
					'pandoc',
					'quarto',
					'rmd',
					'context',
					'html',
					'xhtml',
					'mail',
					'text',
					'latex',
					'texinfo',
				},
			}

			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
			vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, {})
			vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
			vim.keymap.set(
				{ 'n', 'v' },
				'<leader>ca',
				vim.lsp.buf.code_action,
				{}
			)
		end,
	},
}
