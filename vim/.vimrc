" vim:foldmethod=marker:foldlevel=0
execute pathogen#infect()
set nocompatible
" using Source Code Pro
set anti enc=utf-8
set guifont=Source\ Code\ Pro\ 11

" => lightline {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
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
map <leader>s :source ~/.vimrc<CR>
nnoremap <Leader><Leader> :e#<CR>
map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W
"}}}

" => Colours {{{
""""""""""""""""""""""""""""""
syntax enable " Syntax highlight and colour scheme

colorscheme wombat
"}}}

" => UI {{{
""""""""""""""""""""""""""""""
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
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
set colorcolumn=120
set mouse+=a

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set wildmenu
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
" }}}

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

set foldenable          " enable folding
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
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

" }}}

" => clearcase {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
source ~/.vim_plugins/ccase.vim
catch
endtry

let g:ccaseNoComment = 1
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
try
source ~/.vim_plugins/gtags-cscope.vim
catch
endtry
let GtagsCscope_Auto_Update = 1
let GtagsCscope_Keep_Alive = 1
let GtagsCscope_Absolute_Path = 1
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Quiet = 1
set cscopequickfix=s-,c-,d-,i-,t-,e-
set csprg=gtags-cscope 
set cscopetag

for dir in ['/app', '/system', '/kernel', '/hdwr/dprocs', '/vobs/rpd']
    if isdirectory(dir)
        cs add GTAGS dir -a
    endif
endfor

nmap zr :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>

" }}}

" => function keys {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F2> :CtrlPBuffer<CR>
nmap <F3> :CtrlP<CR>
nmap <F4> :MRU<CR>
nmap <F5> :TagbarToggle<CR>
nmap <F6> :cn<CR>
nmap <F7> :cp<CR>
nmap <F8> :cw<CR>
nmap <F9> :Ag<CR>
" }}}
