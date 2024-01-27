" disable compatibility with vi, which can cause unexpected issues
set nocompatible

" file type detectiom
filetype on
filetype plugin on
filetype indent on

" tab width
" set tabstop=4

" incremental search
set incsearch

" search highlighting
set hlsearch

" auto completion menu after TAB
set wildmenu

" status line
set statusline=
set statusline+=\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\row:\ %l\ col:\ %c
set laststatus=2

" line number
set number

" syntax color
syntax on
