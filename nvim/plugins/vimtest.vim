Plug 'vim-test/vim-test'
"
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

let test#strategy = "vtr"
let test#python#runner = 'pyunit'
let test#python#pyunit#executable = 'inv vim-test'
let test#python#djangotest#executable = 'inv vim-test'
