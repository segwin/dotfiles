set nocompatible               " be iMproved
filetype off                   " must be off before Vundle has run

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    if executable('git')
        !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        !vim +PluginInstall +qall && mkdir -p ~/.vim/undo && mkdir -p ~/.vim/swap
    endif
endif

if isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    set runtimepath+=~/.vim/bundle/Vundle.vim

    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'

    Plugin 'chazy/cscope_maps'
    Plugin 'vim-airline/vim-airline'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'evgenyzinoviev/vim-vendetta'

    "
    call vundle#end()
endif
filetype plugin indent on     " and turn it back on!


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
syntax enable
set t_Co=256
set background=dark
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

" When you type the first tab hit will complete as much as possible, the 
" second tab hit will provide a list, the third and subsequent tabs will cycle 
" through completion options so you can complete the file without further keys
set wildmode=longest,list,full
set wildmenu

if &diff
    " diff mode
    set diffopt+=iwhite
endif

"let g:indent_guides_start_level=2
"let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black    ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=232

