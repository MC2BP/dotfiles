set background=dark
highlight clear
"if exists("syntax_on")
  " syntax reset
"endif
let g:colors_name = "mc2bp"
set guifont=Fira\ Code:h9.5
hi Normal          guifg=#d4d9e4  gui=none      guibg=#00051b  

" Cursor
hi CursorLine        gui=none  guibg=NONE     guifg=NONE     ctermbg=NONE   cterm=NONE
hi CursorLineNumber  gui=none  guibg=NONE     guifg=#dbe6fe  ctermfg=15     ctermfg=0
hi CursorLineNr      gui=none  guibg=NONE     guifg=#dbe6fe  ctermfg=15     ctermbg=0
hi MatchParen        gui=none  guibg=#808080  ctermbg=244

" Code and Text
hi NonText      gui=none  guifg=#0073df  ctermfg=4
hi Comment      gui=none  guifg=#5fd787  ctermfg=77
hi Constant     gui=none  guifg=#d7875f  ctermfg=173
hi Identifier   gui=none  guifg=#5fffff  ctermfg=87     cterm=NONE
hi Number       gui=none  guifg=#d7ff87  ctermfg=192
hi Statement    gui=none  guifg=#0073df  ctermfg=4
hi Type         gui=none  guifg=#00ffaf  ctermfg=49
hi Special      gui=none  guifg=#e3e600  ctermfg=3
hi Operator     gui=none  guifg=#b7c1d3  ctermfg=7
hi Label        gui=none  guifg=#ff3442  ctermfg=9
hi Function     gui=none  guifg=#ffff87  ctermfg=228
hi EndOfBuffer  gui=none  guifg=black    ctermfg=black

" SignColumn
hi SignColumn  gui=none  guifg=#808080  guibg=NONE  ctermfg=244  ctermbg=NONE
hi LineNr      gui=none  guifg=#808080  guibg=NONE  ctermfg=244  ctermbg=NONE

" Folds
hi Folded       gui=none  guifg=#b7c1d3  guibg=#041021  cterm=NONE  ctermfg=7  ctermbg=0
hi ColorColumn                                                                 ctermbg=16

" Menus
hi Pmenu     gui=none  guifg=#808080  guibg=#041021  ctermfg=244    ctermbg=0
hi PmenuSel  gui=none  guifg=#dbe6f4  guibg=NONE     ctermfg=15     ctermbg=0

" StatusLine
hi Tabline      gui=none  guibg=#041021  guifg=#808080  cterm=NONE  ctermbg=0     ctermfg=244
hi TablineFill  gui=none  guibg=#041021  guifg=#dbe6fe  cterm=NONE  ctermbg=0     ctermfg=4
hi TablineSel   gui=none  guibg=#041021  guifg=#dbe6fe  cterm=NONE  ctermbg=0     ctermfg=15
hi VertSplit    gui=none  guibg=#041021  guifg=#041021  cterm=NONE  ctermbg=NONE  ctermfg=4

" Scrollbar
hi ScrollbarError  ctermfg=1
hi ScrollbarWarn   ctermfg=173
hi ScrollbarHint   ctermfg=3
hi ScrollbarInfo   ctermfg=4

hi LspDiagnosticsSignError                                                            ctermbg=0  ctermfg=1
hi LspDiagnosticsSignWarning                                                          ctermbg=0  ctermfg=173
hi LspDiagnosticsSignHint                                                             ctermbg=0  ctermfg=3
hi LspDiagnosticsSignInformation                                                      ctermbg=0  ctermfg=4
hi StatusLine                     gui=none  guibg=NONE     guifg=#dbe6fe  cterm=NONE  ctermbg=0  ctermfg=15
hi StatusLineNC                   gui=none  guibg=#041021  guifg=#808080  cterm=NONE  ctermbg=0  ctermfg=244

"------------------------------------
"                COC
"------------------------------------
hi CocHighlightText    gui=none  guibg=#808080  ctermbg=244

"------------------------------------
"                Debugger 
"------------------------------------
hi DaPUIDecoration    gui=none  guifg=#5fffff  ctermfg=87
hi DaPUIScope         gui=none  guifg=#5fffff  ctermfg=87
hi DaPUIVariable      gui=none  guifg=#5fffff  ctermfg=87
hi DaPUIType          gui=none  guifg=#dbe6fe  ctermfg=15
hi DaPUIValue         gui=none  guifg=#d7875f  ctermfg=173
hi DaPUIWatchesError  gui=none  guifg=#db0726  ctermfg=1
hi DaPUIWatchesEmpty  gui=none  guifg=#808080  ctermfg=244
hi DaPUIWatchesValue  gui=none  guifg=#5fffff  ctermfg=87
hi debugPC            gui=none  guibg=#5f0000  ctermbg=52

"------------------------------------
"                Vim-GitGutter
"------------------------------------
hi GitGutterAdd     ctermfg=2  guifg=#00c06f
hi GitGutterChange  ctermfg=3  guifg=#e3e600
hi GitGutterDelete  ctermfg=1  guifg=#db0726

"------------------------------------
"                GO
"------------------------------------
hi goComment       gui=none  guifg=#5fd787  ctermfg=77
hi goFunctionCall  gui=none  guifg=#ffff87  ctermfg=228
" Go Types
hi goType          gui=none  guifg=#00ffaf  ctermfg=49
hi goFloats        gui=none  guifg=#00ffaf  ctermfg=49
hi goSignedInts    gui=none  guifg=#00ffaf  ctermfg=49
hi goUnsignedInts  gui=none  guifg=#00ffaf  ctermfg=49
hi goDecimalInt    gui=none  guifg=#d7875f  ctermfg=173
" Go Type Values
hi goFloat       gui=none  guifg=#d7ff5f  ctermfg=191
hi goDecimalInt  gui=none  guifg=#d7ff5f  ctermfg=191
hi goString      gui=none  guifg=#d7875f  ctermfg=173
hi goRawString   gui=none  guifg=#d7875f  ctermfg=173
" Go Identifier
hi goParamName  gui=none  guifg=#5fffff  ctermfg=87
hi goVarAssign  gui=none  guifg=#5fffff  ctermfg=87
hi goVarDefs    gui=none  guifg=#5fffff  ctermfg=87

