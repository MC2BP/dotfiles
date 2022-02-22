"auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plugin.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')

	" Editor
	Plug 'jiangmiao/auto-pairs'      " adds pairs
	Plug 'ryanoasis/vim-devicons' 	" nice file icons

	" Syntax
	Plug 'eiiches/vim-rainbowbrackets' 		" Rainbow parenthesis

	" Navigation
	Plug 'kyazdani42/nvim-web-devicons' " for file icons
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'natecraddock/workspaces.nvim'

	" Terminal 
	Plug 'numToStr/FTerm.nvim' 		" Popup terminal

	" GIT
	Plug 'tpope/vim-fugitive' 				" Git integration
	Plug 'airblade/vim-gitgutter' 		" Show added and removed lines

	" LSP
	Plug 'neovim/nvim-lspconfig'				" lsp
	Plug 'hrsh7th/cmp-nvim-lsp'				" lsp source
	Plug 'uga-rosa/cmp-dictionary'			" dictionary source
	Plug 'hrsh7th/nvim-cmp'						" autocompletion
	Plug 'hrsh7th/cmp-path'						" file path autocompletion

	" DAP
	Plug 'mfussenegger/nvim-dap'				" Debugger
	Plug 'rcarriga/nvim-dap-ui'				" UI for Debbuger

	"LaTeX
	Plug 'conornewton/vim-latex-preview'	

call plug#end()
