set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>


set runtimepath^=~/.vim_plugins/

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

"" Basic vim tweaks
set number
set mouse+=a
set nocompatible
set nowrap
set ignorecase
set smartcase
set pastetoggle=<F2>
