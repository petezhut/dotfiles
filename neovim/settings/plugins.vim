" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

let g:deoplete#enable_at_startup = 1
" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" GitGutter!
set signcolumn=yes

" NERDTree {
map <leader>e :NERDTreeToggle<CR>               " Nerdtree really is great, isn't it?

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.png$','\.py[cd]$','\~$','\.swo$','\.swp$','^\.git$','^\.hg$','^\.svn$','\.bzr$','^\.ropeproject$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:NERDTreeWinSize = 60
let g:undotree_SetFocusWhenToggle=1
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"}
autocmd FileType nerdtree setlocal nolist



" Git Fugitive {
    let has_fugitive=1
" }

" rainbow {
    let g:rainbow_active = 1
" }
" colorscheme vividchalk
colorscheme Spink
nmap <leader>v :e /home/jmcfarland/.nvimrc<CR>

inoremap <silent> <leader>c gc

let g:pymode_options_max_line_length = 120
let g:pymode_options_colorcolumn = 1
let g:neomake_python_enabled_markers = ['flake8']

" TagBar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 0
let g:tagbar_show_linenumbers = -1
let g:tagbar_left = 1
let g:tagbar_width = 60

function! AutoOpenTagBar()
    :call tagbar#autoopen(0)
endfunction

" ALE Linting
let g:ale_enabled = 0

