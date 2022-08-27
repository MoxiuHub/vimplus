"  _                 __
"  _   __(_)___ ___  ____  / /_  ______ _
"  | | / / / __ `__ \/ __ \/ / / / / __ `/
"  | |/ / / / / / / / /_/ / / /_/ / /_/ /
"  |___/_/_/ /_/ /_/ .___/_/\__,_/\__, /
"                /_/            /____/
" Author: Jonny.Chang <jonny6015@icloud.com>
" Repository: https://github.com/MoxiuHub/vimplus
" Create Date: 2022-08-08
" License: MIT

" common
set autoindent
syntax on
set nu
set ruler
set tabstop=4
set shiftwidth=4
set mouse=a
set clipboard+=unnamed
set backspace=indent,eol,start
set nocompatible
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030

" 插件列表
source $HOME/.vim.plugins

"  编辑 vimrc 相关配置文件
nnoremap <leader>ve :edit $MYVIMRC<cr>

"  查看 vimplus 的 help.md 文件
nnoremap <leader>h :view +let\ &l:modifiable=0 ~/.vimplus/help.md<cr>

"  重新加载vimrc文件
nnoremap <leader>s :source $MYVIMRC<cr>

"  安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

"  打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

"  主题设置
set background=dark
let g:gruvbox_termcolors=256
colorscheme gruvbox
:colo space-vim-dark
if has("termguicolors")
    " fix bug for vim
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
    " enable true color
    set termguicolors
endif
set termguicolors

"netrw
let g:netrw_liststyle=3

"LeaderF 配置
let mapleader=','
nnoremap <silent> <leader>f :Leaderf file<CR>
nnoremap <silent> <leader>F :LeaderfFunction<CR>
nnoremap <silent> <leader>rg :Leaderf rg<CR>
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_DefaultExternal = 'rg'
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)