" ----------------------------------------------------------------------------------------
" Neovim keybindings
" ----------------------------------------------------------------------------------------

" Splits
map <Space>v		:vsplit<CR>
map <Space>s		:split<CR>
map <Space>c		:resize +5<CR>
map <Space>t		:resize -5<CR>
map <Space>n		:vertical resize +5<CR>
map <Space>h		:vertical resize -5<CR>
" Split navigation
map <C-t>			<C-W><C-J>
map <C-c>			<C-W><C-K>
map <C-n>			<C-W><C-L>
map <C-h>			<C-W><C-H>

map Q <NOP>" Disable ex mode


" ----------------------------------------------------------------------------------------
" fzf.vim
" ----------------------------------------------------------------------------------------
nnoremap	<silent> <C-p>		:Files<CR>
nnoremap	<silent> <C-f>		:Ag<CR>


" ----------------------------------------------------------------------------------------
" Fterm.nvim
" ----------------------------------------------------------------------------------------
lua <<EOF
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<C-d>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<C-d>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
EOF


" ----------------------------------------------------------------------------------------
" LSP
" ----------------------------------------------------------------------------------------
" keybindings for LSP are in the lsp.vim file


" ----------------------------------------------------------------------------------------
" nvim-dap
" ----------------------------------------------------------------------------------------
nnoremap <silent> <F1> :lua require'dap'.terminate()<CR>
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F6> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F7> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F8> :lua require'dap'.step_out()<CR>
nnoremap <silent> <F9> :lua require'dap'.toggle_breakpoint()<CR>


" ----------------------------------------------------------------------------------------
" nvim-dap-ui
" ----------------------------------------------------------------------------------------
nnoremap <silent> <F4> :lua require'dapui'.toggle()<CR>
