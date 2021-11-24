"auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plugin.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
	" Editor
	Plug 'jiangmiao/auto-pairs'      " adds pairs

	" Navigation
	Plug 'scrooloose/NERDTree' |
		\ Plug 'Xuyuanp/nerdtree-git-plugin' |	
		\ Plug 'ryanoasis/vim-devicons' 			" File explorer with git integration and icons
	Plug 'junegunn/fzf.vim' 			 			" File Search

	" Terminal 
	Plug 'numToStr/FTerm.nvim' 		" Popup terminal

	" GIT
	Plug 'tpope/vim-fugitive' 				" Git integration
	Plug 'airblade/vim-gitgutter' 		" Show added and removed lines

	" Programming 
	Plug 'mfussenegger/nvim-dap' 								" Debugger
	Plug 'rcarriga/nvim-dap-ui' 								" UI for Debbuger
	Plug 'neoclide/coc.nvim', {'branch': 'release'} 	" Autocompletion
	Plug 'sheerun/vim-polyglot' 								" Improved syntax highliting
	Plug 'eiiches/vim-rainbowbrackets' 					" Rainbow parenthesis

	"LaTeX
	Plug 'conornewton/vim-latex-preview'	
call plug#end()
