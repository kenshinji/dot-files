"=========================================================================== "                                ~My vimrc~
"===========================================================================
" Author:        Fred Wang [http://kenshinji.com]
" Source:        https://github.com/kenshinji/dotfiles
"
"---------------------------------------------------------------------

" Want to set this before any others
" Mapping settings
let mapleader = ","
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Add mapping for auto close
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O

function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/git/dotfiles/vim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
        execute 'source' config_file
    endif
  endfor
endfunction

" Setup Vundle to manage my bundles
"-----------------------------------
set nocompatible
filetype off " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call s:SourceConfigFilesIn('rcplugins')
call s:SourceConfigFilesIn('rcfiles')

filetype plugin indent on " required!


" Plugins are each listed in their own file. Loop and source ftw
"----------------------------------------------------------------


syntax on

" Vimrc is split accross multiple files, so loop over and source each
"---------------------------------------------------------------------
call vundle#end()

set incsearch
set hlsearch
set laststatus=2
set relativenumber
set nowritebackup
set nobackup
set ff=unix
set guifont=Monaco:h14
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
" set list

syntax enable
if has('gui_running')
  set background=light
else
  set background=dark
endif
colorscheme solarized

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
    
