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
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Quiet = 1
set cscopequickfix=s-,c-,d-,i-,t-,e-
set csprg=gtags-cscope 
set cscopetag

cs add GTAGS  /app -a
cs add GTAGS  /system -a
cs add GTAGS  -kernel -a
cs add GTAGS  /hdwr/dprocs -a

nmap zr :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F6> :cn<CR>
nmap <F7> :cp<CR>
nmap <F8> :cw<CR>
