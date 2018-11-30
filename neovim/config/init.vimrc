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

" Plugins {
call plug#begin($HOME."/.config/nvim/plugged")  "
    Plug 'airblade/vim-gitgutter'               " Show git changes
    Plug 'altercation/vim-colors-solarized'     " Solarized stuff
    Plug 'ctrlpvim/ctrlp.vim'                   " Fuzzy file finder
    Plug 'Chiel92/vim-autoformat'               " Autoformatting of code
    Plug 'Xuyuanp/nerdtree-git-plugin'          " Git plugin for nerdtree
    Plug 'airblade/vim-gitgutter'               " Show git changes
    Plug 'altercation/vim-colors-solarized'     " Solarized stuff
    Plug 'neomake/neomake'                      " Syntax checking
    Plug 'ctrlpvim/ctrlp.vim'                   " Fuzzy file finder
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
    Plug 'sjl/badwolf'                          " Really nice colorscheme
    Plug 'morhetz/gruvbox'                      " Really nice colorscheme
    Plug 'nvie/vim-flake8'                      " Flake8 !
    Plug 'powerline/fonts'                      " Powerline fonts for airline
    Plug 'rking/ag.vim'                         " Silver searcher searching
    Plug 'ryanoasis/vim-devicons'
    Plug 'schickling/vim-bufonly'               " Close all buffers except one
    Plug 'scrooloose/nerdtree'                  " File tree viewer
    Plug 'spf13/vim-colors'                     " Some colors
    Plug 'tpope/vim-commentary'                 " Comment all the things
    Plug 'tpope/vim-vividchalk'                 " Comment all the things
    Plug 'tpope/vim-fugitive'                   " Git stuff
    Plug 'tpope/vim-surround'                   " Surround things with things
    Plug 'tpope/vim-unimpaired'                 " Moving around easier
    Plug 'vim-airline/vim-airline'              " Cool ass statusline
    Plug 'vim-airline/vim-airline-themes'       " Airline themes
    Plug 'vimoutliner/vimoutliner'              " VimOutliner
    Plug 'w0rp/ale'
    Plug 'vimwiki/vimwiki'
    Plug 'nvie/vim-flake8'                      " Flake8 !
    Plug 'vietjtnguyen/toy-blocks'
    Plug 'nightsense/carbonized'
    Plug 'sstallion/vim-wtf'
    Plug 'heavenshell/vim-pydocstring'
    " This has to be loaded after everything else
    " Setting vim specific autocomplete
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
call plug#end()
" }
