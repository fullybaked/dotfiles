" set backspace=eol,start,indent
set colorcolumn=
set equalalways
set history=100
set linebreak
set list
set magic
set mouse=
set noerrorbells
set novisualbell
set nowrap
set ruler
set scrolloff=7
set shell=/bin/zsh
set showcmd
set showmatch
set si
set sidescrolloff=10
set smarttab
set splitbelow splitright
set textwidth=100

set modeline

" use one space, not two, after joining lines
set nojoinspaces

" soft tabs, 2 spaces
set softtabstop=2
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" no backups or swaps, most stuff is in git anyway
set nobackup
set noswapfile
set nowritebackup

" autocomplete with dictionary words when spell check is on
set complete+=kspell

" always use vertical diffs
set diffopt+=vertical

" Don't require saving before closing a buffer
set hidden

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
" vim:ft=vim
