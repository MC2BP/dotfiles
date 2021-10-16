syntax enable					" enable syntax highligting
set nowrap						" don't display long lines on multiple lines
set encoding=utf-8 			" set encoding
set ruler						" always show cursor position
set splitright					" Horizontal splits will automatically be to the right
set splitbelow  				" Vertical splits will always to the bottom
set t_Co=256					" Support 256 colors
set noexpandtab				" don't converts tabs to spaces
set tabstop=3					" 1 tab eq 4 spaces
set shiftwidth=3 				" I use an indent of 3, come fight me
set autoindent					" auto indentation
set noshowmode					" don't show stuff like -- INSERT --
set clipboard=unnamedplus	" Copy paste between nvim and everything else
set showmatch              " Show Matching parenthesis
set nu 							" Line numbers
set rnu 							" relative line numbers
set path+=** 					" for better file search
filetype plugin indent on 	
set signcolumn=yes:1 		" seperate column for signs
set foldmethod=indent 		" folding code sections
set foldenable 				" enable folding
set scrolloff=5 				" show next 5 lines

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


" NERDTree Settings
let NERDTreeQuitOnOpen=1
let NERDTreeMapOpenInTab='n'
nmap <C-b> :NERDTreeToggle<CR>
" for when i might switch over to the 'built in' exlorer
" nnoremap - :Lexplore<CR>
" let g:netrw_altv = 1
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_winsize = 25
" autocmd FileType netrw setl bufhidden=delete

" FZF
nnoremap <silent> <C-p> :Files <CR>

" ToggleTerm
nnoremap <silent> <C-d> :TermToggle <CR>    
tnoremap <silent> <C-d> <C-\><C-n>:TermToggle <CR>    
inoremap <silent> <C-d> <C-o>:TermToggle <CR>

" vim-gitgutter
let g:gitgutter_sign_removed = '-'
let g:gitgutter_map_keys = 0
hi GitGutterAdd		ctermfg=2
hi GitGutterChange 	ctermfg=3
hi GitGutterDelete 	ctermfg=1

" nvim-dap
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F6> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F7> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F8> :lua require'dap'.step_out()<CR>

nnoremap <silent> <F9> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <F4> :lua require'dapui'.toggle()<CR>

" COC
set completeopt=menuone,noselect
set completeopt=menu,menuone,noselect
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" LaTeX
let g:latex_pdf_viewer="mupdf"
" let g:letx_engine="pdflatex"
