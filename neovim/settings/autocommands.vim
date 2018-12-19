" auto reload vimrc/nvimrc/init.vim when editing it
autocmd! bufwritepost .vimrc source $HOME/.vimrc
autocmd! bufwritepost .nvimrc source $HOME/.nvimrc
autocmd! bufwritepost init.vim source $HOME/.config/nvim/init.vim
autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg
autocmd BufWritePre * %s/\s\+$//e
autocmd! BufWritePost * Neomake
autocmd FileType markdown call MarkdownStuff()
autocmd BufRead .nvimrc let b:comment_leader = "\" "
autocmd FileType cfg let b:comment_leader = "; "
autocmd BufRead Dockerfile let b:comment_leader = "# "
autocmd FileType python let g:lang = "python"
autocmd FileType go let g:lang = "go run"
