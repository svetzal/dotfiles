Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

command! -bang -nargs=? -complete=dir Files
    \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden'}), <bang>0))

command! -bang -nargs=? -complete=dir AllFiles
    \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden --no-ignore'}), <bang>0))

map <leader>f :Files<CR>
map <leader>F :Files<CR>
map <leader>b :Buffers<CR>
map <leader>h :History<CR>

