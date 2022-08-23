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
--Fixes
map("", "f<space>", ":%s/	/  /g<CR>", opts) -- To replace tabs with 2 spaces
map("", "fs", ":syntax on<CR>", opts)        -- To enable syntax in html files within angular projects


------------------------------------------------------------------------------------------
--Fterm.nvim
------------------------------------------------------------------------------------------
local term = require("FTerm")
keymap.set('n', '<C-d>', function() term.toggle() end)
map('t', '<C-d>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)


------------------------------------------------------------------------------------------
--Telescope
------------------------------------------------------------------------------------------
local telescope = require("telescope.builtin")
keymap.set("n", "<C-p>", function() telescope.find_files() end, opts)
keymap.set("n", "<C-f>", function() telescope.live_grep() end, opts)

------------------------------------------------------------------------------------------
--LSP
------------------------------------------------------------------------------------------
--keybindings for LSP are in the lsp.vim file


------------------------------------------------------------------------------------------
--DAP
------------------------------------------------------------------------------------------
local dap = require("dap")
keymap.set("n", "<F1>", function() dap.terminate() end, opts)
keymap.set("n", "<F5>", function() dap.continue() end, opts)
keymap.set("n", "<F6>", function() dap.step_over() end, opts)
keymap.set("n", "<F7>", function() dap.step_into() end, opts)
keymap.set("n", "<F8>", function() dap.step_out() end, opts)
keymap.set("n", "<F9>", function() dap.toggle_breakpoint() end, opts)


------------------------------------------------------------------------------------------
--nvim-dap-ui
------------------------------------------------------------------------------------------
local dapui = require("dapui")
keymap.set("n", "<F4>", function() dapui.toggle() end, opts)

