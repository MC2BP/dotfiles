set background=dark
highlight clear
"if exists("syntax_on")
  " syntax reset
"endif
let g:colors_name = "mc2bp"

" Cursor
hi CursorLine 			ctermbg=NONE 	cterm=NONE
hi CursorLineNumber	ctermfg=15 		ctermfg=0
hi CursorLineNr		ctermfg=15 		ctermbg=0
hi MatchParen 			ctermbg=244

" Code and Text
hi NonText      ctermfg=4
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
hi SignColumn	ctermbg=NONE	ctermfg=244
hi LineNr 		ctermfg=244   	ctermbg=NONE

" Folds
hi Folded 		cterm=NONE ctermfg=7 ctermbg=0

" Menus
hi Pmenu					ctermfg=244        ctermbg=0
hi PmenuSel    		ctermfg=15         ctermbg=0

" StatusLine
hi StatusLine   cterm=NONE ctermbg=0  ctermfg=15
hi StatusLineNC cterm=NONE ctermbg=0  ctermfg=244
hi Tabline      cterm=NONE ctermbg=0  ctermfg=244
hi TablineFill  cterm=NONE ctermbg=0  ctermfg=15
hi TablineSel   cterm=NONE ctermbg=0  ctermfg=15
hi VertSplit    cterm=NONE ctermbg=0  ctermfg=0

"------------------------------------
"                COC
"------------------------------------
hi CocHighlightText ctermbg=244

"------------------------------------
"                Debugger 
"------------------------------------
hi DaPUIDecoration 		ctermfg=87
hi DaPUIScope           ctermfg=87
hi DaPUIVariable 			ctermfg=87
hi DaPUIType 				ctermfg=15
hi DaPUIValue 				ctermfg=173
hi DaPUIWatchesError 	ctermfg=1
hi DaPUIWatchesEmpty 	ctermfg=244
hi DaPUIWatchesValue 	ctermfg=87
hi debugPC					ctermbg=52

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
