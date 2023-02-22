" --------------------------------------------------
"  Fuzzy searching
" --------------------------------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }

map <C-f> :Files<cr>
map <C-t> :Tags<cr>
map <Leader>b :Buffers<cr>
map <Leader>s :Ag<cr>

function SearchWordUnderCursor()
  let g:search_term = expand("<cword>")
  call fzf#vim#ag(g:search_term)
endfunction
map <C-s> :call SearchWordUnderCursor()<cr>
