if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

function! RunInTerminal()
  echo g:lang
    exec 'split | terminal '.g:lang expand('%')
endfunction


" Turning on certain settings:
set autoindent                         " Be a nice editor and indent that for me
set cindent                            " Sometimes you just want to make sure indentation is on
set ignorecase
set smartindent                        " My indentations just got their G.E.D.!
set expandtab                          " Expand tabs to spaces(Python for the win!)
set lazyredraw                         " More page redraw speed up!
set linebreak                          " Turn on linebreaking
set nowrap                             " Don't wrap long lines by default
set number                             " Turn on line numbers
set ruler                              " Turn on the line/column tracker
set showmatch                          " Turn on matching open/close bracket/brace/parens
set smarttab                           " Send indentation to college
set wildmenu                           " Turn on wildmenu
set cursorline
set autoread
set autowrite
set smartcase                          " This makes the usually case-insensitve searches case-sensitive when a capital is used!
set directory=$HOME/.vim/swapfiles//   " Store Swapfiles centrally

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
set wildignore=*.o,*~,*.pyc,*.py0
set clipboard+=unnamed
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor


" My Variables...
let g:Author = "Jason L McFarland"
let g:Nickname = 'the_qe_viking'
let g:Email = 'someone@somewhere.com'

" auto reload vimrc/nvimrc/init.vim when editing it
autocmd! bufwritepost .vimrc source $HOME/.vimrc
autocmd! bufwritepost .nvimrc source $HOME/.nvimrc
autocmd! bufwritepost init.vim source $HOME/.config/nvim/init.vim
autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg


" Since we can't all be the captain, some of us shall be crew
let mapleader = ","
let g:mapleader = ","
let g:editor_name = 'vim'
let g:mapleader = ','
let g:max_cols = 35
let g:editor_name = 'vim'
let g:neovim2_venv = $HOME."/virtual_envs/neovim2/bin/python"
let g:neovim3_venv = $HOME."/virtual_envs/neovim3/bin/python"

if !empty(glob(g:neovim2_venv))
    let g:python_host_prog = g:neovim2_venv
endif

if !empty(glob(g:neovim3_venv))
    let g:python3_host_prog = g:neovim3_venv
endif

if empty(glob('/home/jmcfarland/.vim/autoload/plug.vim'))
  silent !curl -fLo /home/jmcfarland/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" if empty(glob($HOME."/.vim/autoload/plug.vim"))
"   silent !curl - fLo $HOME."/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

if empty(glob($HOME."/.config/nvim/autoload/plug.vim"))
  silent !curl - fLo $HOME."/.config/nvim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('nvim')
    let g:editor_name = 'nvim'
  " Neovim Termainal
  nmap <leader>t :sp term://bash<CR>
  tnoremap <Esc> <C-\><C-n>
  tnoremap <leader>l ls -al <cr>
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
nmap <leader>w :w!<CR>                          " When I press ",w", write the file
nmap <leader>q :q!<CR>                          " When I press ",q", exit the file, and do it now!
nmap <silent> <C-h> <ESC>:bprevious<CR>         " This is to map  Ctrl+H to select the next buffer
nmap <silent> <C-l> <ESC>:bnext<CR>             " This is to map  Ctrl+L to select the previous buffer
nnoremap <leader>x :call RunInTerminal()<CR>    " Execute the current file in a buffer
nmap <leader>v :e $HOME/.nvimrc<CR>
inoremap <silent> <leader>c gc

" Plugins {
call plug#begin($HOME."/.config/nvim/plugged")  "
    Plug 'airblade/vim-gitgutter'               " Show git changes
    Plug 'altercation/vim-colors-solarized'     " Solarized stuff
    "Plug 'challenger-deep-theme/vim'
    Plug 'ctrlpvim/ctrlp.vim'                   " Fuzzy file finder
    Plug 'Chiel92/vim-autoformat'               " Autoformatting of code
    Plug 'Xuyuanp/nerdtree-git-plugin'          " Git plugin for nerdtree
    Plug 'neomake/neomake'                      " Syntax checking
    Plug 'easymotion/vim-easymotion'            " Move more freely
    Plug 'fatih/vim-go'
    Plug 'flazz/vim-colorschemes'               " Color schemes for days
    Plug 'haya14busa/incsearch.vim'             " Better searching
    Plug 'jiangmiao/auto-pairs'                 " Auto pair parens and brackets
    Plug 'jszakmeister/vim-togglecursor'        " Toggle cursor in insert mode
    Plug 'junegunn/fzf', { 'dir':'/home/jmcfarland/.fzf', 'do':'./install --all' }  "Fuzzy Command Line Globbing!
    Plug 'klen/python-mode'                     " Python specific features
    Plug 'rust-lang/rust.vim'                   " Rust all the things!
    Plug 'luochen1990/rainbow'                  " Rainbow parenthesis
    Plug 'majutsushi/tagbar'                    " Browsing tags and stuff
    Plug 'mbbill/undotree'                      " Undo tree
    Plug 'morhetz/gruvbox'                      " Really nice colorscheme
    Plug 'nathanaelkane/vim-indent-guides'      " Indent Guides
    Plug 'nvie/vim-flake8'                      " Flake8 !
    Plug 'powerline/fonts'                      " Powerline fonts for airline
    Plug 'rking/ag.vim'                         " Silver searcher searching
    Plug 'ryanoasis/vim-devicons'
    Plug 'schickling/vim-bufonly'               " Close all buffers except one
    Plug 'scrooloose/nerdtree'                  " File tree viewer
    Plug 'sjl/badwolf'                          " Really nice colorscheme
    Plug 'spf13/vim-colors'                     " Some colors
    Plug 'tpope/vim-commentary'                 " Comment all the things
    Plug 'tpope/vim-fugitive'                   " Git stuff
    Plug 'tpope/vim-surround'                   " Surround things with things
    Plug 'tpope/vim-unimpaired'                 " Moving around easier
    Plug 'vim-airline/vim-airline'              " Cool ass statusline
    Plug 'vim-airline/vim-airline-themes'       " Airline themes
    Plug 'vimoutliner/vimoutliner'              " VimOutliner
    Plug 'w0rp/ale'
    Plug 'vimwiki/vimwiki'
    " This has to be loaded after everything else
    " Setting vim specific autocomplete
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do':':UpdateRemotePlugins' }             " Autocomplete for neovim
    else
        Plug 'Shougo/neocomplete.vim'           " Autocomplete for vim
    endif
    Plug 'nvie/vim-flake8'                      " Flake8 !
    Plug 'vietjtnguyen/toy-blocks'
    Plug 'nightsense/carbonized'
    " Plug 'joshdick/onedark'
    Plug 'sstallion/vim-wtf'
    Plug 'heavenshell/vim-pydocstring'
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
    "let g:airline_theme='tendedeusr'
    let g:airline_theme='deus'
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
" colorscheme vividchalk
colorscheme Spink
nmap <leader>v :e /home/jmcfarland/.nvimrc<CR>

inoremap <silent> <leader>c gc

let g:pymode_options_max_line_length = 120
let g:pymode_options_colorcolumn = 1
" let g:neomake_python_enabled_markers = ['flake8']

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



augroup filetype_python
    au!
    let g:pymode_rope_completion = 0
    let g:pymode_rope_completion_bind = ''
    let g:pymode_rope_complete_on_dot = 0
    let g:pymode_indent = 1
    let g:pymode_lint = 0
    let g:pymode_virtualenv=1
    let g:pymode_rope=0
    "let b:ale_fix_on_save = 1
    let b:ale_linters = ['flake8', 'pylint']
    "let b:ale_fixers = ['autopep8', 'yapf']
    let prefix = ''
    let b:comment_leader = "# "
    let g:is_virtual_env = $VIRTUAL_ENV
    au BufWritePre *.py normal m`:%s/\s\+$//e ``
    au BufWritePre *.py normal m`:%s/\t/\ \ /e ``
    map <silent> <leader>f <ESC>:w\|:call Flake8()<CR>
    set nocindent
    syntax on
    set expandtab
    set copyindent
    set ts=2             " Set the tabstop
    set sts=2            " Set the softtabstop
    set sw=2             " I've been burned by softtabstop and tabstop before
    let g:nord_italic_comments = 1

    let g:lang = "python"
    if isdirectory("env")
        " let prefix = "env/bin/"
        let g:lang = "env/bin/python"
    endif
    au FileType python nnoremap <leader>x :call RunCommand(prefix.'python')<CR>
augroup END

function! MarkdownStuff()
    set wrap
    colorscheme candyman
endfunction

augroup filetype_bash
    au!
    let b:comment_leader = "# "
    let g:lang = "bash"
    set nocindent
    syntax on
augroup END

augroup filetype_go
    au!
    let b:comment_leader = "// "
    let g:lang = "go run"
    set nocindent
augroup END

augroup filetype_rust
    let g:rust_fmt_autosave = 1
    let b:comment_leader = "// "
    let g:lang = "/home/jmcfarland/.cargo/bin/cargo run"
    set nocindent
augroup END


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

nnoremap <leader>1 :call ToggleLongLines()<CR>
colorscheme peaksea

function! StripTrailingWhitespace()
	let l:_s=@/
	let l:l = line('.')
	let l:c = line('.')
	%s/\s\+$//e
	let @/=l:_s
	call cursor(l:l, l:c)
endfunction

nnoremap <Leader>sw :call StripTrailingWhitespace()<CR>
autocmd BufWritePre * %s/\s\+$//e

"autocmd FileType cgcpp,java,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql,groovy,sh autocmd BufWritePre <buffer> :call StripTrailingWhitespace()


autocmd! BufWritePost * Neomake
autocmd FileType markdown call MarkdownStuff()
autocmd BufRead .nvimrc let b:comment_leader = "\" "
autocmd FileType cfg let b:comment_leader = "; "
autocmd BufRead Dockerfile let b:comment_leader = "# "
autocmd FileType python let g:lang = "python"
autocmd FileType go let g:lang = "go run"
