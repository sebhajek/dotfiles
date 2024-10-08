return {
	{
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		config = function()
			require('mason-tool-installer').setup {
				ensure_installed = {
					'stylua',
					'shfmt',
					'markdown-toc',
					'mdslw',
					'mdformat',
					'beautysh',
					'autopep8',
					'autoflake',
					'isort',
					'docformatter',
					'black',
				},
			}
		end,
		dependencties = {},
	},
	{ -- Autoformat
		'stevearc/conform.nvim',
		event = { 'BufWritePre' },
		cmd = { 'ConformInfo' },
		keys = {
			{
				'<leader>ft',
				function()
					require('conform').format {
						async = true,
						lsp_format = 'fallback',
					}
				end,
				mode = 'n',
				desc = '[F]ormat buffer',
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				local lsp_format_opt
				if disable_filetypes[vim.bo[bufnr].filetype] then
					lsp_format_opt = 'never'
				else
					lsp_format_opt = 'fallback'
				end
				return {
					timeout_ms = 8000,
					lsp_format = lsp_format_opt,
				}
			end,
			formatters_by_ft = {
				lua = { 'stylua' },
				bash = { 'beautysh', 'shfmt' },
				makefile = { 'injected' },
				markdown = { 'injected', 'markdown-toc', 'mdslw', 'mdformat' },
				-- Conform can also run multiple formatters sequentially
				python = {
					'autopep8',
					'docformatter',
					'isort',
					'autoflake',
					'black',
				},
				--
				-- You can use 'stop_after_first' to run the first available formatter from the list
				-- javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			formatters = {
				black = {
					prepend_args = { '--fast' },
				},
			},
		},
	},
}
