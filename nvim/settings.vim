syntax enable				"enable syntax highligting
set nowrap					" don't display long lines on multiple lines
set encoding=utf-8
set ruler					" always show cursor position
set splitright				" Horizontal splits will automatically be to the right
set splitbelow  			" Vertical splits will always to the bottom
set t_Co=256				" Support 256 colors
set tabstop=4				" 1 tab eq 4 spaces
set expandtab				" converts tabs to spaces
set autoindent				" auto indentation
set noshowmode				" don't show stuff like -- INSERT --
set clipboard=unnamedplus	" Copy paste between nvim and everything else
set showmatch               " Show Matching parenthesis
set nu
set path+=**
filetype plugin indent on

colorscheme mc2bp
set autowrite

" Window Navigation
map <C-T> <C-W><C-J>
map <C-t> <C-W><C-J>
map <C-C> <C-W><C-K>
map <C-N> <C-W><C-L>
map <C-H> <C-W><C-H>

autocmd TermOpen * setlocal nonumber norelativenumber " automatically disable line numbers in terminal

set statusline=\ %f\ %y%=\ %p%%\ %l:%c\ \ \ 

" Golang Settings
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" NERDTree Settings
let NERDTreeQuitOnOpen=1
let NERDTreeMapOpenInTab='n'
nmap <C-b> :NERDTreeToggle<CR>

" ToggleTerm
nnoremap <silent> <C-d> :TermToggle <CR>    
tnoremap <silent> <C-d> <C-\><C-n>:TermToggle <CR>    
inoremap <silent> <C-d> <C-o>:TermToggle <CR>

