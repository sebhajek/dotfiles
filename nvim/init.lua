--[ KEYBINDS ]--

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.hlsearch = true

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set(
	't',
	'<Esc><Esc>',
	'<C-\\><C-n>',
	{ desc = 'Exit terminal mode' }
)
vim.keymap.set(
	'n',
	'<C-h>',
	'<C-w><C-h>',
	{ desc = 'Move focus to the left window' }
)
vim.keymap.set(
	'n',
	'<C-l>',
	'<C-w><C-l>',
	{ desc = 'Move focus to the right window' }
)
vim.keymap.set(
	'n',
	'<C-j>',
	'<C-w><C-j>',
	{ desc = 'Move focus to the lower window' }
)
vim.keymap.set(
	'n',
	'<C-k>',
	'<C-w><C-k>',
	{ desc = 'Move focus to the upper window' }
)

--[ FONTS AND THEMES ]--

vim.g.have_nerd_font = false
vim.cmd.set 't_Co=16'
vim.cmd.colorscheme 'oxoargon'
vim.cmd.set 'notermguicolors t_Co=16'

--[ UI ELEMENTS ]--

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.breakindent = true
vim.opt.signcolumn = 'yes'

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'
vim.opt.list = true

vim.opt.listchars = {
	tab = '| ',
	trail = '.',
	space = '·',
	extends = '❱',
	precedes = '❰',
}

vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.formatoptions:append { c = true, r = true, o = true, q = true }

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup(
		'kickstart-highlight-yank',
		{ clear = true }
	),
	callback = function()
		vim.highlight.on_yank()
	end,
})

--[ PLUGINS ]--
require 'config.lazy'
