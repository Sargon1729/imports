set nocompatible
filetype plugin indent on
set runtimepath=$HOME/imports/.vim,$VIMRUNTIME

"Set theme
syntax on 
colorscheme jellybeans

"show line numbers
set number


if !exists('g:lightline')
  let g:lightline = {}
endif
if !exists('g:lightline.component')
  let g:lightline.component = {}
endif
let g:lightline.component.filename='%F'
