""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim main configuration file
"
" Plugin manager: vim plug - https://github.com/junegunn/vim-plug
" To install:
"
" :PlugInstall
"
" Maintainer: sheoak
" Version:    O.3
"
" See README.md and documentation for more informations
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vimpath = "~/.config/nvim/"
if has('nvim')
    let s:plug_path=$HOME . '/.local/share/nvim/plugged'
else
    let s:plug_path=$HOME . '/.vim/plugged'
endif

call plug#begin(s:plug_path)
    execute "source " . s:vimpath . "plugin.vim"
call plug#end()

execute "source " . s:vimpath . "setting.vim"
execute "source " . s:vimpath . "autocommand.vim"

" default and individual plugin settings (for complex settings)
for path in split(glob(s:vimpath. 'plugin.*.vim'), '\n')
    execute "source " . path
endfor

" custom mappings, including plugin mappings
execute "source " . s:vimpath . "mapping.vim"

" Load private files (bookmarks, custom alias…)
" use runtimepath so that you can have plugin/ after/… folders
if (!empty($DOTFILES_PRIVATE))
    exe "set runtimepath+=" . expand($DOTFILES_PRIVATE . "/nvim/")
endif
