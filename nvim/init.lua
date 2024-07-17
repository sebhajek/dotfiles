--[ KEYBINDS ]--

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.hlsearch = true

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set({ 'i', 'v' }, '<S-Space>', "<Esc>")

--[ FONTS AND THEMES ]--

vim.g.have_nerd_font = false
vim.cmd.set('t_Co=16')
vim.cmd.colorscheme('dim')
vim.cmd.set('notermguicolors t_Co=16')


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
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.expandtab = true
vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3
vim.opt.formatoptions:append({ c = true, r = true, o = true, q = true })

vim.api.nvim_create_autocmd('TextYankPost', {
   desc = 'Highlight when yanking (copying) text',
   group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
   callback = function()
      vim.highlight.on_yank()
   end,
})


--[ INSTALL PLUGIN MANAGER ]--

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
   local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
   vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
   --{'tpope/vim-sleuth'},
   {
      'numToStr/Comment.nvim',
      opts = {}
   },
   {
      'lewis6991/gitsigns.nvim',
      opts = {
         signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
         },
      }
   },
   {
      'folke/which-key.nvim',
      event = 'VimEnter',
      config = function()
         require('which-key').setup()
         require('which-key').register {
            ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
            ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
            ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
            ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
            ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
            ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
            ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
         }
         require('which-key').register({
            ['<leader>h'] = { 'Git [H]unk' },
         }, { mode = 'v' })
      end,
   },
   {
      'nvim-telescope/telescope.nvim',
      event = 'VimEnter',
      branch = '0.1.x',
      dependencies = {
         'nvim-lua/plenary.nvim',
         {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
               return vim.fn.executable 'make' == 1
            end,
         },
         {
            'nvim-telescope/telescope-ui-select.nvim'
         },
         {
            'nvim-tree/nvim-web-devicons',
            enabled = vim.g.have_nerd_font
         },
      },
      config = function()
         --  :Telescope help_tags
         --  Two important keymaps to use while in Telescope are:
         --  - Insert mode: <c-/>
         --  - Normal mode: ?
         -- [[ Configure Telescope ]]
         -- See `:help telescope` and `:help telescope.setup()`
         require('telescope').setup {
            -- You can put your default mappings / updates / etc. in here
            --  All the info you're looking for is in `:help telescope.setup()`
            --
            -- defaults = {
            --   mappings = {
            --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
            --   },
            -- },
            -- pickers = {}
            extensions = {
               ['ui-select'] = {
                  require('telescope.themes').get_dropdown(),
               },
            },
         }

         pcall(require('telescope').load_extension, 'fzf')
         pcall(require('telescope').load_extension, 'ui-select')

         -- See `:help telescope.builtin`
         local builtin = require 'telescope.builtin'
         vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
         vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
         vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
         vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
         vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
         vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
         vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
         vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
         vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
         vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

         vim.keymap.set('n', '<leader>/', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
               --winblend = 10,
               previewer = false,
            })
         end, { desc = '[/] Fuzzily search in current buffer' })

         --  See `:help telescope.builtin.live_grep()` for information about particular keys
         vim.keymap.set('n', '<leader>s/', function()
            builtin.live_grep {
               grep_open_files = true,
               prompt_title = 'Live Grep in Open Files',
            }
         end, { desc = '[S]earch [/] in Open Files' })

         -- Shortcut for searching your Neovim configuration files
         vim.keymap.set('n', '<leader>sn', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
         end, { desc = '[S]earch [N]eovim files' })
      end,
   },
   {
      'neovim/nvim-lspconfig',
      dependencies = {
         {
            'williamboman/mason-lspconfig.nvim',
            dependencies = {
               {
                  'williamboman/mason.nvim',
                  config = true
               }
            },
            opts = {
               ensure_installed = {
                  'asm_lsp',
                  'autotools_ls',
                  'bashls',
                  'clangd',
                  'cssls',
                  'fennel_ls',
                  'gopls',
                  'glsl_analyzer',
                  'html',
                  'htmx',
                  'jdtls',
                  'jsonls',
                  'lua_ls',
                  'marksman',
                  'ocamllsp',
                  'ols',
                  'pyright',
                  'taplo',
                  'texlab',
                  'tsserver',
                  'wgsl_analyzer',
                  'yamlls',
               }
            }
         },
         {
            'WhoIsSethDaniel/mason-tool-installer.nvim'
         },
         {
            'j-hui/fidget.nvim',
            opts = {}
         },
         {
            'folke/neodev.nvim',
            opts = {}
         }
      },
      config = function()
         vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
            callback = function(event)
               local map = function(keys, func, desc)
                  vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
               end

               --  To jump back, press <C-t>.
               map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
               map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
               map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
               map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
               map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
               map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
               map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
               map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
               map('K', vim.lsp.buf.hover, 'Hover Documentation')
               map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

               local client = vim.lsp.get_client_by_id(event.data.client_id)
               if client and client.server_capabilities.documentHighlightProvider then
                  local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
                  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                     buffer = event.buf,
                     group = highlight_augroup,
                     callback = vim.lsp.buf.document_highlight,
                  })
                  vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                     buffer = event.buf,
                     group = highlight_augroup,
                     callback = vim.lsp.buf.clear_references,
                  })
                  vim.api.nvim_create_autocmd('LspDetach', {
                     group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                     callback = function(event2)
                        vim.lsp.buf.clear_references()
                        vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                     end,
                  })
               end

               if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
                  map('<leader>th', function()
                     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                  end, '[T]oggle Inlay [H]ints')
               end
            end
         })

         local capabilities = vim.lsp.protocol.make_client_capabilities()
         capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

         local servers = {
            asm_lsp = {
            },
            autotools_ls = {
            },
            bashls = {
            },
            clangd = {
            },
            cssls = {
            },
            fennel_ls = {
            },
            gopls = {
            },
            glsl_analyzer = {
            },
            html = {
            },
            htmx = {
            },
            jdtls = {
            },
            jsonls = {
            },
            lua_ls = {
               settings = {
                  Lua = {
                     completion = {
                        callSnippet = 'Replace'
                     },
                     diagnostics = {
                        disable = { 'missing-fields' }
                     }
                  }
               }
            },
            marksman = {
            },
            ocamllsp = {
            },
            ols = {
            },
            pyright = {
            },
            taplo = {
            },
            texlab = {
            },
            tsserver = {
            },
            wgsl_analyzer = {
            },
            yamlls = {
            },
         }

         require('mason').setup()

         local ensure_installed = vim.tbl_keys(servers or {})
         vim.list_extend(ensure_installed, {
            'stylua'
         })

         require('mason-tool-installer').setup { ensure_installed = ensure_installed }
         require('mason-lspconfig').setup {
            handlers = {
               function(server_name)
                  local server = servers[server_name] or {}
                  server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                  require('lspconfig')[server_name].setup(server)
               end
            }
         }
      end
   },
   {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {
         {
            'L3MON4D3/LuaSnip',
            build = (function()
               if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                  return
               end
               return 'make install_jsregexp'
            end)(),
            dependencies = {
               --    https://github.com/rafamadriz/friendly-snippets
               {
                  'rafamadriz/friendly-snippets',
                  config = function()
                     require('luasnip.loaders.from_vscode').lazy_load()
                  end,
               },
            },
         },
         {
            'saadparwaiz1/cmp_luasnip'
         },
         {
            'hrsh7th/cmp-nvim-lsp'
         },
         {
            'hrsh7th/cmp-path'
         },
      },
      config = function()
         -- See `:help cmp`
         local cmp = require 'cmp'
         local luasnip = require 'luasnip'
         luasnip.config.setup {}

         cmp.setup {
            snippet = {
               expand = function(args)
                  luasnip.lsp_expand(args.body)
               end,
            },
            completion = { completeopt = 'menu,menuone,noinsert' },

            mapping = cmp.mapping.preset.insert {
               ['<C-n>'] = cmp.mapping.select_next_item(),
               ['<C-p>'] = cmp.mapping.select_prev_item(),
               ['<C-b>'] = cmp.mapping.scroll_docs(-4),
               ['<C-f>'] = cmp.mapping.scroll_docs(4),
               ['<C-y>'] = cmp.mapping.confirm { select = true },
               ['<C-Space>'] = cmp.mapping.complete {},

               ['<C-l>'] = cmp.mapping(function()
                  if luasnip.expand_or_locally_jumpable() then
                     luasnip.expand_or_jump()
                  end
               end, { 'i', 's' }),
               ['<C-h>'] = cmp.mapping(function()
                  if luasnip.locally_jumpable(-1) then
                     luasnip.jump(-1)
                  end
               end, { 'i', 's' }),
               --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
            },
            sources = {
               { name = 'nvim_lsp' },
               { name = 'luasnip' },
               { name = 'path' },
            },
         }
      end,
   },
   {
      'stevearc/conform.nvim',
      lazy = false,
      keys = {
         {
            '<leader>f',
            function()
               require('conform').format { async = true, lsp_fallback = true }
            end,
            mode = '',
            desc = '[F]ormat buffer',
         }
      },
      opts = {
         notify_on_error = true,
         format_on_save = function(bufnr)
            local disable_filetypes = {
               c = true, cpp = true
            }
            return {
               timeout_ms = 800,
               lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype]
            }
         end
      }
   },
   {
      'folke/todo-comments.nvim',
      event = 'VimEnter',
      dependencies = {
         'nvim-lua/plenary.nvim'
      },
      opts = { signs = false }
   },
   {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      opts = {
         debounce = 100,
         indent = { char = '▕' },
         whitespace = { highlight = { "Whitespace", "NonText" } },
      }
   }
})

vim.cmd(':LspUninstall snyk_ls')
