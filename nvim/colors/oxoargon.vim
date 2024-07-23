let colors_name = "oxoargon"

if exists("syntax_on")
  syntax reset
endif

" Editor settings
hi Normal            ctermfg=none    ctermbg=none        cterm=none
hi CursorLine        ctermfg=none    ctermbg=none        cterm=underdotted
hi LineNr            ctermfg=8       ctermbg=none        cterm=none
hi CursorLineNR      ctermfg=7       ctermbg=none        cterm=bold
hi SignColumn        ctermfg=none    ctermbg=none        cterm=none
hi ColorColumn       ctermfg=7       ctermbg=8           cterm=none
hi Folded            ctermfg=none    ctermbg=none        cterm=none

" - Window/Tab delimiters
"hi VertSplit        ctermfg=10      ctermbg=10      cterm=none
"hi TabLine          ctermfg=12      ctermbg=10      cterm=none
"hi TabLineFill      ctermfg=10      ctermbg=0       cterm=underline
"hi TabLineSel       ctermfg=none    ctermbg=0       cterm=bold
"hi StatusLine       ctermfg=none    ctermbg=11      cterm=none
"hi StatusLineNC     ctermfg=none    ctermbg=10      cterm=none

" - File Navigation / Searching -
"hi Directory        ctermfg=4       ctermbg=none    cterm=none
"hi Search           ctermfg=0       ctermbg=15      cterm=none
"hi IncSearch        ctermfg=0       ctermbg=7       cterm=none

" - Prompt/Status -
"hi WildMenu         ctermfg=0       ctermbg=6       cterm=bold
"hi Question         ctermfg=6       ctermbg=none    cterm=none
"hi Title            ctermfg=15      ctermbg=none    cterm=bold
"hi ModeMsg          ctermfg=13      ctermbg=none    cterm=none
"hi MoreMsg          ctermfg=13      ctermbg=none    cterm=none

" - Visual aid -
hi MatchParen        ctermfg=none      ctermbg=10        cterm=bold
hi Visual            ctermfg=none      ctermbg=none      cterm=inverse
hi NonText           ctermfg=8         ctermbg=none      cterm=none
hi EndOfBuffer       ctermfg=1         ctermbg=none      cterm=none

hi Todo              ctermfg=3         ctermbg=none      cterm=none
hi Underlined        ctermfg=none      ctermbg=none      cterm=underline
hi Error             ctermfg=9         ctermbg=none      cterm=none
hi ErrorMsg          ctermfg=1         ctermbg=none      cterm=none
hi WarningMsg        ctermfg=3         ctermbg=none      cterm=none
hi Ignore            ctermfg=none      ctermbg=none      cterm=none
hi SpecialKey        ctermfg=none      ctermbg=none      cterm=none

" Variable types
hi Constant          ctermfg=10        ctermbg=none      cterm=bold
hi String            ctermfg=3         ctermbg=none      cterm=italic

hi Character         ctermfg=3         ctermbg=none      cterm=italic
hi Number            ctermfg=10        ctermbg=none      cterm=none
hi Boolean           ctermfg=10        ctermbg=none      cterm=bold
hi Float             ctermfg=10        ctermbg=none      cterm=none

hi Identifier        ctermfg=4         ctermbg=none      cterm=none
hi Function          ctermfg=6         ctermbg=none      cterm=none

" Language constructs
hi Comment           ctermfg=2         ctermbg=none      cterm=italic

hi Statement         ctermfg=1         ctermbg=none      cterm=bold
" hi Conditional      ctermfg=5    ctermbg=none    cterm=none
" hi Repeat           ctermfg=5    ctermbg=none    cterm=none
" hi Label            ctermfg=none    ctermbg=none    cterm=none
" hi Operator         ctermfg=none    ctermbg=none    cterm=none
" hi Keyword          ctermfg=5    ctermbg=none    cterm=none
" hi Exception        ctermfg=none    ctermbg=none    cterm=none

hi Special           ctermfg=9         ctermbg=none      cterm=none
" hi SpecialChar      ctermfg=none    ctermbg=none    cterm=none
" hi Tag              ctermfg=none    ctermbg=none    cterm=none
hi Delimiter         ctermfg=13        ctermbg=none      cterm=italic
hi SpecialComment    ctermfg=11        ctermbg=none      cterm=italic
" hi Debug            ctermfg=none    ctermbg=none    cterm=none

" - C like -
hi PreProc          ctermfg=5    ctermbg=none    cterm=none
hi Include          ctermfg=14    ctermbg=none    cterm=none
" hi Define           ctermfg=5    ctermbg=none    cterm=none
" hi Macro            ctermfg=5    ctermbg=none    cterm=none
" hi PreCondit        ctermfg=none    ctermbg=none    cterm=none

hi Type             ctermfg=13    ctermbg=none    cterm=italic
" hi StorageClass     ctermfg=none    ctermbg=none    cterm=none
" hi Structure        ctermfg=none    ctermbg=none    cterm=none
" hi Typedef          ctermfg=none    ctermbg=none    cterm=none

" Diff
hi DiffAdd          ctermfg=none     ctermbg=none    cterm=none
hi DiffChange       ctermfg=none     ctermbg=none    cterm=none
hi DiffDelete       ctermfg=none     ctermbg=none    cterm=none
hi DiffText         ctermfg=none     ctermbg=none    cterm=bold
hi diffAdded        ctermfg=none     ctermbg=none    cterm=none
hi diffChanged      ctermfg=none     ctermbg=none    cterm=none
hi diffRemoved      ctermfg=none     ctermbg=none    cterm=none
hi diffLine         ctermfg=none     ctermbg=none    cterm=bold

" Completion menu
hi Pmenu            ctermfg=none    ctermbg=none    cterm=none
hi PmenuSel         ctermfg=none    ctermbg=none    cterm=none
hi PmenuSbar        ctermfg=none    ctermbg=none    cterm=none
hi PmenuThumb       ctermfg=none    ctermbg=none    cterm=none

" Spelling
hi SpellBad         ctermfg=none    ctermbg=none    cterm=undercurl
hi SpellCap         ctermfg=none    ctermbg=none    cterm=underline
hi SpellLocal       ctermfg=none    ctermbg=none    cterm=none
hi SpellRare        ctermfg=none    ctermbg=none    cterm=none

