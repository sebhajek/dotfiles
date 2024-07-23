let colors_name = "oxoargon"

if exists("syntax_on")
  syntax reset
endif

" BASICS
highlight Visual         ctermfg=NONE ctermbg=NONE cterm=inverse
highlight Search         ctermfg=0    ctermbg=11

highlight CursorLine     cterm=underdotted

highlight TermCursor     cterm=reverse
highlight NonText        ctermfg=12

highlight LineNr       ctermfg=8
highlight CursorLineNr ctermfg=7
highlight Comment      cterm=italic ctermfg=2

highlight ColorColumn  ctermfg=7    ctermbg=8
highlight Folded       ctermfg=7    ctermbg=8
highlight FoldColumn   ctermfg=7    ctermbg=8
highlight StatusLine   ctermfg=8   ctermbg=8    cterm=bold
highlight StatusLineNC ctermfg=7    ctermbg=8    cterm=NONE
highlight SignColumn                ctermbg=NONE

highlight MatchParen     ctermfg=5 ctermbg=10
highlight Constant       cterm=bold ctermfg=1
highlight Special        ctermfg=9
highlight Identifier     cterm=NONE ctermfg=6
highlight Statement      cterm=bold ctermfg=13
highlight PreProc        ctermfg=5
highlight Type           cterm=NONE ctermfg=5
highlight Underlined     cterm=underline ctermfg=5
highlight Ignore         ctermfg=15
highlight Error          ctermfg=15 ctermbg=9
highlight Todo           ctermfg=0 ctermbg=11
