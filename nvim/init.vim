"
"   ________       _______       ________      ___      ___  ___      _____ ______
"  |\   ___  \    |\  ___ \     |\   __  \    |\  \    /  /||\  \    |\   _ \  _   \
"  \ \  \\ \  \   \ \   __/|    \ \  \|\  \   \ \  \  /  / /\ \  \   \ \  \\\__\ \  \
"   \ \  \\ \  \   \ \  \_|/__   \ \  \\\  \   \ \  \/  / /  \ \  \   \ \  \\|__| \  \
"    \ \  \\ \  \   \ \  \_|\ \   \ \  \\\  \   \ \    / /    \ \  \   \ \  \    \ \  \
"     \ \__\\ \__\   \ \_______\   \ \_______\   \ \__/ /      \ \__\   \ \__\    \ \__\
"      \|__| \|__|    \|_______|    \|_______|    \|__|/        \|__|    \|__|     \|__|
"
" NeoVim Configuration - Dave `fullybaked` Baker - August 2019
"
" This file contains basic foundations to load in the config from the various
" files found in `rcplugins` and `rcfiles`.  This config is _heavily_ influenced
" by Chris Toomey's configuration.

set nocompatible

"  Leader must be set before any leader mappings as it is bound at runtime
let mapleader = "\<Space>"

"  Use minpac to manage packages, first have to install it manually
" git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/opt
packadd minpac
call minpac#init()
" let minpac manage its own updates
call minpac#add('k-takata/minpac', {'type':'opt'})
" Update / Install all packages, then quit Vim.  minpac generally needs a restart
command! PackUpdate call minpac#update('', { 'do': 'quit' })
" Delete all packages that are no longer in the config
command! PackClean call minpac#clean()

" load in config files
function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.config/nvim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

call s:SourceConfigFilesIn('rcplugins')
call s:SourceConfigFilesIn('rcfiles')
