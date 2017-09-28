execute pathogen#infect()
" basic vim settings
set nocompatible
set colorcolumn=90
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

filetype indent on

" Keybindings
let mapleader=" "
map <leader>s :source ~/.vimrc<CR>
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
nnoremap <Leader><Leader> :e#<CR>
map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W
