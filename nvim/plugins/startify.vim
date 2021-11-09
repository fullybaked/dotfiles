Plug 'mhinz/vim-startify'

let g:startify_custom_header = [
          \'',
          \'',
          \'          ______     _ _      ______       _            _  ',
          \'          |  ___|   | | |     | ___ \     | |          | | ',
          \'          | |_ _   _| | |_   _| |_/ / __ _| | _____  __| | ',
          \'          |  _| | | | | | | | | ___ \/ _` | |/ / _ \/ _` | ',
          \'          | | | |_| | | | |_| | |_/ | (_| |   |  __| (_| | ',
          \'          \_|  \__,_|_|_|\__, \____/ \__,_|_|\_\___|\__,_| ',
          \'                          __/ |                            ',
          \'                         |___/                             ',
          \'           _   _            _   _ _                        ',
          \'          | \ | |          | | | (_)                       ',
          \'          |  \| | ___  ___ | | | |_ _ __ ___               ',
          \'          | . ` |/ _ \/ _ \| | | | | |_ ` _ \              ',
          \'          | |\  |  __| (_) \ \_/ | | | | | | |             ',
          \'          \_| \_/\___|\___/ \___/|_|_| |_| |_|             ',
          \'                                                           ',
          \'',
          \ ]

let g:startify_list_order = [
      \ ['   Recently used files in this dir:'],
      \ 'dir',
      \ ['   Recently used files in general:'],
      \ 'files',
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ['   Sessions:'],
      \ 'sessions',
      \ ]

let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'}, {'z': '~/.zshrc'} ]

" Don't switch the working dir to that of the file being opened
let g:startify_change_to_dir = 0
