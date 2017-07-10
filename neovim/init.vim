set termguicolors
" set colorcolumn=+1


" Turning on certain settings:
set autoindent                         " Be a nice editor and indent that for me
set cindent                            " Sometimes you just want to make sure indentation is on
set expandtab                          " Expand tabs to spaces (Python for the win!)
set lazyredraw                         " More page redraw speed up!
set linebreak                          " Turn on linebreaking
set nowrap                             " Don't wrap long lines by default
set number                             " Turn on line numbers
set ruler                              " Turn on the line/column tracker 
set showmatch                          " Turn on matching open/close bracket/brace/parens
set smartindent                        " My indentations just got their G.E.D.!
set smarttab                           " Send indentation to college
set wildmenu                           " Turn on wildmenu
set cursorline
set autoread
set autowrite
set smartcase                          " This makes the usually case-insensitve searches case-sensitive when a capital is used!

" Setting other settings to specific values
set background=dark                    " All supervillians have a dark past
set backspace=2                        " Sometimes the backspace key gets confused
set cmdheight=2                        " Lets give the command bar enough room to breath, shall we?
set laststatus=2                       " Make the status bar puuuuurty
set scrolloff=5                        " Let's save some love for the cursor when scrolling vertically
set sidescrolloff=5                    " Let's save some love for the cursor when scrolling horizontally
set shiftwidth=2                       " I've been burned by softtabstop and tabstop before      
set softtabstop=2                      " Set the softtabstop
set nofoldenable
set tabstop=2                          " Set the tabstop
scriptencoding=utf8                    " Set script encoding to utf-8
set termencoding=utf8                  " Set terminal encoding to utf-8
set wildignore=*.o,*.pyc,*.pyo,*~      " Don't just ignore them, WILDLY ignore them!  It's super effective!
set clipboard+=unnamed

" My Variables...
let g:Author = "Jason L McFarland"
let g:Nickname = 'the_qe_viking'
let g:Email = 'someone@somewhere.com'

" Since we can't all be the captain, some of us shall be crew
let mapleader = ","                    
let g:mapleader = ","
let g:editor_name='vim'
let g:mapleader = ','
let g:max_cols = 35
let g:neovim2_venv=expand('/home/jmcfarland/virtual_envs/neovim2/bin/python')
let g:neovim3_venv=expand('/home/jmcfarland/virtual_envs/neovim3/bin/python')

if !empty(glob(g:neovim2_venv))
    let g:python_host_prog=g:neovim2_venv
endif

if !empty(glob(g:neovim3_venv))
    let g:python3_host_prog=g:neovim3_venv
endif

if empty(glob('/home/jmcfarland/.vim/autoload/plug.vim'))
  silent !curl -fLo /home/jmcfarland/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(expand('/home/jmcfarland/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo /home/jmcfarland/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('nvim')
    let g:editor_name='nvim'
endif

if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
	let &listchars = "tab:\u21e5\u00b7,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
	let &fillchars = "vert:\u259a,fold:\u00b7"
else
	set listchars=tab:>\ ,trail:-,extends:>,precedes:<
endif
    
if exists('&inccommand')
    set inccommand=split " Turn on live preview substitute
endif

" My global command shortcuts
nmap <leader>w :w!<CR>       " When I press ",w", write the file
nmap <leader>q :q!<CR>       " When I press ",q", exit the file, and do it now!
nmap <silent> <C-H> :bp<CR>  " This is to map  Ctrl+H to select the next buffer
nmap <silent> <C-L> :bn<CR>  " This is to map  Ctrl+L to select the previous buffer

" Plugins {
call plug#begin('/home/jmcfarland/.config/nvim/plugged')
    Plug 'Chiel92/vim-autoformat'               " Autoformatting of code
    Plug 'Xuyuanp/nerdtree-git-plugin'          " Git plugin for nerdtree
    Plug 'airblade/vim-gitgutter'               " Show git changes
    Plug 'altercation/vim-colors-solarized'     " Solarized stuff
    Plug 'benekastah/neomake'                   " Syntax checking
    Plug 'ctrlpvim/ctrlp.vim'                   " Fuzzy file finder
    Plug 'easymotion/vim-easymotion'            " Move more freely
    Plug 'flazz/vim-colorschemes'               " Color schemes for days
    Plug 'haya14busa/incsearch.vim'             " Better searching
    Plug 'jiangmiao/auto-pairs'                 " Auto pair parens and brackets
    Plug 'jszakmeister/vim-togglecursor'        " Toggle cursor in insert mode
    Plug 'klen/python-mode'                     " Python specific features
    Plug 'rust-lang/rust.vim'                   " Rust all the things!
    Plug 'luochen1990/rainbow'                  " Rainbow parenthesis
    Plug 'majutsushi/tagbar'                    " Browsing tags and stuff
    Plug 'mbbill/undotree'                      " Undo tree
    Plug 'sjl/badwolf'                          " Really nice colorscheme
    Plug 'morhetz/gruvbox'                      " Really nice colorscheme
    Plug 'nathanaelkane/vim-indent-guides'      " Indent Guides
    Plug 'powerline/fonts'                      " Powerline fonts for airline
    Plug 'rking/ag.vim'                         " Silver searcher searching
    Plug 'schickling/vim-bufonly'               " Close all buffers except one
    Plug 'scrooloose/nerdtree'                  " File tree viewer
    Plug 'spf13/vim-colors'                     " Some colors
    Plug 'tpope/vim-commentary'                 " Comment all the things
    Plug 'tpope/vim-vividchalk'                  " Comment all the things
    Plug 'tpope/vim-fugitive'                   " Git stuff
    Plug 'tpope/vim-surround'                   " Surround things with things
    Plug 'tpope/vim-unimpaired'                 " Moving around easier
    Plug 'vim-airline/vim-airline'              " Cool ass statusline
    Plug 'vim-airline/vim-airline-themes'       " Airline themes
    Plug 'junegunn/fzf', { 'dir': '/home/jmcfarland/.fzf', 'do': './install --all' }  "Fuzzy Command Line Globbing!
    " Setting vim specific autocomplete
    if has('nvim')
        Plug 'Shougo/deoplete.nvim'             " Autocomplete for neovim
    else
        Plug 'Shougo/neocomplete.vim'           " Autocomplete for vim
    endif
    Plug 'nvie/vim-flake8'                      " Flake8 !
    " This has to be loaded after everything else
call plug#end()
" }

" GitGutter!
let g:gitgutter_sign_column_always = 1

" NERDTree {
map <leader>e :NERDTreeToggle<CR>             " Nerdtree really is great, isn't it?

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.png$','\.py[cd]$','\~$','\.swo$','\.swp$','^\.git$','^\.hg$','^\.svn$','\.bzr$','^\.ropeproject$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
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
"
let g:flake8_max_line_length=150
let g:flake8_ignore="E501,E111,E303"

" vim-airline {
    " let g:airline_theme='vice'
    let g:airline_theme='cobalt2'
    " let g:airline_theme='badwolf'
    " let g:airline_theme='gruvbox'
    " let g:airline_theme='base16_chalk'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_left_sep='›' " Slightly fancier than '>'
    let g:airline_right_sep='‹' " Slightly fancier than '<'
" }


" Git Fugitive {
    let has_fugitive=1
" }

" rainbow {
    let g:rainbow_active = 1
" }
colorscheme vividchalk
" colorscheme badwolf " I like Doctor Who
" colorscheme gruvbox

nmap <leader>v :e /home/jmcfarland/.nvimrc<CR>

inoremap <silent> <leader>c gc

let g:pymode_options_max_line_length = 120
let g:pymode_options_colorcolumn = 1

function! PythonStuff()
" python-mode {
    let g:pymode_rope_completion=0
    let g:pymode_rope_completion_bind = ''
    let g:pymode_rope_complete_on_dot = 0
    let g:pymode_indent=0
    let g:pymode_lint=0
    let g:pymode_lint_checker = "pyflakes,pep8"
    let g:pymode_folding=0
    let g:pymode_virtualenv=0
    let g:pymode_rope=0
" Jedi-Vim {
"    autocmd FileType python setlocal completeopt-=preview

    let b:comment_leader = "# "
    let g:is_virtual_env = $VIRTUAL_ENV
    au BufWritePre *.py normal m`:%s/\s\+$//e ``
    au BufWritePre *.py normal m`:%s/\t/\ \ /e ``
    " autocmd! BufWritePost * Neomake
    autocmd! BufWritePost <ESC>:call Flake8()<CR>
    map <silent> <leader>x <ESC>:w\|!$(which python) %<CR>
    map <silent> <leader>f <ESC>:w\|:call Flake8()<CR>
    set nocindent
    " let python_highlight_all=1
    syntax on
endfunction

function! MarkdownStuff()
    set wrap
endfunction

function! ShellStuff()
    let b:comment_leader = "# "
    map <silent> <leader>x <ESC>:w\|!$(which bash) %<CR>
    set nocindent
    syntax on
endfunction

function! GoStuff()
    let b:comment_leader = "// "
    map <silent> <leader>x <ESC>:w\|!go run %<CR>
    set nocindent
endfunction

function! RustStuff()
    let ft=rust
    let g:rust_fmt_autosave = 1
    let b:comment_leader = "// "
    map <silent> <leader>x <ESC>:w\|:RustRun<CR>
    set nocindent
endfunction


highlight TooLong ctermbg=yellow guibg=yellow
" highlight TooLong ctermbg=234 guibg=#2c2d27
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

nnoremap <leader>1 :call ToggleLongLines()<CR>

autocmd FileType markdown call MarkdownStuff()
autocmd FileType python call PythonStuff()
autocmd BufRead,BufNewFile *.py call PythonStuff()
autocmd BufRead .nvimrc let b:comment_leader = "\" "
autocmd FileType cfg let b:comment_leader = "; "
autocmd BufRead Dockerfile let b:comment_leader = "# "
autocmd BufRead *.sh call ShellStuff()
autocmd BufRead *.rs call RustStuff()
autocmd FileType go call GoStuff()
