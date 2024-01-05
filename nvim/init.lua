-- General Settings
vim.o.syntax = "enable"
vim.o.expandtab = false
vim.cmd('colorscheme mc2bp')
vim.cmd('filetype plugin indent on')
vim.o.tabstop = 3
vim.o.shiftwidth = 3
vim.cmd('autocmd FileType rust,go.vim,c setlocal tabstop=3 shiftwidth=3 softtabstop=3')
vim.cmd('autocmd FileType typescript,html,css,json,haskell setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2')
vim.cmd('au BufNewFile,BufRead,BufReadPost *.typ set syntax=typst')
vim.o.autoindent = true
vim.o.cursorline = true
vim.o.wrap = false
vim.o.nu = true
vim.o.rnu = true
vim.o.signcolumn = "auto:1"
vim.o.showmatch = true
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
vim.o.scrolloff = 5
vim.o.ruler = true
vim.o.showmode = false
vim.o.colorcolumn="120"
vim.o.cmdheight=0

vim.cmd('au BufNewFile,BufRead *.wgsl set filetype=wgsl')
vim.cmd('au BufNewFile,BufRead *.typ set filetype=typst')
vim.cmd('au BufNewFile,BufRead *.typst set filetype=typst')

--Golang
vim.g['go_fold_enable'] = {'import'}
vim.g['go_highlight_extra_types'] = 1
vim.g['go_highlight_operators'] = 1
vim.g['go_highlight_extra_types'] = 1
vim.g['go_highlight_functions'] = 1
vim.g['go_highlight_function_parameters'] = 1
vim.g['go_highlight_function_calls'] = 1
vim.g['go_highlight_types'] = 1
vim.g['go_highlight_fields'] = 1
vim.g['go_highlight_format_strings'] = 1
vim.g['go_highlight_variable_declarations'] = 1
vim.g['go_highlight_variable_assignments'] = 1

-- Keybindings
local keymap = vim.keymap
local map = vim.api.nvim_set_keymap
local opts = { 
	noremap = true, 
	silent = true
}
--Splits
map("", "<Space>s", ":vsplit<CR>", opts)
map("", "<Space>i", ":split<CR>", opts)
map("", "<Space>c", ":resize +5<CR>", opts)
map("", "<Space>t", ":resize -5<CR>", opts)
map("", "<Space>n", ":vertical resize +5<CR>", opts)
map("", "<Space>h", ":vertical resize -5<CR>", opts)
--Split navigation
map("", "<C-t>", "<C-W><C-J>", opts)
map("", "<C-c>", "<C-W><C-K>", opts)
map("", "<C-n>", "<C-W><C-L>", opts)
map("", "<C-h>", "<C-W><C-H>", opts)
--Split movement
map("", "<Space><C-t>", "<C-W>J", opts)
map("", "<Space><C-c>", "<C-W>K", opts)
map("", "<Space><C-n>", "<C-W>L", opts)
map("", "<Space><C-h>", "<C-W>H", opts)
--Other
map("", "Q", "<NOP>", opts)
map("", "<C-a>", "<C-d>", opts)

--Splits
vim.o.splitright = true
vim.o.splitbelow = true

--Other
vim.o.encoding = "utf8"
vim.o.clipboard = "unnamedplus"
vim.o.swapfile = false
vim.o.autoread = true

-- Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

plugins = {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}
	},
	-- Navigation
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {
				update_cwd = true,
				filters = {
					dotfiles = true,
				},
				git = {
					enable = true,
					ignore = true,
					timeout = 500,
				},
				view = {
					width = 45,
					side = 'left',
					adaptive_size = true,
					number = false,
					relativenumber = false,
					signcolumn = "yes"
				},
				renderer = {
					root_folder_label = false
				},
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
			}
			map("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
		end,
	},    
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.4",
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function() 
			local telescope = require("telescope.builtin")
			keymap.set("n", "<C-p>", function() telescope.find_files() end, opts)
			keymap.set("n", "<C-f>", function() telescope.live_grep() end, opts)
		end,
	},
	-- Terminal
	{
		"numToStr/FTerm.nvim",
		config = function()
			local term = require("FTerm")
			keymap.set('n', '<C-d>', function() term.toggle() end)
			keymap.set('t', '<C-d>', function() term.toggle() end)
		end,
	},
	-- Git
	{
		"lewis6991/gitsigns.nvim", tag = "v0.7",
		config = function() 
			require('gitsigns').setup {
			  attach_to_untracked = true,
			  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			  current_line_blame_opts = {
				 virt_text = true,
				 virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
				 delay = 1000,
				 ignore_whitespace = false,
			  },
			  signs = {
				 add          = { text = '+' },
				 change       = { text = '~' },
				 delete       = { text = '_' },
				 topdelete    = { text = '‾' },
				 changedelete = { text = '~' },
				 untracked    = { text = '┆' },
			  },
			  max_file_length = 40000, -- Disable if file is longer than this (in lines)
			}
		end,
	},
	{
		"f-person/git-blame.nvim"
	},
	-- Syntax
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
		config = function()
			require'nvim-treesitter.configs'.setup {
				ensure_installed = { 
					"json", "yaml", "toml", "gitignore", -- config / data files
					"go", "gomod", "rust", "wgsl", "lua", "typescript", "javascript", "regex", "bash", "c", "cpp", "java", -- programming languages
					"markdown", "latex", "html", "css" -- documents
				},
				sync_install = false,
				auto_install = true, -- Automatically install missing parsers when entering buffer

				highlight = { 
					enable = true, 
					disable = {"typ"},
					additional_vim_regex_highlighting = false,
				},
			}
		end,
	},
	{
		"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
		config = function() 
			local rainbow_delimiters = require 'rainbow-delimiters'
			vim.g.rainbow_delimiters = {
				strategy = {
					[''] = rainbow_delimiters.strategy["global"],
					vim = rainbow_delimiters.strategy["local"],
				},
				query = {
					[''] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
				highlight = {
					"RainbowDelimiterYellow",
					"RainbowDelimiterViolet",
					"RainbowDelimiterBlue",
					"RainbowDelimiterGreen",
				},
			}
		end,
	},
	-- lsp
	require("lsp"),
	require("debugger"),
}

require("lazy").setup(plugins, {})
require("lines")
vim.cmd("source $HOME/.config/nvim/neovide.vim")
