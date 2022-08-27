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

source $HOME/.vim.bases.config
call plug#begin()
source $HOME/.vimrc.plugins
call plug#end()
"  load vim default plugin
runtime macros/matchit.vim
source $HOME/.vim.plugin.setting

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""               基本操作
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  编辑 vimrc 相关配置文件
nnoremap <leader>ve :edit $MYVIMRC<cr>

"  查看 vimplus 的 help.md 文件
nnoremap <leader>h :view +let\ &l:modifiable=0 ~/.vimplus/help.md<cr>

"  打开当前光标所在单词的 vim 帮助文档
nnoremap <leader>H :execute ":help " . expand("<cword>")<cr>

"  重新加载vimrc文件
nnoremap <leader>s :source $MYVIMRC<cr>

"  安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

"  分屏窗口移动
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"  打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""               外观配置                 """"""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  主题设置
set background=dark
let g:gruvbox_termcolors=256
colorscheme gruvbox
if has("termguicolors")
    " fix bug for vim
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
    " enable true color
    set termguicolors
endif

"  状态栏设置 - airline
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

"  LeaderF 配置
nnoremap <silent> <leader>f :Leaderf file<CR>
nnoremap <silent> <leader>F :LeaderfFunction<CR>
nnoremap <silent> <leader>rg :Leaderf rg<CR>
" 不显示 popup 的帮助信息
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
"  let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_ShowDevIcons = 1
let g:Lf_DefaultExternalTool='rg'
let g:Lf_WindowHeight = 0.30
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_WorkingDirectoryMode = 'AF'
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"  完成时预览窗口自动消失
augroup complete
  autocmd!
  autocmd CompleteDone * pclose
augroup end

"  Use `[g` and `]g` to navigate diagnostics
"  Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"  GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


