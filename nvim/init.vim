"
"   ________       _______       ________      ___      ___  ___      _____ ______
"  |\   ___  \    |\  ___ \     |\   __  \    |\  \    /  /||\  \    |\   _ \  _   \
"  \ \  \\ \  \   \ \   __/|    \ \  \|\  \   \ \  \  /  / /\ \  \   \ \  \\\__\ \  \
"   \ \  \\ \  \   \ \  \_|/__   \ \  \\\  \   \ \  \/  / /  \ \  \   \ \  \\|__| \  \
"    \ \  \\ \  \   \ \  \_|\ \   \ \  \\\  \   \ \    / /    \ \  \   \ \  \    \ \  \
"     \ \__\\ \__\   \ \_______\   \ \_______\   \ \__/ /      \ \__\   \ \__\    \ \__\
"      \|__| \|__|    \|_______|    \|_______|    \|__|/        \|__|    \|__|     \|__|
"
" My neovim config file as of October 2017 after a refresh and clean up.
"
" *Warning*
" As I've been using only neovim for the past 6 months, this config assumes nvim and
" does not wrap up settings that could break vim. Some of the package selections
" are also neovim specific and may not work at all, or as expected, in vim.
"
" --------------------------------------------------
" KEY MAPS
" --------------------------------------------------
let mapleader = ","

" easier escaping from home row
inoremap <silent> jj <Esc>
inoremap <silent> kk <Esc>
inoremap <silent> jk <Esc>
inoremap <silent> kj <Esc>

" turn off linewise keys, always move up/down one line even if wrapped
nnoremap <silent> j gj
nnoremap <silent> k gk

" make Y act like D and C, yank to end of current line
nnoremap <silent> Y y$

" use the space key to toggle folds
nnoremap <space> za
vnoremap <space> zf

" super fast window movement shortcuts
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Short cut to splits (\ is the | without a shift)
nnoremap <silent> <Leader>\ :vsp<cr>
nnoremap <silent> <Leader>- :split<cr>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <Leader>/ :wincmd _<cr>:wincmd \|<cr>
nnoremap <Leader>= :wincmd =<cr>

" easier split resizing with cursor keys
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" clean trailing whitespace
nnoremap <silent> <Leader>c :%s/\s\+$//e<cr>

" clear highlighting
nnoremap <silent> <Leader>h :nohl<cr>

" quick newline in normal mode
nnoremap <silent> <Leader><Enter> o<ESC>

" quick new buffer
nnoremap <silent> <Leader>q :enew<cr>

" open current dir in netrw
nnoremap <silent> <C-e> :Explore!<cr>

" open my vimrc
nnoremap <silent> <Leader>vi :vs $MYVIMRC<cr>

" turn wrap on/off
nnoremap <silent> <Leader>W :set wrap<cr>
nnoremap <silent> <Leader>w :set nowrap<cr>

" Move between open buffers.
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

" Emacs-like bindings in the command line from `:h emacs-keys`
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Del>
cnoremap <C-e>  <End>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>
cnoremap <C-p>  <Up>
cnoremap <C-n>  <Down>

" --------------------------------------------------
" OPTIONS
" --------------------------------------------------
" preferred shell for terminals
set shell=/bin/zsh
set history=1000
" reload files if changed in another process
set autoread
" n lines of context above and below the cursor
set scrolloff=7
set sidescrolloff=10
" Turn on WiLd menu
set wildmenu
" Always show current position
set ruler
" The commandbar height
set cmdheight=1
" Change buffer without saving
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Ignore case when searching lowercase
set smartcase
" incremental search, search as you type
set incsearch
" make regular expressions behave sanely (i.e. ' . ' matches any character vs. ' \. ' )
set magic
" Show matching bracets when text indicator is over them
set showmatch
" No sound on errors
set noerrorbells
" turn off visual bells too
set novisualbell
" print line numbers in gutter
set nu
set relativenumber
set numberwidth=4
" show trailing whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" Defaults to on for vim anyway, but just in case
set showcmd
set nowrap
set textwidth=99
set colorcolumn=100
" Wrap at word
set linebreak
" Vertical and horizontal splits default to equal sizes when created
set equalalways
set splitbelow splitright
set encoding=utf8
try
  lang en_GB
catch
endtry
" Default file types
set ffs=unix,dos,mac
" Turn backup off, since most stuff is in git anyway...
set nobackup
set nowb
set noswapfile
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set tw=80
" Auto indent
set ai
" Smart indent
set si
set laststatus=2
" disable mouse (it interferes with my terminal selections)
set mouse=
set diffopt+=vertical


" --------------------------------------------------
" Custom Commands
" --------------------------------------------------
" force a sudo write on file via :W
command! W w !sudo tee % >/dev/null

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" --------------------------------------------------
" Clipboard
" --------------------------------------------------
if (has('clipboard'))
    if (has('unnamedplus')) " When possible use + register for copy-paste
        set clipboard=unnamedplus
    else " if not, use the * register for copy-paste
        set clipboard=unnamed
    endif
endif

" --------------------------------------------------
" PACAKGES
" --------------------------------------------------
"
"  Use minpac to manage packages, first have to install it manually
"
" For neovim
" git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/opt
"
" For vim8
" git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
"
packadd minpac
call minpac#init()
" let minpac manage its own updates
call minpac#add('k-takata/minpac', {'type':'opt'})
" Update / Install all packages, then quit Vim.  minpac generally needs a restart
command! PackUpdate call minpac#update('', { 'do': 'quit' })
" Delete all packages that are no longer in the config
command! PackClean call minpac#clean()

" --------------------------------------------------
"  Smaller 'quality of life' packages
" --------------------------------------------------
runtime macros/matchit.vim                          " Enable extended % matching
call minpac#add('tpope/vim-surround')               " Surrounding characters (ludicrously useful)
call minpac#add('tpope/vim-unimpaired')             " Pairs of handy bracket mappings
call minpac#add('tpope/vim-repeat')                 " Repeat plugin actions (e.g., from vim-surround, vim-unimpaired)
call minpac#add('tpope/vim-endwise')                " Automatically enter closing tokens (e.g., 'end' in Ruby)
call minpac#add('raimondi/delimitmate')             " Auto close quote, parens, braces etc
call minpac#add('christoomey/vim-tmux-navigator')   " Better nav with tmux see https://github.com/christoomey/vim-tmux-navigator
call minpac#add('tpope/vim-commentary')             " Easy line commenting
call minpac#add('sheerun/vim-polyglot')             " Better syntax highlighting support

call minpac#add('tpope/vim-vinegar')                " Better netrw for directory stuff
let g:netrw_liststyle = 1 " Detail View
let g:netrw_sizestyle = "H" " Human-readable file sizes
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' " hide dotfiles
let g:netrw_hide = 1 " hide dotfiles by default
let g:netrw_banner = 0 " Turn off banner

" --------------------------------------------------
"  Code Tools
" --------------------------------------------------
call minpac#add('rizzatti/dash.vim')
nnoremap <silent> <Leader>d <Plug>DashSearch

call minpac#add('janko-m/vim-test')
let g:test#strategy='neoterm'
let g:test#preserve_screen = 1

" --------------------------------------------------
"  Langauges
" --------------------------------------------------
call minpac#add('mattn/emmet-vim')
call minpac#add('kchmck/vim-coffee-script')
call minpac#add('elixir-editors/vim-elixir')

autocmd FileType text :set nospell
autocmd FileType text setlocal textwidth=72
autocmd FileType text setlocal nosi
autocmd FileType text :set spl=en_us spell

autocmd FileType html :set spl=en_us spell

" --------------------------------------------------
"  PHP
" --------------------------------------------------
call minpac#add('stanangeloff/php.vim')
autocmd FileType php setlocal comments=s1:/*,mb:*,ex:*/,://,:#
autocmd FileType php setlocal formatoptions+=cro
autocmd FileType php setlocal expandtab sw=4 sts=4 ts=4
autocmd FileType php :set foldmethod=syntax
autocmd FileType php :set foldlevel=1
let g:phpcomplete_index_composer_command='/usr/local/bin/composer'

" --------------------------------------------------
" Ruby and Rails
" --------------------------------------------------
call minpac#add('tpope/vim-rails')
" Inline ruby execution using #=>
call minpac#add('t9md/vim-ruby-xmpfilter')
" Better block level motions in Ruby
call minpac#add('kana/vim-textobj-user')
call minpac#add('nelstrom/vim-textobj-rubyblock')

" Enable compiler support for ruby
compiler ruby

autocmd FileType ruby :set foldmethod=syntax
autocmd FileType ruby :set foldlevel=1

autocmd FileType ruby nmap <buffer> <Leader>r <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <Leader>r <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <Leader>r <Plug>(xmpfilter-mark)
autocmd FileType ruby nmap <buffer> <Leader>R <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <Leader>R <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <Leader>R <Plug>(xmpfilter-run)

" --------------------------------------------------
"  FZF & Silver searcher
" --------------------------------------------------
"
" assumes FZF & Silver Searcher are installed (via Homebrew)
"
call minpac#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
call minpac#add('junegunn/fzf.vim')
" use ack.vim for Silver searcher as ag.vim is deprecated
call minpac#add('mileszs/ack.vim')

set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
let g:ackprg = 'ag --vimgrep'

map <C-f> :Ag!<space>
map <C-t>b :Buffers<cr>
map <C-t>f :FZF<cr>
map <C-t>h :History<cr>
map <C-t>t :Tags<cr>

" --------------------------------------------------
"  Git
" --------------------------------------------------

call minpac#add('tpope/vim-fugitive')
call minpac#add('airblade/vim-gitgutter')

nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gl :Glog<CR>
nnoremap <silent> <Leader>gp :Git push<CR>
nnoremap <silent> <Leader>gr :Gread<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR>
nnoremap <silent> <Leader>ge :Gedit<CR>
nnoremap <silent> <Leader>gi :Git add -p %<CR>
nnoremap <silent> <Leader>br :Git checkout -b

" --------------------------------------------------
"  BufExplorer
" --------------------------------------------------
call minpac#add('jlanzarotta/bufexplorer')
nnoremap <silent> <Leader>bb :ToggleBufExplorer<CR>

" --------------------------------------------------
"  Tabularize
" --------------------------------------------------
"
" Nice alignments
"
call minpac#add('godlygeek/tabular')
nmap <Leader>a= :Tabularize /=<CR>    " align =
vmap <Leader>a= :Tabularize /=<CR>    " algin =
nmap <Leader>ah :Tabularize /=><CR>   " align =>
vmap <Leader>ah :Tabularize /=><CR>   " align =>
nmap <Leader>a: :Tabularize /:\zs<CR> " align to :<space>
vmap <Leader>a: :Tabularize /:\zs<CR> " align to :<space>
nmap <Leader>a" :Tabularize /"<CR>    " align to "
vmap <Leader>a" :Tabularize /"<CR>    " align to "

" --------------------------------------------------
"  CTags & Tagbar
" --------------------------------------------------
" Requires universal-ctags to be installed https://github.com/universal-ctags/homebrew-universal-ctags
"
call minpac#add('majutsushi/tagbar')
call minpac#add('universal-ctags/ctags')
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_show_linenumbers = 1

map <C-m> :TagbarToggle<CR>

" --------------------------------------------------
"  NERDTree (might remove this soon)
" --------------------------------------------------
call minpac#add('scrooloose/nerdtree')
map <silent> <Leader>n :NERDTreeToggle<CR>

" --------------------------------------------------
" Colours and Fonts
" --------------------------------------------------
call minpac#add('chriskempson/base16-vim')

set guifont=Hasklig:h15

set t_Co=256
set bg=dark
colorscheme base16-oceanicnext

autocmd ColorScheme * hi VertSplit ctermbg=bg ctermfg=bg
autocmd ColorScheme * hi LineNr ctermbg=bg
autocmd ColorScheme * hi CursorLineNR cterm=bold ctermbg=8 ctermfg=15
autocmd ColorScheme * hi clear SignColumn
autocmd ColorScheme * hi GitGutterAdd ctermfg=green ctermbg=bg
autocmd ColorScheme * hi GitGutterChange ctermfg=yellow ctermbg=bg
autocmd ColorScheme * hi GitGutterDelete ctermfg=red ctermbg=bg
autocmd ColorScheme * hi GitGutterChangeDelete ctermfg=yellow ctermbg=bg

hi VertSplit ctermbg=bg ctermfg=bg
hi LineNr ctermbg=bg
hi CursorLineNR cterm=bold ctermbg=8 ctermfg=15
hi clear SignColumn
hi GitGutterAdd ctermfg=green ctermbg=bg
hi GitGutterChange ctermfg=yellow ctermbg=bg
hi GitGutterDelete ctermfg=red ctermbg=bg
hi GitGutterChangeDelete ctermfg=yellow ctermbg=bg

" Trailing whitespace sucks. Show it:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" --------------------------------------------------
" Better status bar / Airline
" --------------------------------------------------
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

let g:airline_powerline_fonts = 1
let g:airline_theme='base16_oceanicnext'
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" --------------------------------------------------
" Deoplete (Autocomplete)
" --------------------------------------------------
call minpac#add('Shougo/deoplete.nvim', {'do': 'UpdateRemotePlugins'})
call minpac#add('Shougo/neosnippet.vim')
call minpac#add('Shougo/neosnippet-snippets')
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_smart_case = 1
imap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
set completeopt=longest,menuone
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

" --------------------------------------------------
" Neoterm (Better terminal management)
" --------------------------------------------------
call minpac#add('kassio/neoterm')

" Key mappings for terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <A-[> <Esc>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <Leader>t :Topen<CR>

