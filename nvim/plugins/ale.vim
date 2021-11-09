Plug 'w0rp/ale'

let g:ale_linters = {
      \    'python': ['flake8'],
      \}

let g:ale_fixers = {
      \   'python': [
      \       'isort',
      \       'black',
      \   ],
      \}
let g:ale_fix_on_save = 1
