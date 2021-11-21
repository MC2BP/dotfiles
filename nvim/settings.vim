" Syntax 
syntax enable					" enable syntax highligting
filetype plugin indent on 	
set noexpandtab				" don't converts tabs to spaces
set tabstop=3					" 1 tab eq 3 spaces
set shiftwidth=3 				" I use an indent of 3, come fight me
set autoindent					" auto indentation

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
set laststatus=1 				" show status line if more than 1 file is open
set statusline=\ %f\ %Y%=\ %p%%\ %l:%c\ 
autocmd TermOpen * setlocal nonumber norelativenumber " automatically disable line numbers in terminal

map Q <NOP> 					" Disable ex mode

" Splits and navigation
set splitright					" Horizontal splits will automatically be to the right
set splitbelow  				" Vertical splits will always to the bottom
map <C-t> <C-W><C-J>
map <C-c> <C-W><C-K>
map <C-n> <C-W><C-L>
map <C-h> <C-W><C-H>
map <Space>c :resize +5<CR>
map <Space>t :resize -5<CR>
map <Space>n :vertical resize +5<CR>
map <Space>h :vertical resize -5<CR>

" Other settings
set encoding=utf-8 			" set encoding
set clipboard=unnamedplus	" Copy paste between nvim and everything else

" Tabline
set showtabline=2
set tabline=%!MyTabLine()\   " custom tab pages line
function MyTabLine()
	let s = '' " complete tabline goes here
	" loop through each tab page
	for t in range(tabpagenr('$'))
		" set highlight
		if t + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif
		" set the tab page number (for mouse clicks)
		let s .= '%' . (t + 1) . 'T'
		let s .= ' '
		" set page number string
		let s .= t + 1 . ' '
		" get buffer names and statuses
		let n = ''      "temp string for buffer names while we loop and check buftype
		let m = 0       " &modified counter
		let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
		" loop through each buffer in a tab
		for b in tabpagebuflist(t + 1)
			" buffer types: quickfix gets a [Q], help gets [H]{base fname}
			" others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
			if getbufvar( b, "&buftype" ) == 'help'
				let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
			elseif getbufvar( b, "&buftype" ) == 'quickfix'
				let n .= '[Q]'
			else
				let n .= pathshorten(bufname(b))
			endif
			" check and ++ tab's &modified count
			if getbufvar( b, "&modified" )
				let m += 1
			endif
			" no final ' ' added...formatting looks better done later
			if bc > 1
				let n .= ' '
			endif
			let bc -= 1
		endfor
		" add modified label [n+] where n pages in tab are modified
		if m > 0
			let s .= '[' . m . '+]'
		endif
		" select the highlighting for the buffer names
		" my default highlighting only underlines the active tab
		" buffer names.
		if t + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif
		" add buffer names
		if n == ''
			let s.= '[New]'
		else
			let s .= n
		endif
		" switch to no underlining and add final space to buffer list
		let s .= ' '
	endfor
	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T %= %{FugitiveStatusline()} '
	return s
endfunction

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
	 \ 'Untracked' :'✭',
	 \ 'Renamed'   :'➜',
	 \ 'Unmerged'  :'═',
	 \ 'Deleted'   :'-',
	 \ 'Dirty'     :'~',
	 \ 'Ignored'   :'☒',
	 \ 'Clean'     :'✔︎',
	 \ 'Unknown'   :'?',
	 \ }

" =====================================================================================
"    FZF
" =====================================================================================
nnoremap <silent> <C-p> :Files <CR>

" =====================================================================================
"    ToggleTerm
" =====================================================================================
nnoremap <silent> <C-d> :TermToggle <CR>    
tnoremap <silent> <C-d> <C-\><C-n>:TermToggle <CR>    
inoremap <silent> <C-d> <C-o>:TermToggle <CR>

" =====================================================================================
"    Vim-GitGutter
" =====================================================================================
let g:gitgutter_sign_removed = '-'
let g:gitgutter_map_keys = 0
hi GitGutterAdd		ctermfg=2
hi GitGutterChange 	ctermfg=3
hi GitGutterDelete 	ctermfg=1

" =====================================================================================
"    Nvim-DAP
" =====================================================================================
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F6> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F7> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F8> :lua require'dap'.step_out()<CR>

nnoremap <silent> <F9> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <F4> :lua require'dapui'.toggle()<CR>

" =====================================================================================
"    COC
" =====================================================================================
set completeopt=menuone,noselect
set completeopt=menu,menuone,noselect
set nobackup
set nowritebackup
set updatetime=100
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

autocmd CursorHold * silent call CocActionAsync('highlight')

" Code editing
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Add OR command to organize imports
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" =====================================================================================
"    LaTeX
" =====================================================================================
let g:latex_pdf_viewer="mupdf"

" =====================================================================================
"    vim-rainbowbrackets
" =====================================================================================
let g:rainbowbrackets_colors =
	\ [
	\   'ctermfg=87',
	\   'ctermfg=5',
	\   'ctermfg=226',
	\   'ctermfg=112'
	\ ]
let g:rainbowbrackets_enable_round_brackets = 1
let g:rainbowbrackets_enable_curly_brackets = 1
let g:rainbowbrackets_enable_square_brackets = 1
let g:rainbowbrackets_enable_angle_brackets = 0

" =====================================================================================
"    vim-polyglot
" =====================================================================================
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

