set background=light

if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let g:colors_name="custom"

hi Constant        cterm=none ctermfg=3
hi CursorLine      cterm=none             ctermbg=235
hi VertSplit       cterm=none ctermfg=4
hi LineNr                     ctermfg=4
hi Visual                                 ctermbg=236
hi ErrorMsg                   ctermfg=1   ctermbg=none

hi Pmenu                      ctermfg=7   ctermbg=235
hi PmenuSel                   ctermfg=234 ctermbg=2

hi Search                     ctermfg=234

" TODO:
hi Todo                       cterm=bold

hi! link Statement    Constant
hi! link Folded       Comment
hi! link StatusLine   VertSplit
hi! link StatusLineNC StatusLine

