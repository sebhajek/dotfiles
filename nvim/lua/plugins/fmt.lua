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
					'clang-format',
					'prettier',
					'sql-formatter',
					'xmlformatter',
				},
			}
		end,
		dependencties = {},
	},
	{ -- Autoformat
		'stevearc/conform.nvim',
		event = { 'BufWritePre', 'BufReadPre', 'BufNewFile' },
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
				markdown = {
					'injected',
					'markdown-toc',
					--"mdslw",
					'mdformat',
				},
				-- Conform can also run multiple formatters sequentially
				python = {
					'autopep8',
					'docformatter',
					'isort',
					'autoflake',
					'black',
				},
				c = {
					'custom-clang-format',
					'clang-format',
					stop_after_first = true,
				},
				cpp = {
					'custom-clang-format',
					'clang-format',
					stop_after_first = true,
				},
				html = { 'prettier', stop_after_first = true },
				javascript = { 'prettier', stop_after_first = true },
				css = { 'prettier', stop_after_first = true },
				json = { 'prettier', stop_after_first = true },
				less = { 'prettier', stop_after_first = true },
				xml = { 'xmlformat' },
				sql = { 'custom-sql-formatter' },
				java = {
					'custom-clang-format',
					'clang-format',
					stop_after_first = true,
				},
				-- You can use 'stop_after_first' to run the first available formatter from the list
				-- javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			formatters = {
				['black'] = {
					prepend_args = { '--fast' },
				},
				['custom-clang-format'] = {
					command = 'clang-format',
					args = '-style="{BasedOnStyle: llvm, IndentWidth: 4, UseTab: Always, TabWidth: 4, BreakBeforeBraces: Custom, BraceWrapping: { AfterClass: true, AfterControlStatement: false, AfterFunction: true, AfterNamespace: true, AfterStruct: true, BeforeElse: false, BeforeCatch: false, IndentBraces: false }, AlwaysBreakAfterReturnType: All, ColumnLimit: 160, AlignConsecutiveDeclarations: true, AlignConsecutiveAssignments: true}"',
				},
				['clang-format'] = {
					prepend_args = { '-style=gnu' },
				},
				['prettier'] = {
					prepend_args = {
						'--use-tabs',
						'--tab-width=4',
						'--quote-props=consistent',
						'--single-attribute-per-line',
					},
					args = function(self, ctx)
						if string.match(ctx.filename, '%.html$') then
							return {
								'--stdin-filepath',
								'$FILENAME',
								'--parser',
								'html',
							}
						end
						return { '--stdin-filepath', '$FILENAME' }
					end,
					ft_parsers = {
						javascript = 'babel',
						css = 'css',
						less = 'less',
						html = 'html',
						json = 'json',
						jsonc = 'json',
						yaml = 'yaml',
						markdown = 'markdown',
					},
				},
				['custom-sql-formatter'] = {
					command = 'sql-formatter',
					args = {
						'',
						'-c{"tabWidth":8,"useTabs":"true","keywordCase":"upper","dataTypeCase":"upper","functionCase":"upper","identifierCase":"preserve" ,"linesBetweenQueries":2,"expressionWidth":48,"newlineBeforeSemicolon":"false"}',
						'-lmariadb',
					},
				},
			},
		},
	},
}
