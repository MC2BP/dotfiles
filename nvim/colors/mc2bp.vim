set background=dark
highlight clear
"if exists("syntax_on")
  " syntax reset
"endif
let g:colors_name = "mc2bp"

" Cursor
hi CursorLine 			ctermbg=NONE cterm=NONE
hi CursorLineNumber	ctermfg=15 ctermfg=17
hi CursorLineNr		ctermfg=15 ctermbg=17
hi LineNr 				ctermfg=4  ctermbg=NONE
hi MatchParen 			ctermbg=8

" Code and Text
hi NonText      ctermfg=4
hi LineNr       ctermfg=8
hi Comment      ctermfg=77
hi Constant     ctermfg=173
hi Identifier   ctermfg=87         cterm=NONE
hi Number 		 ctermfg=192
hi Statement    ctermfg=4
hi Type         ctermfg=49
hi Special      ctermfg=3
hi Operator     ctermfg=7
hi Label        ctermfg=9
hi Function     ctermfg=228
hi EndOfBuffer	 ctermfg=black

" SignColumn
hi SignColumn	ctermbg=NONE	ctermfg=7

" Folds
hi Folded 		cterm=NONE ctermfg=7 ctermbg=NONE

" Menus
hi Pmenu					ctermfg=254        ctermbg=NONE
hi PmenuSel    		ctermfg=254        ctermbg=17

" StatusLine
hi StatusLine   cterm=NONE ctermbg=16 ctermfg=15
hi StatusLineNC cterm=NONE ctermbg=16 ctermfg=8
hi Tabline      cterm=NONE ctermfg=7
hi TablineFill  cterm=NONE
hi VertSplit    cterm=NONE ctermfg=4

" Tabline
hi TablineSel 	 cterm=NONE ctermbg=16 ctermfg=254
hi Tabline 		 cterm=NONE ctermbg=16 ctermfg=245

"------------------------------------
"                COC
"------------------------------------
hi CocHighlightText ctermbg=8

"------------------------------------
"                GO
"------------------------------------
hi goComment		ctermfg=77
hi goFunctionCall ctermfg=228
" Go Types
hi goType			ctermfg=49
hi goFloats			ctermfg=49
hi goSignedInts	ctermfg=49
hi goUnsignedInts	ctermfg=49
hi goDecimalInt   ctermfg=173
" Go Type Values
hi goFloat			ctermfg=191
hi goDecimalInt 	ctermfg=191
hi goString 		ctermfg=173
hi goRawString 	ctermfg=173
" Go Identifier
hi goParamName 	ctermfg=87
hi goVarAssign 	ctermfg=87
hi goVarDefs 		ctermfg=87
