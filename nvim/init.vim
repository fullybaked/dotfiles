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
"  Leader must be set before any leader mappings as it is bound at runtime
let mapleader = "\<Space>"

" easier escaping from home row
inoremap <silent> jj <Esc>

" bounce between two buffers
nnoremap <leader><leader> <c-^>

" turn off linewise keys, always move up/down one line even if wrapped
nnoremap <silent> j gj
nnoremap <silent> k gk

" make Y act like D and C, yank to end of current line
nnoremap <silent> Y y$

"Enable indent folding
set foldenable
set foldmethod=indent
set foldlevel=999

" So I never use s, and I want a single key map to toggle folds, thus
" lower s = toggle <=> upper S = toggle recursive
nnoremap <leader>ff za
nnoremap <leader>FF zA

"Maps for folding, unfolding all
nnoremap <leader>fu zM<CR>
nnoremap <leader>uf zR<CR>

" This will run the macro in q register
nnoremap Q @q

" Swap 0 and ^. I tend to want to jump to the first non-whitespace character
" so make that the easier one to do.
nnoremap 0 ^
nnoremap ^ 0

" Use C-Space to Esc out of any mode
nnoremap <C-Space> <Esc>:noh<CR>
vnoremap <C-Space> <Esc>gV
onoremap <C-Space> <Esc>
cnoremap <C-Space> <C-c>
inoremap <C-Space> <Esc>
" Terminal sees <C-@> as <C-space>
nnoremap <C-@> <Esc>:noh<CR>
vnoremap <C-@> <Esc>gV
onoremap <C-@> <Esc>
cnoremap <C-@> <C-c>
inoremap <C-@> <Esc>

" super fast window movement shortcuts
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Resize windows so current is biggest
set winwidth=100
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=6
set winminheight=6
set winheight=999
" automatically rebalance windows on vim resize
"autocmd VimResized * :wincmd =

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

" quickly open a scratch file in current dir
nnoremap <silent> <Leader>q :enew<cr>

" clean trailing whitespace
nnoremap <silent> <Leader>c :%s/\s\+$//e<cr>

" clear highlighting
nnoremap <silent> <Leader>h :nohl<cr>

" quick newline in normal mode
nnoremap <silent> <Leader><Enter> o<ESC>

" open current dir in netrw
nnoremap <silent> <C-y> :Explore!<cr>
" noop the dash button to stop me fat-fingering it and dropping into netrw
nmap - <Nop>

" open my vimrc
nnoremap <silent> <Leader>i :vs $MYVIMRC<cr>

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

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%
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
set textwidth=119
set colorcolumn=
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
" only 1 space after joining
set nojoinspaces

" --------------------------------------------------
" Custom Commands
" --------------------------------------------------
" force a sudo write on file via :W
command! W w !sudo tee % >/dev/null

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost init.vim source ~/.config/nvim/init.vim

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
call minpac#add('vim-scripts/ReplaceWithRegister')  " Enable gr command to replace motion/object with current anonymous register
call minpac#add('kana/vim-textobj-entire') " Text object for entire buffer with `ae`
call minpac#add('kana/vim-textobj-indent') " Text object for indent level
call minpac#add('kana/vim-textobj-line') " Text object for a line of text
call minpac#add('christoomey/vim-sort-motion') " Sort motion bound to `gs` (sort values in <textobject>)

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
let g:test#preserve_screen = 1

" NeoTerm version
" let g:test#strategy='neoterm'
" nmap <silent> <Leader>tn :belowright Topen <bar> TestNearest<CR>
" nmap <silent> <Leader>tf :belowright Topen <bar> TestFile<CR>
" nmap <silent> <Leader>tl :belowright Topen <bar> TestLast<CR>

" VimTmuxRunner version
let g:test#strategy='vtr'
nmap <silent> <Leader>n :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>l :TestLast<CR>

" --------------------------------------------------
" Better text objects
" --------------------------------------------------
call minpac#add('kana/vim-textobj-user')
call minpac#add('lucapette/vim-textobj-underscore')
call minpac#add('jceb/vim-textobj-uri')
call minpac#add('kana/vim-textobj-indent')
call minpac#add('kana/vim-textobj-line')
call minpac#add('wellle/targets.vim')

" --------------------------------------------------
"  Langauges
" --------------------------------------------------
call minpac#add('mattn/emmet-vim')
call minpac#add('kchmck/vim-coffee-script')
call minpac#add('elixir-editors/vim-elixir')

autocmd FileType text setlocal textwidth=72
autocmd FileType text setlocal nosi

autocmd FileType text :set spl=en_gb spell
autocmd FileType html :set spl=en_gb spell
autocmd FileType markdown :set spl=en_gb spell

" --------------------------------------------------
" Ruby and Rails
" --------------------------------------------------
call minpac#add('tpope/vim-rails')
" Inline ruby execution using #=>
call minpac#add('t9md/vim-ruby-xmpfilter')
" Better block level motions in Ruby
call minpac#add('nelstrom/vim-textobj-rubyblock')
" Jump to FactoryBot definitions
call minpac#add('christoomey/vim-rfactory')

" Enable compiler support for ruby
compiler ruby

autocmd FileType ruby :set foldmethod=syntax
autocmd FileType ruby :set foldlevel=1

autocmd FileType ruby nmap <buffer> <Leader>r <Plug>(xmpfilter-mark)
autocmd FileType ruby nmap <buffer> <Leader>R <Plug>(xmpfilter-run)

" quick versions of the vim-rails helpers for the normal MVC
nmap <Leader>m :Files app/models<cr>
nmap <Leader>v :Files app/views<cr>
nmap <Leader>c :Files app/controllers<cr>
nmap <Leader>j :Files app/assets/javascripts<cr>
nmap <Leader>s :Files app/assets/stylesheets<cr>
" vsplit & jump to the test/class based on the current buffer content
nmap <Leader>a :vs <bar> A<cr>
" open FactoryBot definition in a vertical split
nmap <Leader>f :RVfactory<cr>

" --------------------------------------------------
" HTML / CSS
" --------------------------------------------------
call minpac#add('etdev/vim-hexcolor')
call minpac#add('tpope/vim-ragtag')

" --------------------------------------------------
"  FZF & Silver searcher
"  Assumes FZF & Silver Searcher are installed (via Homebrew)
" --------------------------------------------------
call minpac#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
call minpac#add('junegunn/fzf.vim')

" --------------------------------------------------
" Rails route completion with FZF
" https://blog.semanticart.com/2017/11/14/rails-route-completion-with-fzf-in-vim
" --------------------------------------------------
function! s:parse_route(selected)
  let l:squished = substitute(join(a:selected), '^\s\+', '', '')
  return split(l:squished)[0] . '_path'
endfunction

inoremap <expr> <C-x><C-r> fzf#complete({
  \ 'source': 'rake routes',
  \ 'reducer': '<sid>parse_route'})

" use ack.vim for Silver searcher as ag.vim is deprecated
call minpac#add('mileszs/ack.vim')

set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
let g:ackprg = 'ag --vimgrep'

map <C-s> :Ag!<space>
map <C-f> :FZF<cr>
map <C-t> :Tags<cr>

" --------------------------------------------------
"  Git
" --------------------------------------------------

call minpac#add('tpope/vim-fugitive')
call minpac#add('airblade/vim-gitgutter')

nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gp :Git push<CR>
nnoremap <silent> <Leader>gi :Git add -p %<CR>

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
" align to =
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>

" align to =>
nmap <Leader>ah :Tabularize /=><CR>
vmap <Leader>ah :Tabularize /=><CR>

" align to :<space>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" align to "
nmap <Leader>a" :Tabularize /"<CR>
vmap <Leader>a" :Tabularize /"<CR>

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
command! MakeTags !ctags -R .

" --------------------------------------------------
" Colours and Fonts
" The smyck colour scheme is a not in a format suitable for pack managers, so I
" copied the file and created a repo that was.  Check https://github.com/hukl/Smyck-Color-Scheme
" for the latest version if mine mirror isn't up to date.
" --------------------------------------------------
call minpac#add('fullybaked/smyck.vim')

set t_Co=256
set bg=dark
colorscheme smyck

autocmd ColorScheme * hi clear SignColumn
autocmd ColorScheme * hi GitGutterAdd ctermfg=green ctermbg=none
autocmd ColorScheme * hi GitGutterChange ctermfg=yellow ctermbg=none
autocmd ColorScheme * hi GitGutterDelete ctermfg=red ctermbg=none
autocmd ColorScheme * hi GitGutterChangeDelete ctermfg=yellow ctermbg=none
autocmd ColorScheme * highlight Search ctermbg=none cterm=underline ctermfg=none

hi clear SignColumn
hi GitGutterAdd ctermfg=green ctermbg=none
hi GitGutterChange ctermfg=yellow ctermbg=none
hi GitGutterDelete ctermfg=red ctermbg=none
hi GitGutterChangeDelete ctermfg=yellow ctermbg=none
highlight Search ctermbg=none cterm=underline ctermfg=none

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
let g:airline_theme='bubblegum'
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
" call minpac#add('fishbullet/deoplete-ruby')

let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
" popup menu was appearing as soon as insert mode was entered. 600ms felt about
" right to me as enough of a pause.
let g:deoplete#auto_complete_delay = 300
imap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
set completeopt=longest,menuone
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

" --------------------------------------------------
" Neoterm (Better terminal management)
" --------------------------------------------------
call minpac#add('kassio/neoterm')
let g:neoterm_size = 20
let g:neoterm_autoinsert = 0
let g:neoterm_autoscroll = 1

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
nnoremap <S-T> :Tclose<cr>

" --------------------------------------------------
" Cool tables - like emacs org mode
" --------------------------------------------------
call minpac#add('dhruvasagar/vim-table-mode')
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" --------------------------------------------------
" Syntax linting with ALE
" --------------------------------------------------
call minpac#add('w0rp/ale')

" --------------------------------------------------
" Vim Tmux Runner
" --------------------------------------------------
call minpac#add('christoomey/vim-tmux-runner')
let g:VtrDetachedName = "detached"
let g:VtrPercentage = 30

nmap <silent> <C-e>o :VtrOpenRunner<cr>
nmap <silent> <C-e>f :VtrFocusRunner<cr>
nmap <silent> <C-e>a :VtrAttachToPane<cr>
nmap <silent> <C-e>c :VtrClearRunner<cr>
nmap <silent> <C-e>x :VtrKillRunner<cr>
nmap <silent> <C-e>e :VtrSendLinesToRunner<cr>
nmap <silent> <C-e>b :VtrSendCommandToRunner bundle install<cr>
nmap <silent> <C-e>m :VtrSendCommandToRunner bundle exec rake db:migrate<cr>
nmap <silent> <C-e>r :VtrSendCommandToRunner bundle exec rails console<cr>

" Auto-create directory if it doesn't exist
" :w - will ask to create the dir
" :w! - will force create the dir
" https://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save/42872275#42872275
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir)
          \   && (a:force
          \       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

