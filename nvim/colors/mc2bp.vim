set background=dark
highlight clear
"if exists("syntax_on")
  " syntax reset
"endif
let g:colors_name = "MC2BP"

" Code and Text
hi NonText      ctermfg=4
hi LineNr       ctermfg=8
hi Comment      ctermfg=77
hi Constant     ctermfg=173
hi Identifier   ctermfg=14        cterm=NONE
hi Statement    ctermfg=4
hi Type         ctermfg=2
hi Special      ctermfg=3
hi Operator     ctermfg=7
hi Label        ctermfg=9
hi Function     ctermfg=229
hi EndOfBuffer	ctermfg=black

" SignColumn
hi SignColumn	ctermbg=NONE	ctermfg=7

" Folds
hi Folded 		cterm=NONE ctermfg=7

" Menus
hi Pmenu					ctermfg=7         ctermbg=235
hi PmenuSel    		ctermfg=15        ctermbg=8
hi CursorLineNumber	ctermfg=14
hi CursorLineNr		ctermfg=14

" StatusLine
 " hi StatusLine   ctermbg=7   ctermfg=17  cterm=NONE
hi StatusLine   cterm=BOLD ctermbg=4 ctermfg=16
hi StatusLineNC cterm=NONE ctermbg=8 ctermfg=16
hi Tabline      cterm=NONE ctermfg=7
hi TablineFill  cterm=NONE
hi VertSplit    cterm=NONE ctermfg=4

" Tabline
hi TablineSel 	 cterm=BOLD ctermbg=4 ctermfg=16
hi Tabline 		 cterm=NONE ctermbg=8 ctermfg=16

"------------------------------------
"                GO
"------------------------------------
" Go Syntax
hi goComment		ctermfg=77
hi goFunctionCall ctermfg=229
" Go Datatypes
hi goType			ctermfg=51
hi goFloats			ctermfg=51
hi goSignedInts	ctermfg=51
hi goUnsignedInts	ctermfg=51
hi goDecimalInt ctermfg=173
" Go Type Values
hi goFloat			ctermfg=191
hi goDecimalInt 	ctermfg=191
hi goString 		ctermfg=173


