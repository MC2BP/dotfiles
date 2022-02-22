source $HOME/.config/nvim/plugins.vim
lua <<EOF
require('autocompletion')
require('debugger')
require('lines')
require('settings')
require('keybindings')
EOF
