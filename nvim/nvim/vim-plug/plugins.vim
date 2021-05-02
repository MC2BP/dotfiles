"auto-install vim-plug"
if empty(glob('~/.config/nvim/autoload/plugin.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
  Plug 'sheerun/vim-polyglot'
  Plug 'scrooloose/NERDTree'
  Plug 'jiangmiao/auto-pairs'
  Plug 'fatih/vim-go'
  Plug 'rust-lang/rust.vim'
  Plug 'ycm-core/YouCompleteMe'
  Plug 'KaraMCC/vim-termtoggle'
  Plug 'tpope/vim-fugitive'

call plug#end()
