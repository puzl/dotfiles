set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs


" Pathogen
"
call ccase#infect()
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
set tags=$TAGFILES
set notagrelative

set number
set mouse=a
set mousehide

set hlsearch
set showmatch
set incsearch
set ignorecase
set autoindent
set history=1000
set cursorline
if has("unnamedplus")
  set clipboard=unnamedplus
elseif has("clipboard")
  set clipboard=unnamed
endif

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Nerdtree
" autocmd vimenter * NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
 


set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar


map <F2> :NERDTreeToggle<CR>
map <F3> :CtrlPBuffer<CR>
map <F4> :TagbarToggle<CR>
map <F6> :tn<CR>
map <F7> :tp<CR>

if has("gui_running")
    colorscheme solarized
    set guifont=Bitstream_Vera_Sans_Mono:h9.5
    set lines=60
    set columns=160
else
    set background=dark
endif

if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help
endif

function! SwitchSourceHeader()
    "comment
    let buffer = ""
    if (expand ("%:e") == "cpp")
        exec ":tag " . expand("%:t:r") . ".h"
    elseif (expand ("%:e") == "c")
        exec ":tag " . expand("%:t:r") . ".h"
    elseif (expand ("%:e") == "h")
        exec ":tag " . expand("%:t:r") . ".cpp"
    endif
endfunction

nmap <F5> :call SwitchSourceHeader()<CR>

