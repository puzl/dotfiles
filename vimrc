if exists('+shellslash')            " DOS
    set shellslash                  " Get Windows Vim to use forward slashes instead of backslashes
    set shell=C:/cygwin-2.10.0/bin/bash
    set shellcmdflag=-cDone!
    set shellxquote=\"              " bash wants '"' instead of Windows default '('
    let $CHERE_INVOKING=1           " bash opens in working directory
endif

" vim:foldmethod=marker:foldlevel=0
" execute pathogen#infect()

set nocompatible
set paste
set guifont=Consolas:h12

if has("win32") && ! has("win32unix")
    set backupdir=C:/Windows/Temp
    set directory=C:/Windows/Temp
endif

call plug#begin()

" Finding and searching
Plug 'https://github.com/skywind3000/asyncrun.vim'
Plug 'https://github.com/paretje/async-grepper'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/FelikZ/ctrlp-py-matcher'
Plug 'romainl/vim-qf'

if executable('fzf')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
endif

" Text manipulation
Plug 'preservim/nerdcommenter'
"Plug 'tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/vim-scripts/ReplaceWithRegister'
Plug 'christoomey/vim-system-copy'
" UI
Plug 'https://github.com/wellle/context.vim'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/bling/vim-bufferline'
Plug 'https://github.com/junegunn/rainbow_parentheses.vim'
Plug 'https://github.com/junegunn/vim-peekaboo'
Plug 'https://github.com/tpope/vim-dispatch'
Plug 'nathanaelkane/vim-indent-guides'

" Colour schemes
Plug 'https://github.com/embark-theme/vim', { 'as': 'embark' }
Plug 'https://github.com/lunacookies/vim-colors-xcode', {'as' : 'xcode' }
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'https://github.com/morhetz/gruvbox'

" Utils

Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
"Plug 'https://github.com/tomasr/molokai.git'
"Plug 'https://github.com/vim-scripts/peaksea.git'
"Plug 'https://github.com/sjl/badwolf.git'
"Plug 'https://github.com/vim-scripts/Wombat.git'

" Not sure if I use these
"Plug 'https://github.com/tpope/vim-fugitive.git'
"Plug 'https://github.com/ervandew/supertab.git'

if has('nvim')
" NEOVIM Specific

Plug 'https://github.com/nvim-treesitter/nvim-treesitter'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}

else

" VIM specific
Plug 'https://github.com/ivechan/gtags.vim'
endif
call plug#end()

" => UI {{{
""""""""""""""""""""""""""""""
if has("gui_running")
    set guioptions+=c  "no windows dialogs
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set lines=42
    set columns=100
endif

set hidden
set history=100
set nowrap
set ffs=unix,dos,mac
set encoding=utf8
set number
set showcmd
set cursorline
filetype indent on
filetype plugin on
filetype plugin indent on
set lazyredraw
set mouse+=a

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set t_kb=

set wildmenu
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
" }}}

" => make {{{

set makeprg=~/bin/amake

set errorformat=%f:%l:%c:\ %trror:\ %m
set errorformat^=%f:%l:%c:\ %tarning:\ %m

" }}}
" => binds {{{
""""""""""""""""""""""""""""""
let mapleader="," " leader is comma
if has("win32")
    map <leader>s :source ~/_vimrc<CR>
else
    map <leader>s :source ~/.vimrc<CR>
endif

nnoremap <Leader><Leader> :e#<CR>
map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W
"}}}

" => Colours {{{
""""""""""""""""""""""""""""""
syntax enable " Syntax highlight and colour scheme

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

if has_key(plugs, 'gruvbox')
    set background=light
    let g:gruvbox_contrast_dark='hard'
    let g:gruvbox_contrast_light='hard'
    let g:gruvbox_termcolors=256
    let g:gruvbox_improved_strings=1
    colorscheme gruvbox
elseif has_key(plugs, 'onehalf')
    set t_Co=256
    set cursorline
    "colorscheme onehalfdark
    colorscheme onehalflight
elseif has_key(plugs, 'xcode')
    "colorscheme xcode
    colorscheme xcodedark
    "colorscheme xcodedarkhc
    "colorscheme xcodehc
    "colorscheme xcodelight
    "colorscheme xcodelighthc
    "colorscheme xcodewwdc
elseif has_key(plugs, 'embark')
    colorscheme embark
endif
"}}}

" => Spaces and Tabs {{{
""""""""""""""""""""""""""""""
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set smartindent
set autoindent
" }}}

" => folding {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nofoldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

" }}}

" => Searching {{{
""""""""""""""""""""""""""""""
set hlsearch
set ignorecase
set smartcase
set incsearch
set showmatch
" }}}

" => ale {{{
""""""""""""""""""""""""""""""
if has_key(plugs, 'ale')
    let g:ale_pattern_options = {
                \   '/rxd/rmd/e6000/hdwr/dprocs/.*\.c$': {
                \       'ale_linters': ['cppcheck'],
                \       'ale_fixers': ['cppcheck'],
                \   },
                \}
endif
" }}}

" => lightline {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has_key(plugs, 'lightline')
    let g:lightline = {
                \ 'active': {
                \   'left': [ ['mode', 'paste'],
                \             ['gitbranch', 'readonly', 'filename', 'modified'] ],
                \   'right': [ [ 'lineinfo' ], ['percent'] ]
                \ },
                \ 'component_function': {
                \   'gitbranch': 'fugitive#head'
                \ },
                \ 'component': {
                \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
                \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
                \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
                \ },
                \ 'component_visible_condition': {
                \   'readonly': '(&filetype!="help"&& &readonly)',
                \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
                \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
                \ },
                \ 'separator': { 'left': ' ', 'right': ' ' },
                \ 'subseparator': { 'left': ' ', 'right': ' ' }
                \ }

    set laststatus=2 " needed for lightline
endif

" }}}

" => CTRL-P {{{
""""""""""""""""""""""""""""""
if has_key(plugs, 'ctrlp.vim')
    let g:ctrlp_match_window = 'bottom,order:ttb'
    let g:ctrlp_switch_buffer = 0
    let g:ctrlp_working_path_mode = 0
if has("win32") && ! has("win32unix")
    let g:ctrlp_user_command = 'ag.exe %s -l --nocolor -g ""'
else
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
    let g:ctrlp_max_height = 20
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

    map <leader>j :CtrlP<cr>
    map <c-b> :CtrlPBuffer<cr>
    map <leader>o :CtrlPBuffer<cr>
endif
" }}}

" => bufexplorer {{{
""""""""""""""""""""""""""""""
if has_key(plugs, 'bufexplorer')
    let g:bufExplorerDefaultHelp=0
    let g:bufExplorerShowRelativePath=1
    let g:bufExplorerFindActive=1
    let g:bufExplorerSortBy='name'
    map <leader>o :BufExplorer<cr>
endif
" }}}

" => clearcase {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if 1                                        " Clearcase
    function! DosExpandCurrentFile()        " Full DOS pathname of current file
        if exists('+shellslash')            " DOS
            return substitute(expand("%:p"), "/", "\\", "g")
        else
            return substitute (expand("%:p"), getcwd() . "/", "", "")
        endif
    endfun

    function! CleartoolCheckout()
        echom system ("cleartool co -unr -nmaster -nc " . DosExpandCurrentFile())
        if &modified == 1
            echoerr "ERROR: Not auto-loading file as buffer has been modified"
        else
            exe 'e!'
        endif
    endfun

    function CleartoolVtree()
        echom system ("cleartool lsvtree -g " . DosExpandCurrentFile())
    endfun

    function! CleartoolUnCo()               " Cleartool UnCheckout
        let choice = confirm ("Uncheckout " . expand ("%.p") . " ?", "&Yes\n&No", 2)
        if choice == 1
            echom system ("cleartool unco -keep " . DosExpandCurrentFile())
        endif
    endfunction

    function! FixupCs()                     " Fixup configspec
        " Fixup Configspec - change
        "     Checked in "/dir/file" version "\main\47".
        " ->
        "     element /dir/file    /main/47
        execute '%s/^Checked in "/element /g'
        execute '%s/" version "/    /g'
        execute '%s/\\/\//g'
        execute '%s/".//g'
    endfunction


    command! Ctcou call CleartoolCheckout()
    command! Cvt call CleartoolVtree()
    command! Ctunco call CleartoolUnCo()

    command! Fixcs call FixupCs()

endif                                       " Clearcase 
"}}}

" => gnu global {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has_key(plugs, 'gtags.vim')
    let g:Gtags_Auto_Update = 1

    let g:GtagsCscope_Auto_Update = 1
    let g:GtagsCscope_Keep_Alive = 1
    let g:GtagsCscope_Absolute_Path = 1
    let g:GtagsCscope_Auto_Map = 0
    let g:GtagsCscope_Auto_Load =1
    let g:GtagsCscope_Quiet = 1

if ! has('nvim')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
endif
    set cscopetag
    set csprg=gtags-cscope 


    nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap zi :cs find i <C-R>=expand("<cword>")<CR><CR>

    "try 
    "    " Gtags is setup to use tag database in the directories specified in the
    "    " GTAGSLIBPATH.  Parse this variable and auto load them *If* they exist.
    "    for dir in split($GTAGSLIBPATH, ":")
    "        if isdirectory(dir) 
    "            if filereadable(dir . "/GTAGS")
    "                let cscmd = 'cs add ' . dir . '/GTAGS'
    "                silent exec cscmd
    "            endif
    "        endif
    "    endfor
    "catch
    "endtry
endif

" }}}

" => grepper {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>g :Grepper -highlight -query<CR>
" }}}

" => rainbow parentheses {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has_key(plugs, 'rainbow_parentheses')
    " Activation based on file type
    augroup rainbow_c
        autocmd!
        autocmd FileType c,bash RainbowParentheses
    augroup END
endif

" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" => function keys {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

" F1 is help

" F2 - F3 are gtags
nmap <F2>  :Gtags -f %<CR>
nmap <F3>  :Gtags -P <C-R>=expand("<cword>")<CR><CR>
nmap <F4>  :Gtags -r <C-R>=expand("<cword>")<CR><CR>

nmap <F5>  :call ToggleQuickFix()<CR>
nmap <F6>  :cn<CR>
nmap <F7>  :cp<CR>

nmap <F8>  :Grepper -cword -highlight -noprompt<CR><CR>
nmap <F9>  :Grepper -highlight<CR><CR>

nmap <F10> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F11> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <F12>  :Ag<CR>

" }}}


" => context
"let g:context_enabled = 1

let g:notes_directories = ['~/Notes']
if has('nvim')
    lua require('init')
endif

if has_key(plugs, 'fzf')
    " An action can be a reference to a function that processes selected lines
    function! s:build_quickfix_list(lines)
        call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
        copen
        cc
    endfunction

    let g:fzf_action = {
                \ 'ctrl-q': function('s:build_quickfix_list'),
                \ 'ctrl-t': 'tab split',
                \ 'ctrl-x': 'split',
                \ 'ctrl-v': 'vsplit' }

    let g:ctrlp_map = ""
    map <c-p> :FZF<cr>
endif
if has_key(plugs, 'vim-indent-guides')
    let g:indent_guides_enable_on_vim_startup = 1
endif
