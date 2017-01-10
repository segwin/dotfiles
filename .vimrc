set nocompatible               " be iMproved

" ====================================
" First time load, install plugins
" ====================================
if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    if executable('git')
        !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        !vim +PluginInstall +qall && mkdir -p ~/.vim/undo && mkdir -p ~/.vim/swap
    else
        echom "Please install git to allow plugin configuration through Vundle"
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
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'vim-airline/vim-airline-themes'         " nice status bar
    Plugin 'majutsushi/tagbar'               " Code navigation
    Plugin 'tpope/vim-fugitive'              " git plugin
    Plugin 'scrooloose/nerdtree'             " File explorer
    Plugin 'Xuyuanp/nerdtree-git-plugin'     " git status symbole in NERDTree
    Plugin 'hari-rangarajan/CCTree'          " Call graph, uses cssope
    Plugin 'vim-scripts/DrawIt'              " draw boxes and arrows
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
    let g:solarized_termcolors=256
    let g:gruvbox_contrast_dark = 'hard'
    let g:gruvbox_contrast_light = 'hard'
 "   colorscheme solarized
    colorscheme gruvbox
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

" Show more information while completing tags.
set showfulltag

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
set foldlevelstart=99

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

" Let cursor move past the last char in <C-v> mode
set virtualedit=block

" Keep 10 lines above and below the cursor
set scrolloff=10

" Gvim options
if has("gui_running")
    try
        if has('gui_win32')
            set guifont=Inconsolata-dz_for_Powerline:h10:cANSI
        else
            set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 10
        endif
    catch /^Vim\%((\a\+)\)\=:E596/
        echom "The Inconsolata-dz_for_Powerline font is not installed"
    endtry
endif


"cscope config
if has('cscope')
    set cscopetag

    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif

    if filereadable("cscope.out")
        try
            cs add cscope.out
        catch /^Vim\%((\a\+)\)\=:E568/
        endtry
    endif

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

" ====================================
" Plugin Configuration
" ====================================

" vim-airline
" ------------
"  " don't count trailing whitespace since it lags in huge files
"let g:airline#extensions#whitespace#enabled = 0
"  " put a buffer list at the top
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline#extensions#tabline#buffer_nr_show = 1

"special characters
let g:airline_powerline_fonts = 1 " needs https://github.com/powerline/fonts
" use when a powerline font is not installed, define empty  powerline symbols
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = 'B'
"let g:airline_symbols.readonly = 'R'
"let g:airline_symbols.linenr = 'N'

" NERDTree
" ------------
"autocmd VimEnter * NERDTreeFind
"autocmd VimEnter * wincmd p

" Tagbar
" ------------
"autocmd VimEnter * nested :call tagbar#autoopen(1)


