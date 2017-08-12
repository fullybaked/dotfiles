" Package management setup for my Neovim configuration
"
" Uses minpac which needs to be cloned into the home dir first.  This is Vim8 or
" Neovim only!
"
" git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/opt
"
"
packadd minpac
call minpac#init()
"
" let minpac manage its own updates
call minpac#add('k-takata/minpac', {'type':'opt'})
"
" Update / Install all packages, then quit Vim.  minpac generally needs a restart
command! PackUpdate call minpac#update('', { 'do': 'quit' })
"
" Delete all packages that are no longer in the config
command! PackClean call minpac#clean()
