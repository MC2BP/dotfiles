--Syntax
vim.o.syntax = "enable"
vim.o.expandtab = false
vim.cmd('colorscheme mc2bp')
vim.cmd('filetype plugin indent on')
vim.o.tabstop = 3
vim.o.shiftwidth = 3
vim.cmd('autocmd FileType rust,go.vim              setlocal tabstop=3 shiftwidth=3 softtabstop=3')
vim.cmd('autocmd FileType typescript,html,css,json setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2')
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

--Splits
vim.o.splitright = true
vim.o.splitbelow = true

--Other
vim.o.encoding = "utf8"
vim.o.clipboard = "unnamedplus"
vim.o.swapfile = false


------------------------------------------------------------------------------------------
--autopairs
------------------------------------------------------------------------------------------
require('nvim-autopairs').setup{}


------------------------------------------------------------------------------------------
--NerdTree
------------------------------------------------------------------------------------------
require'nvim-tree'.setup{
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
		hide_root_folder = true,
		side = 'left',
		auto_resize = false,
		mappings = {
			custom_only = true,
			list = {
				-- Opening
				{ key = "<CR>",	action = "edit" },
				{ key = "s",		action = "vsplit" },
				{ key = "i",		action = "split" },
				{ key = "n",		action = "tabnew" },
				{ key = "<Tab>",  action = "preview" },
				-- File manipulation
				{ key = "a",		action = "create" },
				{ key = "d",		action = "remove" },
				{ key = "r",		action = "rename" },
				{ key = "x",      action = "cut" },
				{ key = "c",		action = "copy" },
				{ key = "p",		action = "paste" },
				-- other
				{ key = "Y",		action = "copy_path" },
				{ key = "R",		action = "refresh" },
				{ key = "<BS>",	action = "close_node" },
			},
		},
		number = false,
		relativenumber = false,
		signcolumn = "yes"
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
}

local map = vim.api.nvim_set_keymap
local opt = {
	noremap = true,
	silent = true,
}
map("n", "<C-b>", ":NvimTreeToggle<CR>", opt)

------------------------------------------------------------------------------------------
--workspaces.nvim
------------------------------------------------------------------------------------------
require("workspaces").setup({
	hooks = {
		open = { "NvimTreeOpen" },
	}
})


------------------------------------------------------------------------------------------
--Vim-GitGutter
------------------------------------------------------------------------------------------
vim.g['gitgutter_sign_removed'] = '-'
vim.g['gitgutter_map_keys'] = 0


------------------------------------------------------------------------------------------
--LaTeX
------------------------------------------------------------------------------------------
vim.g['latex_pdf_viewer'] = "mupdf"

------------------------------------------------------------------------------------------
--vim-rainbowbrackets
------------------------------------------------------------------------------------------
vim.g['rainbowbrackets_colors'] = {
	"ctermfg=87		guifg=#5fffff",
	"ctermfg=5		guifg=#ff69ff",
	"ctermfg=226	guifg=#ffff00",
	"ctermfg=112	guifg=#87d700",
}
vim.g['rainbowbrackets_enable_round_brackets'] = 1
vim.g['rainbowbrackets_enable_curly_brackets'] = 1
vim.g['rainbowbrackets_enable_square_brackets'] = 1
vim.g['rainbowbrackets_enable_angle_brackets'] = 1

