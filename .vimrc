syntax enable

" Identation
set expandtab
set tabstop=4
set shiftwidth=4
set cindent
filetype indent on
set autoindent

" line numbers and line wrap
set nu
set nowrap

" color theme
set background=dark
let g:solarized_termcolors=256
set term=xterm-256color
colorscheme vendetta 

" End-of-line options
set fileformats=unix,dos

" Search options
set hlsearch
set incsearch


" remap Esc key
inoremap jk <esc> 


" struct member autocomple
set omnifunc=ccomplete#Complete


" Always show status line
set laststatus=2

" Show invisible chars (eol, tabs, trailing space)
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<


" Top tab/buffer bar
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1


" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=~/.vim/undo/

" put swap files in common dir
set backupdir=~/.vim/swap//,.,/tmp
set directory=~/.vim/swap//,.,/tmp

" automatically create folds on indents, open all folds
"set foldmethod=indent
set foldmethod=syntax
set foldlevelstart=20 


" any buffer can be hidden (keeping its changes) without first writing the 
" buffer to a file. This affects all commands and all buffers.
set hidden
