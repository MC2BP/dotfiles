"auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plugin.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
  Plug 'scrooloose/NERDTree'        " source tree
  Plug 'jiangmiao/auto-pairs'       " add pairs
  Plug 'KaraMCC/vim-termtoggle'     " Terminal
  Plug 'tpope/vim-fugitive'         " Better git Support
  " Plug 'neovim/nvim-lspconfig'      " lsp nvim config 
  " Plug 'hrsh7th/nvim-compe'         " lsp completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
