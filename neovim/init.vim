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
set guicursor=

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
    Plug 'neomake/neomake'                      " Syntax checking
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
    Plug 'fenetikm/falcon'
    Plug 'challenger-deep-theme/vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'fatih/vim-go'
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

" vim-airline {
    let g:airline_theme='gruvbox'
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

nmap <leader>v :e /home/jmcfarland/.nvimrc<CR>

if has('nvim')
  " Neovim Termainal
  nmap <leader>t :sp term://bash<CR>
  tnoremap <Esc> <C-\><C-n>
  tnoremap <leader>l ls -al <cr>
endif

inoremap <silent> <leader>c gc

let g:pymode_options_max_line_length = 120
let g:pymode_options_colorcolumn = 1

let g:neomake_python_enabled_markers = ['flake8']

" TagBar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 0
let g:tagbar_show_linenumbers = 1
let g:tagbar_left = 1
let g:tagbar_width = 60

function! AutoOpenTagBar()
    :call tagbar#autoopen(0)
endfunction

function RunCommand(lang)
    exec 'vsplit | terminal '.a:lang expand('%')
endfunction

augroup filetype_python
    au!
    let g:pymode_rope_completion=0
    let g:pymode_rope_completion_bind = ''
    let g:pymode_rope_complete_on_dot = 0
    let g:pymode_indent=0
    let g:pymode_lint=0
    let g:pymode_lint_checker = "pyflakes,pep8"
    let g:pymode_folding=0
    let g:pymode_virtualenv=0
    let g:pymode_rope=0
    let prefix = ''
" Jedi-Vim {
"    autocmd FileType python setlocal completeopt-=preview

    let b:comment_leader = "# "
    let g:is_virtual_env = $VIRTUAL_ENV
    au BufWritePre *.py normal m`:%s/\s\+$//e ``
    au BufWritePre *.py normal m`:%s/\t/\ \ /e ``
    " autocmd! BufWritePost <ESC>:call Flake8()<CR>
    if isdirectory("env")
        let prefix = "env/bin/"
    endif
    au FileType python nnoremap <leader>x :call RunCommand(prefix.'python')<CR>
augroup END
    map <silent> <leader>f <ESC>:w\|:call Flake8()<CR>
    set nocindent
    " let python_highlight_all=1
    syntax on
    set shiftwidth=2             " I've been burned by softtabstop and tabstop before      
    set softtabstop=2            " Set the softtabstop
    set tabstop=2                " Set the tabstop
augroup END

function! MarkdownStuff()
    set wrap
endfunction

augroup filetype_bash
    au!
    let b:comment_leader = "# "
    au FileType sh nnoremap <leader>x :call RunCommand('bash')<CR>
    set nocindent
    syntax on
augroup END

augroup filetype_go
    au!
    let b:comment_leader = "// "
    au FileType go nnoremap <leader>x :call RunCommand('go run')<CR>
    set nocindent
augroup END

augroup filetype_rust
    let g:rust_fmt_autosave = 1
    let b:comment_leader = "// "
    au FileType rust nnoremap <leader>x :call RunCommand('/home/jmcfarland/.cargo/bin/cargo run')<CR>
    set nocindent
augroup END


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

autocmd! BufWritePost * Neomake
autocmd FileType markdown call MarkdownStuff()
autocmd BufRead .nvimrc let b:comment_leader = "\" "
autocmd FileType cfg let b:comment_leader = "; "
autocmd BufRead Dockerfile let b:comment_leader = "# "


" Workspace Setup
" ----------------
function! Systest()
    " Rough num columns to decide between laptop and big monitor screens
    let numcol = 2

    sp
    wincmd k
    term://bash "cd ~/Code/cmf/systest/"
    file Systest
    resize 10
endfunction
command! -register Systest call Systest()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Session
nnoremap <leader>ss :call MakeSession()<cr>
nnoremap <leader>sl :call LoadSession()<cr>
let g:base_session_dir = $HOME . "/.nvim/sessions"
set ssop-=options       " do not store options (vimrc) in a session
"" Make and load method to save session per dir
function! MakeSession()
    let b:sessiondir = g:base_session_dir . getcwd()
    " let b:sessiondir = $HOME . "/.nvim/sessions" . getcwd()
    if (filewritable(b:sessiondir) != 2)
        exe 'silent !mkdir -p ' b:sessiondir
        redraw!
    endif
    let b:filename = b:sessiondir . '/session.vim'
    exe "mksession! " . b:filename
endfunction
function! LoadSession()
    let b:sessiondir = g:base_session_dir . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
        exe 'source ' b:sessionfile
    else
        echo "No session loaded."
    endif

endfunction

" Auto-commands 
augroup autosourcing
    if(argc() == 0)
        "au VimEnter * nested :call LoadSession() " Uncomment to automatically load session
        au VimLeave * :call MakeSession()
    endif
augroup END
