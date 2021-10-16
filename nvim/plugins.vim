"auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plugin.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
	" Editor
	Plug 'jiangmiao/auto-pairs'       " adds pairs

	" Navigation
	Plug 'scrooloose/NERDTree' 		 " Directory Tree
	Plug 'junegunn/fzf.vim' 			 " File Search

	" Terminal 
	Plug 'KaraMCC/vim-termtoggle'     " Terminal

	" GIT
	Plug 'tpope/vim-fugitive' 			" Use git directly in vim through :G
	Plug 'airblade/vim-gitgutter' 	" Show added and removed lines

	" Programming 
	Plug 'mfussenegger/nvim-dap' 								" Debugger
	Plug 'rcarriga/nvim-dap-ui' 								" UI for Debbuger
	Plug 'neoclide/coc.nvim', {'branch': 'release'} 	" Autocompletion

	"LaTeX
	Plug 'conornewton/vim-latex-preview'	
call plug#end()
