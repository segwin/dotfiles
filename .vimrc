set nocompatible               " be iMproved

" ====================================
" First time load, install plugins
" ====================================
if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    if executable('git')
        !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        !vim +PluginInstall +qall && mkdir -p ~/.vim/undo && mkdir -p ~/.vim/swap
    endif
endif

" ====================================
" Plugin Management with Vundle
" ====================================
filetype off                   " must be off before Vundle has run
if isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    set runtimepath+=~/.vim/bundle/Vundle.vim
    " :PluginInstall, PluginUpdate, PluginClean
    call vundle#begin()
    Plugin 'gmarik/Vundle.vim'               " manage Vundle wiht Vundle
    Plugin 'vim-airline/vim-airline'         " nice status bar
    Plugin 'nathanaelkane/vim-indent-guides' " toggle: \-ig
    Plugin 'kshenoy/vim-signature'           " show marks beside line no
    Plugin 'morhetz/gruvbox'                 " Colorscheme
    Plugin 'majutsushi/tagbar'               " Code navigation
    "Plugin 'Valloric/YouCompleteMe'         " Code completion requires clang
    call vundle#end()
endif
filetype plugin indent on     " and turn it back on!


" ====================================
" vim Configuration
" ====================================

" Basic config: line numbers, no line wrap, highlight incremental search,
" remap escape key. Quick config if no .vimrc:
" colo desert |set nu|set nowrap|set hls|set is|inoremap jk <esc>
set nu
set nowrap
set hlsearch
set incsearch
inoremap jk <esc> 

" color theme
syntax enable
set background=dark
try
    colorscheme gruvbox
    let g:gruvbox_contrast_dark = 'hard'
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry

" Identation
set expandtab
set tabstop=4
set shiftwidth=4
set cindent
set autoindent
filetype indent on
autocmd FileType make set noexpandtab
autocmd BufRead,BufNewFile   *.html,*.php setl sw=2 sts=2 et foldmethod=indent
autocmd BufRead,BufNewFile   *.c,*.cpp,*.h setl sw=4 sts=4 et

" End-of-line options
set fileformats=unix,dos

" struct member autocomple, c only, if YCM is not used
set omnifunc=ccomplete#Complete

" Always show status line
set laststatus=2

" Show invisible chars (eol, tabs, trailing space)
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" Use an undo file and set a directory to store the undo history
set undofile
set undodir=~/.vim/undo/

" put swap files in common dir
set backupdir=~/.vim/swap//,.,/tmp
set directory=~/.vim/swap//,.,/tmp

" automatically create folds, open all folds
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

" Ignore whitespace in vimdiff
if &diff
    set diffopt+=iwhite
endif

"  highlight the current line in every window and update the highlight as the
"  cursor moves.
set cursorline


" ====================================
" Plugin Configuration
" ====================================

" vim-airline
" ------------
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1 " needs https://github.com/powerline/fonts
