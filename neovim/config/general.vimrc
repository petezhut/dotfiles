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



" Since we can't all be the captain, some of us shall be crew
let mapleader = ","
let g:mapleader = ","
let g:editor_name = 'vim'
let g:mapleader = ','
let g:max_cols = 35
let g:neovim2_venv = $WORKON_HOME."/neovim2/bin/python"
let g:neovim3_venv = $WORKON_HOME."/neovim3/bin/python"

if !empty(glob(g:neovim2_venv))
    let g:python_host_prog = g:neovim2_venv
endif

if !empty(glob(g:neovim3_venv))
    let g:python3_host_prog = g:neovim3_venv
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




augroup filetype_python
    au!
    let g:pymode_rope_completion = 0
    let g:pymode_rope_completion_bind = ''
    let g:pymode_rope_complete_on_dot = 0
    let g:pymode_indent = 0
    let g:pymode_lint = 0
    let g:pymode_virtualenv=1
    let g:pymode_rope=0
    "let b:ale_fix_on_save = 1
    "let b:ale_linters = ['flake8', 'pylint']
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
        let g:lang = "env/bin/python"
    endif
augroup END

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

