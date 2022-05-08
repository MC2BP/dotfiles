" Startup optimizations
let g:do_filetype_lua = 1
let g:did_load_filetypes = 0

source $HOME/.config/nvim/plugins.vim
lua <<EOF
require('autocompletion')
require('debugger')
require('lines')
require('settings')
require('keybindings')
EOF
source $HOME/.config/nvim/neovide.vim
