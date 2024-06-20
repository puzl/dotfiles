if has('win32') || has('win64')
    set runtimepath=c:\cygwin-1.7.31-3\home\hjw\.dotfiles\vim
endif

" vim:foldmethod=marker:foldlevel=0
execute pathogen#infect()
set nocompatible
set paste
set guifont=Consolas:h12

if has("win32") && ! has("win32unix")
    set backupdir=C:/Windows/Temp
    set directory=C:/Windows/Temp
endif


" => lightline {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
colorscheme peaksea

"}}}

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
map <leader>g :Ag<Space>
" }}}

" => bufExplorer plugin {{{
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>
" }}}

" => MRU plugin {{{
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

"}}}

" => CTRL-P {{{
""""""""""""""""""""""""""""""
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0

map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

" }}}

" => clearcase {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if 1                                        " Clearcase
    function! DosExpandCurrentFile()        " Full DOS pathname of current file
        if exists('+shellslash')            " DOS
            return substitute(expand("%:p"), "/", "\\", "g")
        else
            return expand("%:p")
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
    command! Ctcou call CleartoolCheckout()
    command! Cvtree echom system ("clearvtree " . DosExpandCurrentFile())

    function! CleartoolUnCo()               " Cleartool UnCheckout
        let choice = confirm ("Uncheckout " . expand ("%.p") . " ?", "&Yes\n&No", 2)
        if choice == 1
            echom system ("cleartool unco -keep " . DosExpandCurrentFile())
        endif
    endfunction
    command! Ctunco call CleartoolUnCo()

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
    command! Fixcs call FixupCs()

endif                                       " Clearcase 
"}}}

" => gnu global {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Gtags_Auto_Update = 1

let g:GtagsCscope_Auto_Update = 1
let g:GtagsCscope_Keep_Alive = 1
let g:GtagsCscope_Absolute_Path = 1
let g:GtagsCscope_Auto_Map = 0
let g:GtagsCscope_Auto_Load =1
let g:GtagsCscope_Quiet = 0

set cscopequickfix=s-,c-,d-,i-,t-,e-
set cscopetag
set csprg=gtags-cscope 

if filereadable($HOME . "/.vim/manualload/gtags-cscope.vim")
    source $HOME/.vim/manualload/gtags-cscope.vim

    nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap zi :cs find i <C-R>=expand("<cword>")<CR><CR>

    try 
        " Gtags is setup to use tag database in the directories specified in the
        " GTAGSLIBPATH.  Parse this variable and auto load them *If* they exist.
        for dir in split($GTAGSLIBPATH, ":")
            if isdirectory(dir) 
                if filereadable(dir . "/GTAGS")
                    let cscmd = 'cs add ' . dir . '/GTAGS'
                    silent exec cscmd
                endif
            endif
        endfor
    catch
    endtry
endif

" }}}

" => context
let g:context_enabled = 1

" => easy align

nmap ga <Plug>(EasyAlign)

" => rainbow parenthesis
" Activation based on file type
augroup rainbow_c
  autocmd!
  autocmd FileType c,bash RainbowParentheses
augroup END

" => function keys {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F2> :CtrlPBuffer<CR>
nmap <F3> :CtrlP<CR>
nmap <F4> :Gtags -r <C-R>=expand("<cword>")<CR><CR>
nmap <F5> :Gtags -f %<CR>
nmap <F6> :cn<CR>
nmap <F7> :cp<CR>
nmap <F8> :cw<CR>
nmap <F9> :Ag<CR>
" }}}

set backspace=indent,eol,start

" => Spaces and Tabs {{{
""""""""""""""""""""""""""""""
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set smartindent
set autoindent
" }}}
