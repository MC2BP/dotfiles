local map = vim.api.nvim_set_keymap
local opts = { 
	noremap = true, 
	silent = true
}

--Splits
map("", "<Space>v", ":vsplit<CR>", opts)
map("", "<Space>s", ":split<CR>", opts)
map("", "<Space>c", ":resize +5<CR>", opts)
map("", "<Space>t", ":resize -5<CR>", opts)
map("", "<Space>n", ":vertical resize +5<CR>", opts)
map("", "<Space>h", ":vertical resize -5<CR>", opts)
--Split navigation
map("", "<C-t>", "<C-W><C-J>", opts)
map("", "<C-c>", "<C-W><C-K>", opts)
map("", "<C-n>", "<C-W><C-L>", opts)
map("", "<C-h>", "<C-W><C-H>", opts)
--Other
map("", "Q", "<NOP>", opts)


------------------------------------------------------------------------------------------
--Fterm.nvim
------------------------------------------------------------------------------------------
map('n', '<C-d>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<C-d>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)


------------------------------------------------------------------------------------------
--Telescope
------------------------------------------------------------------------------------------
map("n", "<C-p>", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
map("n", "<C-f>", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)


------------------------------------------------------------------------------------------
--NerdTree
------------------------------------------------------------------------------------------
map("n", "<C-b>", ":NvimTreeToggle<CR>", opts)


------------------------------------------------------------------------------------------
--LSP
------------------------------------------------------------------------------------------
--keybindings for LSP are in the lsp.vim file


------------------------------------------------------------------------------------------
--DAP
------------------------------------------------------------------------------------------
map("n", "<F1>", "<cmd>lua require'dap'.terminate()<CR>", opts)
map("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)
map("n", "<F6>", "<cmd>lua require'dap'.step_over()<CR>", opts)
map("n", "<F7>", "<cmd>lua require'dap'.step_into()<CR>", opts)
map("n", "<F8>", "<cmd>lua require'dap'.step_out()<CR>", opts)
map("n", "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)


------------------------------------------------------------------------------------------
--nvim-dap-ui
------------------------------------------------------------------------------------------
map("n", "<F4>", "<cmd>lua require'dapui'.toggle()<CR>", opts)
