let g:settings_path='/home/jmcfarland/.config/nvim/settings'

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
