" My global command shortcuts
nmap <leader>w :w!<CR>                          " When I press ",w", write the file
nmap <leader>q :q!<CR>                          " When I press ",q", exit the file, and do it now!
nmap <silent> <C-h> <ESC>:bprevious<CR>         " This is to map  Ctrl+H to select the next buffer
nmap <silent> <C-l> <ESC>:bnext<CR>             " This is to map  Ctrl+L to select the previous buffer
nmap <leader>x :call RunInTerminal()<CR>    " Execute the current file in a buffer
nmap <leader>v :e $HOME/.nvimrc<CR>
inoremap <silent> <leader>c gc
nnoremap <leader>1 :call ToggleLongLines()<CR>



