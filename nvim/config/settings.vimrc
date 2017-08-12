set shell=/bin/zsh                            " preferred shell for terminals
set history=1000
set autoread                                  " reload files if changed in another process
set scrolloff=7                               " n lines of context above and below the cursor
set sidescrolloff=10
set wildmenu                                  " Turn on WiLd menu
set ruler                                     " Always show current position
set cmdheight=1                               " The commandbar height
set hid                                       " Change buffer without saving
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set smartcase                                 " Ignore case when searching lowercase
set incsearch                                 " incremental search, search as you type
set magic                                     " make regular expressions behave sanely (i.e.                       " . " matches any character vs. " \. " )
set showmatch                                 " Show matching bracets when text indicator is over them
set noerrorbells                              " No sound on errors
set novisualbell                              " turn off visual bells too
set nu                                        " print line numbers in gutter
set relativenumber
set numberwidth=4
set list                                      " show trailing whitespace
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set showcmd                                   " Defaults to on for vim anyway, but just in case
set nowrap
set linebreak                                 " Wrap at word
set equalalways                               " Vertical and horizontal splits default to equal sizes when created
set splitbelow splitright
set encoding=utf8
try
  lang en_GB
catch
endtry
set ffs=unix,dos,mac                          " Default file types
set nobackup                                  " Turn backup off, since most stuff is in git anyway...
set nowb
set noswapfile
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set tw=80
set ai                                        " Auto indent
set si                                        " Smart indet
set laststatus=2
set mouse=                                    " disable mouse (it interferes with my terminal selections)
set diffopt+=vertical
