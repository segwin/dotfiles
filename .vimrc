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
    Plugin 'christoomey/vim-tmux-navigator'  " navigate seamlessly between vim and tmux splits
    Plugin 'Valloric/YouCompleteMe'          " Code completion requires clang
    call vundle#end()
endif
filetype plugin indent on     " and turn it back on!


" ====================================
" vim Configuration
" ====================================

" Basic config: line numbers, no line wrap, highlight incremental search,
" remap escape key. Quick config if no .vimrc:
" colo desert |set nu|set nowrap|set hls|set is|inoremap jk <esc>
" With 4 space tabs:
" colo desert |set nu|set et|set ts=4|set sw=4|set ci|set ai|set nowrap|set hls|set is|inoremap jk <esc>
set nu
set nowrap
set hlsearch
set incsearch
inoremap jk <esc> 

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

" color theme
syntax enable
set background=dark

let g:solarized_termcolors=256
let g:solarized_contrast='high'

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'

try
    "colorscheme solarized
    "set background=dark
    "let g:airline_theme='solarized' "

    colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry

if &term =~ '256color'
    " disable Background Color Erase (BCE)
    set t_ut=
endif

" Indicates a fast terminal connection.  More characters will be sent to the
" screen for redrawing
set ttyfast

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

" Configs for vimdiff
if &diff
    set diffopt+=iwhite             " Ignore whitespace in vimdiff
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

" Toggle line numbers and special characters with <F3>
noremap <F3> :set list!\|set nu!<CR>
inoremap <F3> <C-o>:set list!\|set nu!<CR>

" Toggle paste mode
noremap <F2> :set paste!<CR>
inoremap <F2> <C-o>:set paste!<CR>




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


function! GetVisualSelection() " from http://stackoverflow.com/a/6271254
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ?  1 : 2)]
    let lines[0] = lines[0][col1 - 1:]
    return join(lines, "\n")
endfunction
function! EncodeUrl(url) " Add characters as needed
    let l:encoded=substitute(a:url,     " ",  "\\\\%20", "g") " Space
    let l:encoded=substitute(l:encoded, "&",  "\\\\%26", "g") " Ampersand 
    let l:encoded=substitute(l:encoded, "+",  "\\\\%2B", "g") " Plus 
    let l:encoded=substitute(l:encoded, ",",  "\\\\%2C", "g") " Comma 
    let l:encoded=substitute(l:encoded, "/",  "\\\\%2F", "g") " Forward slash/Virgule 
    let l:encoded=substitute(l:encoded, ":",  "\\\\%3A", "g") " Colon 
    let l:encoded=substitute(l:encoded, ";",  "\\\\%3B", "g") " Semi-colon 
    let l:encoded=substitute(l:encoded, "=",  "\\\\%3D", "g") " Equals 
    let l:encoded=substitute(l:encoded, "?",  "\\\\%3F", "g") " Question mark 
    let l:encoded=substitute(l:encoded, "@",  "\\\\%40", "g") " 'At' symbol 
    let l:encoded=substitute(l:encoded, "?",  "\\\\%22", "g") " Quotation marks
    let l:encoded=substitute(l:encoded, "<",  "\\\\%3C", "g") " 'Less Than' symbol
    let l:encoded=substitute(l:encoded, ">",  "\\\\%3E", "g") " 'Greater Than' symbol
    let l:encoded=substitute(l:encoded, "{",  "\\\\%7B", "g") " Left Curly Brace 
    let l:encoded=substitute(l:encoded, "}",  "\\\\%7D", "g") " Right Curly Brace 
    let l:encoded=substitute(l:encoded, "|",  "\\\\%7C", "g") " Vertical Bar/Pipe 
    let l:encoded=substitute(l:encoded, "~",  "\\\\%7E", "g") " Tilde 
    let l:encoded=substitute(l:encoded, "[",  "\\\\%5B", "g") " Left Square Bracket 
    let l:encoded=substitute(l:encoded, "]",  "\\\\%5D", "g") " Right Square Bracket 
    let l:encoded=substitute(l:encoded, "`",  "\\\\%60", "g") " Grave Accent 
    let l:encoded=substitute(l:encoded, "#",  "\\\\%23", "g") " 'Pound' character
    " let l:encoded=substitute(a:url, %,  \\\\%25, g)     " Percent character
    " let l:encoded=substitute(l:encoded, \\, \\\\%5C, g) " Backslash 
    " let l:encoded=substitute(l:encoded, $,  \\\\%24, g) " Dollar 
    " let l:encoded=substitute(l:encoded, ^,  \\\\%5E, g) " Caret 
    return encoded
endfunction
function! SearchGoogleW3m(str,extra)
    let l:sCmd="w3m www.google.com/search\?q=".EncodeUrl(a:str).a:extra
    "echom l:sCmd
    execute "!" . l:sCmd
endfunction
vnoremap <leader>g :call SearchGoogleW3m(GetVisualSelection(), "")<CR>


if !empty(glob("~/.vim/bundle/tagbar/plugin/tagbar.vim"))
    noremap <leader>t :make TEST=<C-R>=substitute(tagbar#currenttag("%s",""),"()","","")<CR><CR>
else
    echom "Using <cword> for <leader>t"
    noremap <leader>t :make TEST=<C-R>=expand("<cword>")<CR><CR>
endif


