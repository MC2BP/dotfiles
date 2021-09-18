syntax enable				"enable syntax highligting
set nowrap					" don't display long lines on multiple lines
set encoding=utf-8
set ruler					" always show cursor position
set splitright				" Horizontal splits will automatically be to the right
set splitbelow  			" Vertical splits will always to the bottom
set t_Co=256				" Support 256 colors
set noexpandtab			" don't converts tabs to spaces
set tabstop=3				" 1 tab eq 4 spaces
set shiftwidth=3
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

" --------
" COC
" --------
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
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

" NERDTree Settings
let NERDTreeQuitOnOpen=1
let NERDTreeMapOpenInTab='n'
nmap <C-b> :NERDTreeToggle<CR>

" ToggleTerm
nnoremap <silent> <C-d> :TermToggle <CR>    
tnoremap <silent> <C-d> <C-\><C-n>:TermToggle <CR>    
inoremap <silent> <C-d> <C-o>:TermToggle <CR>

" Autocompletion settings
set completeopt=menuone,noselect
set completeopt=menu,menuone,noselect

" Golang Settings
" let g:go_highlight_function_calls = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_types = 1
" let g:go_highlight_variable_declarations = 1
" let g:go_highlight_variable_assignments = 1

" let g:compe = {}
" let g:compe.enabled = v:true
" let g:compe.autocomplete = v:true
" let g:compe.debug = v:false
" let g:compe.min_length = 1
" let g:compe.preselect = 'enable'
" let g:compe.throttle_time = 80
" let g:compe.source_timeout = 200
" let g:compe.incomplete_delay = 200
" let g:compe.max_abbr_width = 100
" let g:compe.max_kind_width = 100
" let g:compe.max_menu_width = 100
" let g:compe.documentation = v:true

" let g:compe.source = {}
" let g:compe.source.path = v:true
" let g:compe.source.buffer = v:true
" let g:compe.source.calc = v:true
" let g:compe.source.nvim_lsp = v:true
" let g:compe.source.nvim_lua = v:true
" let g:compe.source.vsnip = v:true
" let g:compe.source.ultisnips = v:true

" LSP keybindings
"nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
"nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
"nnorema <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
"nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

"inoremap <silent><expr> <C-Space> compe#complete()
"inoremap <silent><expr> <CR>      compe#confirm('<CR>')
"inoremap <silent><expr> <C-e>     compe#close('<C-e>')

" Language Server Support
" lua << EOF
"require'lspconfig'.gopls.setup{}
"require'lspconfig'.rust_analyzer.setup{}
"require'lspconfig'.cssls.setup{}
"require'lspconfig'.html.setup{}
"EOF
