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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""               通用设置                 """"""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  通用设置
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
let mapleader=','        " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set cmdheight=2          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set cursorline cursorcolumn   " 高亮显示当前行和列
set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
set mouse=a              " 设置鼠标可点击
set clipboard+=unnamed   " 设置vim和系统共用剪贴板 📋

"  缓存设置
set nobackup                " 设置不备份
set noswapfile              " 禁止生成临时文件
set autoread                " 文件在vim之外修改过，自动重新读入
set autowrite               " 设置自动保存
set confirm                 " 在处理未保存或只读文件的时候，弹出确认

"  编码设置
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030

"  卸载默认插件 UnPlug
function! s:deregister(repo)
  let repo = substitute(a:repo, '[\/]\+$', '', '')
  let name = fnamemodify(repo, ':t:s?\.git$??')
  call remove(g:plugs, name)
endfunction
command! -nargs=1 -bar UnPlug call s:deregister(<args>)

"  搜索设置
set hlsearch                " 高亮显示搜索结果
set incsearch               " 开启实时搜索功能
set ignorecase              " 搜索时大小写不敏感
set tags=tags
set autochdir
set modifiable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""             代码缩进和排版              """"""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent              " 设置自动缩进
set cindent                 " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0 " 设置C/C++语言的具体缩进方式
set smartindent             " 智能的选择对其方式
filetype indent on          " 自适应不同语言的智能缩进
set expandtab               " 将制表符扩展为空格
set tabstop=4               " 设置编辑时制表符占用空格数
set shiftwidth=4            " 设置格式化时制表符占用空格数
set softtabstop=4           " 设置4个空格为制表符
set smarttab                " 在行和段开始处使用制表符
set nowrap                  " 禁止折行
set backspace=2             " 使用回车键正常处理indent,eol,start等
set sidescroll=10           " 设置向右滚动字符数
set foldenable              " 启用折叠代码
"set nofoldenable           " 禁用折叠代码
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
set foldlevel=1             " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码
"set foldclose=all          " 设置为自动关闭折叠                
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>  " 用空格键来开关折叠
"  代码补全
set wildmenu                " vim自身命名行模式智能补全
set completeopt-=preview    " 补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""               插件列表                 """"""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
"  VIM Go 语言支持插件: https://github.com/fatih/vim-go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
"  COC vim 插件: https://github.com/neoclide/coc.nvim/wiki
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"  方便的文本编辑插件: https://github.com/chxuan/vim-edit#%E4%BD%BF%E7%94%A8
Plug 'chxuan/vim-edit'
Plug 'flazz/vim-colorschemes'
"  新建文件时，生成预定义代码片段 : https://github.com/chxuan/prepare-code#%E4%BD%BF%E7%94%A8
Plug 'chxuan/prepare-code'
"  vim 的缓冲区操作插件: https://github.com/chxuan/vim-buffer#%E4%BD%BF%E7%94%A8
Plug 'chxuan/vim-buffer'
"  vimplus开始页面
Plug 'chxuan/vimplus-startify'
"  高效的模糊查找器, 比ctrlp更强大的文件的模糊搜索工具: https://github.com/Yggdroot/LeaderF 依赖： ripgrep 安装 automake autoconf ctage
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
"  代码资源管理器: https://github.com/preservim/nerdtree#getting-started
Plug 'preservim/nerdtree'
"  NerdTree 文件类型高亮: https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"  NerdTree 显示 git 状态 : https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
"  显示文件类型图标,配合 NerdTree 使用: https://github.com/ryanoasis/vim-devicons
Plug 'ryanoasis/vim-devicons'
" 状态栏插件, 可以取代powerline的状态栏美化插件: https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"  自动补全引号、圆括号、花括号等: https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'
"  集成 Git 插件: https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'
"  自动增加、替换配对符的插件: https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'
"  快速注释代码插件. 单行注释用 gcc，多行注释先进入可视模式再 gc，取消注释用 gcu : https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'
"  重复上一次操作: https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'
"  markdown: https://blog.csdn.net/techfield/article/details/84186402
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
"  建自己的文本对象插件
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function'
Plug 'sgur/vim-textobj-parameter'
"  补全函数时在命令栏显示函数签名: https://github.com/Shougo/echodoc.vim
Plug 'Shougo/echodoc.vim'
"  让翻页更顺畅: https://github.com/terryma/vim-smooth-scroll
Plug 'terryma/vim-smooth-scroll'
"  缩进改进插件: https://www.vim.org/scripts/script.php?script_id=974
Plug 'vim-scripts/indentpython.vim'
"  vim中文文档: https://github.com/yianwillis/vimcdoc
Plug 'yianwillis/vimcdoc'
"  go install gocode
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' } 

"  加载自定义插件
if filereadable(expand($HOME . '/.vimrc.custom.plugins'))
    source $HOME/.vimrc.custom.plugins
endif
call plug#end()
"  load vim default plugin
runtime macros/matchit.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""               基本操作                 """"""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  编辑 vimrc 相关配置文件
nnoremap <leader>ve :edit $MYVIMRC<cr>
nnoremap <leader>vc :edit ~/.vimrc.custom.config<cr>
nnoremap <leader>vp :edit ~/.vimrc.custom.plugins<cr>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""             插件相关配置                """"""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  prepare-code : https://github.com/chxuan/prepare-code#%E4%BD%BF%E7%94%A8
let g:prepare_code_plugin_path = expand($HOME . "/.vim/plugged/prepare-code")

"  vim-edit
nnoremap Y :CopyText<cr>
nnoremap D :DeleteText<cr>
nnoremap C :ChangeText<cr>
nnoremap <leader>r :ReplaceTo<space>

"  nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName=1
let g:NERDTreeExactMatchHighlightFullName=1
let g:NERDTreePatternMatchHighlightFullName=1
let g:NERDTreeHighlightFolders=1
let g:NERDTreeHighlightFoldersFullName=1
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'
let g:netrw_liststyle=3

"  incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
        \ }

"  LeaderF 配置
"let g:Lf_ShortcutF = "<leader>f"
nnoremap <silent> <leader>f :Leaderf file<CR>
nnoremap <silent> <leader>F :LeaderfFunction<CR>
nnoremap <silent> <leader>rg :Leaderf rg<CR>
" don't show the help in normal mode
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
let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']
let g:Lf_PreviewResult = {
        \ 'File': 0,
        \ 'Buffer': 1,
        \ 'Mru': 0,
        \ 'Tag': 0,
        \ 'BufTag': 1,
        \ 'Function': 1,
        \ 'Line': 1,
        \ 'Colorscheme': 0,
        \ 'Rg': 0,
        \ 'Gtags': 0
        \}
let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','.hg','.idea','.vscode','.wine','.deepinwine','.oh-my-zsh','node_modules'],
        \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','*.lock','*.iml']
        \}
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

"  回车完成补全
"  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
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

"  echodoc.vim
let g:echodoc_enable_at_startup = 1

"  vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"  加载自定义配置
if filereadable(expand($HOME . '/.vimrc.custom.config'))
    source $HOME/.vimrc.custom.config
endif
