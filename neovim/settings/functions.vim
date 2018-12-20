function! RunInTerminal()
  echo g:lang
    exec 'split | terminal '.g:lang expand('%')
endfunction

function! MarkdownStuff()
    set wrap
    colorscheme candyman
endfunction

highlight TooLong ctermbg=yellow guibg=yellow
let s:activatedh = 0
function! ToggleLongLines()
    if s:activatedh == 0
        let s:activatedh = 1
        let g:pymode_options_colorcolumn = 1
        set colorcolumn=+1
    else
        let s:activatedh = 0
        let g:pymode_options_colorcolumn = 0
        set colorcolumn=
    endif
endfunction


