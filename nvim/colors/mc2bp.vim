set background=dark
highlight clear
"if exists("syntax_on")
  " syntax reset
"endif
let g:colors_name = "mc2bp"
set guifont=Fira\ Code,FiraMono\ Nerd\ Font\ Mono,MotoyaLMaru:h12
hi Normal          	guifg=#d4d9e4  gui=NONE guibg=#00051b

" Cursor
hi CursorLine        gui=NONE  guibg=NONE     guifg=NONE     ctermbg=NONE   cterm=NONE
hi CursorLineNumber  gui=NONE  guibg=NONE     guifg=#dbe6fe  ctermfg=15     ctermfg=0
hi CursorLineNr      gui=NONE  guibg=NONE     guifg=#dbe6fe  ctermfg=15     ctermbg=0
hi MatchParen        gui=NONE  guibg=#808080  ctermbg=244

" Code and Text
hi NonText      gui=NONE  guifg=#0073df  ctermfg=4
hi Comment      gui=NONE  guifg=#5fd75f  ctermfg=77
hi Constant     gui=NONE  guifg=#d7875f  ctermfg=173
hi Identifier   gui=NONE  guifg=#5fffff  ctermfg=87     cterm=NONE
hi PreProc      gui=NONE  guifg=#5fd7ff  ctermfg=81
hi Number       gui=NONE  guifg=#d7ff87  ctermfg=192
hi Statement    gui=NONE  guifg=#0073df  ctermfg=4
hi Type         gui=NONE  guifg=#00ffaf  ctermfg=49
hi Special      gui=NONE  guifg=#e3e600  ctermfg=3
hi Operator     gui=NONE  guifg=#b7c1d3  ctermfg=7
hi Label        gui=NONE  guifg=#ff3442  ctermfg=9
hi Function     gui=NONE  guifg=#ffff87  ctermfg=228
hi EndOfBuffer  gui=NONE  guifg=black    ctermfg=black

" SignColumn
hi SignColumn  gui=NONE  guifg=#808080  guibg=NONE  ctermfg=244  ctermbg=NONE
hi LineNr      gui=NONE  guifg=#808080  guibg=NONE  ctermfg=244  ctermbg=NONE

" Folds
hi Folded       gui=NONE  guifg=#b7c1d3  guibg=#041021  cterm=NONE  ctermfg=7  ctermbg=0
hi ColorColumn                           guibg=#00051b                         ctermbg=16

" Menus
hi Pmenu     gui=NONE  guifg=#808080  guibg=#041021  ctermfg=244    ctermbg=0
hi PmenuSel  gui=NONE  guifg=#dbe6f4  guibg=#041021  ctermfg=15     ctermbg=0

" StatusLine
hi Tabline      gui=NONE  guibg=#041021  guifg=#808080  cterm=NONE  ctermbg=0     ctermfg=244
hi TablineFill  gui=NONE  guibg=#041021  guifg=#0073df  cterm=NONE  ctermbg=0     ctermfg=4
hi TablineSel   gui=NONE  guibg=#041021  guifg=#dbe6fe  cterm=NONE  ctermbg=0     ctermfg=15
hi VertSplit    gui=NONE  guibg=#041021  guifg=#0073df  cterm=NONE  ctermbg=NONE  ctermfg=4

" Scrollbar
hi ScrollbarError  ctermfg=1     guifg=#db0726
hi ScrollbarWarn   ctermfg=173   guifg=#d7875f
hi ScrollbarHint   ctermfg=3     guifg=#e3e600
hi ScrollbarInfo   ctermfg=4     guifg=#0073df

hi LspDiagnosticsSignError                  guibg=#041021  guifg=#db0726              ctermbg=0  ctermfg=1
hi LspDiagnosticsSignWarning                guibg=#041021  guifg=#d7875f              ctermbg=0  ctermfg=173
hi LspDiagnosticsSignHint                   guibg=#041021  guifg=#e3e600              ctermbg=0  ctermfg=3
hi LspDiagnosticsSignInformation            guibg=#041021  guifg=#0073df              ctermbg=0  ctermfg=4
hi StatusLine                     gui=NONE  guibg=#041021  guifg=#dbe6fe  cterm=NONE  ctermbg=0  ctermfg=15
hi StatusLineNC                   gui=NONE  guibg=#041021  guifg=#808080  cterm=NONE  ctermbg=0  ctermfg=244

"------------------------------------
"                COC
"------------------------------------
hi CocHighlightText    gui=NONE  guibg=#808080  ctermbg=244

"------------------------------------
"                Debugger 
"------------------------------------
hi DaPUIDecoration    gui=NONE  guifg=#5fffff  ctermfg=87
hi DaPUIScope         gui=NONE  guifg=#5fffff  ctermfg=87
hi DaPUIVariable      gui=NONE  guifg=#5fffff  ctermfg=87
hi DaPUIType          gui=NONE  guifg=#dbe6fe  ctermfg=15
hi DaPUIValue         gui=NONE  guifg=#d7875f  ctermfg=173
hi DaPUIWatchesError  gui=NONE  guifg=#db0726  ctermfg=1
hi DaPUIWatchesEmpty  gui=NONE  guifg=#808080  ctermfg=244
hi DaPUIWatchesValue  gui=NONE  guifg=#5fffff  ctermfg=87
hi debugPC            gui=NONE  guibg=#5f0000  ctermbg=52

"------------------------------------
"                Vim-GitGutter
"------------------------------------
hi GitGutterAdd     ctermfg=2  guifg=#00c06f
hi GitGutterChange  ctermfg=3  guifg=#e3e600
hi GitGutterDelete  ctermfg=1  guifg=#db0726
hi gitblame         ctermfg=8

"------------------------------------
"                GO
"------------------------------------
hi goComment       gui=NONE  guifg=#5fd75f  ctermfg=77
hi goFunctionCall  gui=NONE  guifg=#ffff87  ctermfg=228
" Go Types
hi goType          gui=NONE  guifg=#00ffaf  ctermfg=49
hi goFloats        gui=NONE  guifg=#00ffaf  ctermfg=49
hi goSignedInts    gui=NONE  guifg=#00ffaf  ctermfg=49
hi goUnsignedInts  gui=NONE  guifg=#00ffaf  ctermfg=49
hi goDecimalInt    gui=NONE  guifg=#d7875f  ctermfg=173
" Go Type Values
hi goFloat        gui=NONE  guifg=#d7ff5f  ctermfg=191
hi goDecimalInt   gui=NONE  guifg=#d7ff5f  ctermfg=191
hi goString       gui=NONE  guifg=#d7875f  ctermfg=173
hi goRawString    gui=NONE  guifg=#d7875f  ctermfg=173
" Go Identifier
hi goParamName    gui=NONE  guifg=#5fffff  ctermfg=87
hi goVarAssign    gui=NONE  guifg=#5fffff  ctermfg=87
hi goVarDefs      gui=NONE  guifg=#5fffff  ctermfg=87

