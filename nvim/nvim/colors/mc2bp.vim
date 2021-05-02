set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mc2bp"

hi NonText      ctermfg=4
hi LineNr       ctermfg=8
hi Comment      ctermfg=114
hi Constant     ctermfg=173
hi Identifier   ctermfg=14        cterm=NONE
hi Statement    ctermfg=4
hi Type         ctermfg=2
hi Special      ctermfg=3
hi Operator     ctermfg=7
hi Label        ctermfg=9
hi Function     ctermfg=14

hi Pmenu        ctermfg=7         ctermbg=235
hi PmenuSel     ctermfg=15        ctermbg=8

" Go Syntax
hi goFunctionCall ctermfg=229
hi goVarDefs      ctermfg=14
hi goVarAssign     ctermfg=14


hi CursorLineNumber ctermfg=14
hi CursorLineNr     ctermfg=14

 " hi StatusLine   ctermbg=7   ctermfg=17  cterm=NONE
hi StatusLine   cterm=NONE  ctermfg=4
hi StatusLineNC cterm=NONE  ctermfg=7
hi Tabline      cterm=NONE  ctermfg=7
hi TablineFill  cterm=NONE
hi VertSplit    cterm=NONE  ctermfg=4

