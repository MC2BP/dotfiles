" Syntax 
syntax enable					" enable syntax highligting
filetype plugin indent on 	
set noexpandtab				" don't converts tabs to spaces
set tabstop=3					" 1 tab eq 3 spaces
set shiftwidth=3 				" I use an indent of 3, come fight me
set autoindent					" auto indentation
" Golang
let g:go_fold_enable = ['import']
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" UI
colorscheme mc2bp
set cursorline
set nowrap						" don't display long lines on multiple lines
set nu 							" Line numbers
set rnu 							" relative line numbers
set signcolumn=yes:1 		" seperate column for signs
set t_Co=256					" Support 256 colors
set showmatch              " Show Matching parenthesis
set foldmethod=indent 		" folding code sections
set foldlevel=99 				" sets the folds open by default
set scrolloff=5 				" show next 5 lines
set ruler						" always show cursor position
set noshowmode					" don't show stuff like -- INSERT --
autocmd FileType rust 		setlocal tabstop=3 shiftwidth=3 softtabstop=3
autocmd FileType go 			setlocal tabstop=3 shiftwidth=3 softtabstop=3
autocmd FileType vim 		setlocal tabstop=3 shiftwidth=3 softtabstop=3

" Splits and navigation
set splitright					" Horizontal splits will automatically be to the right
set splitbelow  				" Vertical splits will always to the bottom

" Other settings
set encoding=utf-8 			" set encoding
set clipboard=unnamedplus	" Copy paste between nvim and everything else
set noswapfile


" =====================================================================================
"    NerdTree
" =====================================================================================
let NERDTreeQuitOnOpen=1
let NERDTreeMapOpenInTab='n'
let NERDTreeShowHidden=1
nmap <C-b> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusIndicatorMapCustom = {
	 \ 'Modified'  :'~',
	 \ 'Staged'    :'✚',
	 \ 'Untracked' :' ',
	 \ 'Renamed'   :'~',
	 \ 'Unmerged'  :' ',
	 \ 'Deleted'   :'-',
	 \ 'Dirty'     :'~',
	 \ 'Ignored'   :' ',
	 \ 'Clean'     :' ',
	 \ 'Unknown'   :'?',
	 \ }


" =====================================================================================
"    Vim-GitGutter
" =====================================================================================
let g:gitgutter_sign_removed = '-'
let g:gitgutter_map_keys = 0
hi GitGutterAdd		ctermfg=2	guifg=#00c06f
hi GitGutterChange 	ctermfg=3	guifg=#e3e600
hi GitGutterDelete 	ctermfg=1	guifg=#db0726

" =====================================================================================
"    telescope
" =====================================================================================
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <C-f> <cmd>lua require('telescope.builtin').live_grep()<cr>

" =====================================================================================
"    LaTeX
" =====================================================================================
let g:latex_pdf_viewer="mupdf"

" =====================================================================================
"    vim-rainbowbrackets
" =====================================================================================
let g:rainbowbrackets_colors =
	\ [
	\   'ctermfg=87	guifg=#5fffff',
	\   'ctermfg=5		guifg=#ff69ff',
	\   'ctermfg=226	guifg=#ffff00',
	\   'ctermfg=112	guifg=#87d700'
	\ ]
let g:rainbowbrackets_enable_round_brackets = 1
let g:rainbowbrackets_enable_curly_brackets = 1
let g:rainbowbrackets_enable_square_brackets = 1
let g:rainbowbrackets_enable_angle_brackets = 0


