" " previously my .vimrc file had a lot of config without much
" " organization. So with this refactor they are better organized
"
" " Load Plug plugin and define the plugins to be used
" source ~/.vim/parts/plugin.vim
" " General settings
" source ~/.vim/parts/general.vim
" " UI settings, deals with theme, font etc
" source ~/.vim/parts/ui.vim
" " All autocmds are here.
" source ~/.vim/parts/autocmd.vim
" " Plugin specific tunings are here
" source ~/.vim/parts/pluginconf.vim
" " All the mappings are done here
" source ~/.vim/parts/mappings.vim
" " some misc plugins/ functions picked/borrowed from the Internets
" source ~/.vim/parts/misc.vim
"
" "" Reload the vim anytime a change is done in the .vimrc file
" au! BufWritePost ~/.vim/parts/plugin.vim  so %
" au! BufWritePost ~/.vim/parts/general.vim  so %
" au! BufWritePost ~/.vim/parts/ui.vim  so %
" au! BufWritePost ~/.vim/parts/autocmd.vim  so %
" au! BufWritePost ~/.vim/parts/pluginconf.vim  so %
" au! BufWritePost ~/.vim/parts/mappings.vim  so %
" au! BufWritePost ~/.vim/parts/misc.vim  so %
"
" au! BufWritePost .vimrc so % Reload the vim anytime a change is done in the .vimrc file

let g:settings_path=join([$HOME, '.config/nvim/settings'], "/")

function! SourceFile(filename)
    execute("source ".join([g:settings_path, a:filename], "/"))
endfunction

call SourceFile("init.vim")
call SourceFile("general.vim")
call SourceFile("airline.vim")
call SourceFile("autocommands.vim")
call SourceFile("functions.vim")
call SourceFile("keys.vim")
call SourceFile("plugins.vim")
call SourceFile("colorscheme.vim")
