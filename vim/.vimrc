execute pathogen#infect()

" basic vim settings
set nocompatible
set colorcolumn=120
set number
set mouse+=a
set hidden
set history=100
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set hlsearch
set ignorecase
set smartcase
set incsearch
set laststatus=2

" Syntax highlight and colour scheme
syntax enable
try
    colorscheme peaksea
catch
endtry
set background=dark
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

filetype indent on
filetype plugin on



" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


" Keybindings
let mapleader=" "
map <leader>s :source ~/.vimrc<CR>
nnoremap <Leader><Leader> :e#<CR>
map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W

map <leader>g :Ack<Space>


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
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

"" Clearcase
try
source ~/.vim_plugins/ccase.vim
catch
endtry

let g:ccaseNoComment = 1
"" Clearcase

"" gtags
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

try
cs add GTAGS  /app -a
catch
endtry

try
cs add GTAGS  /system -a
catch
endtry

try
cs add GTAGS  -kernel -a
catch
endtry

try
cs add GTAGS  /hdwr/dprocs -a
catch
endtry

nmap zr :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F6> :cn<CR>
nmap <F7> :cp<CR>
nmap <F8> :cw<CR>
"" gtags 
