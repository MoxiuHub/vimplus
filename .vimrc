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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set noerrorbells         " 出错时，不要发出响声
set visualbell           " 出错时，发出视觉提示，通常是屏幕闪烁
set history=5000         " Vim 需要记住多少次历史操作
set cmdheight=2          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set showmode             " 在底部显示当前模式
set mouse=a              " 支持使用鼠标
set selectmode=mouse     " 在选择模式下用鼠标来选择文本
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set relativenumber       " 显示光标所在的当前行的相对行号
set cursorline           " 高亮显示当前行
set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
set updatetime=300       " 减少延迟
set signcolumn=yes       " 一直显示列号
set showmatch            " 显示括号匹配
set clipboard=exclude:.* " 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set expandtab            " 将制表符扩展为空格
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
set nowrap               " 禁止折行
set backspace=2          " 使用回车键正常处理indent,eol,start等
"set listchars=tab:»■,trail:■
"set list                 " 如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块
set sidescroll=5          " 设置向右滚动字符数
set linebreak             " 不会在单词内部折行
set wrapmargin=0          " 折行处与编辑窗口的右边缘之间空出的字符数
set sidescrolloff=5       " 水平滚动时，光标距离行首或行尾的位置（字符）
set scrolloff=2           " 垂直滚动时，光标距离顶部/底部的位置（行)
"set nofoldenable         " 禁用折叠代码
set foldmethod=indent
au BufWinLeave * silent mkview  " 保存文件的折叠状态
au BufRead * silent loadview    " 恢复文件的折叠状态
nnoremap <space> za             " 用空格来切换折叠状态
let mapleader=','

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " 命令模式下，底部操作指令按下 Tab 键自动补全
"set wildmode=longest:list,full " 第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令
set completeopt-=preview " 补全时不显示窗口，只显示补全列表
" 使用 TAB 触发器完成与前面的字符和导航。
" NOTE: 使用命令 ':verbose imap <tab>' 确保选项卡没有被映射
" NOTE: 默认情况下总是选择完整的项目，您可能需要启用
" 在你的配置文件中没有选择 `"suggest.noselect": true`。
" 其他插件，然后将其放入您的配置中。
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wrapscan            " 结束后从头搜索
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set smartcase           " 只有一个大写字母的搜索词，将大小写敏感；其他情况都是大小写不敏感
set ignorecase          " 搜索时大小写不敏感

highlight Search ctermbg=yellow ctermfg=black
highlight IncSearch ctermbg=black ctermfg=yellow
highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE
" 当光标一段时间保持不动了，就禁用高亮
" autocmd cursorhold * set nohlsearch
" 当输入查找命令时，再启用高亮
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>

nnoremap <c-h> :call DisableHighlight()<cr>
function! DisableHighlight()
    set nohlsearch
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set nowritebackup       " 只有在编辑时不需要备份文件的情况下才需要
set noswapfile          " 禁止生成临时文件
set undofile            " 保留撤销历史
"set noundofile          " 没有撤消文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
set autochdir           " 自动切换工作目录
set clipboard=unnamed
set pastetoggle=<F9>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
set shell=/bin/bash

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvim/macvim设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    let system = system('uname -s')
    if system == "Darwin\n"
        set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete:h18 " 设置字体
    else
        set guifont=DroidSansMono\ Nerd\ Font\ Regular\ 18      " 设置字体
    endif
    set guioptions-=m           " 隐藏菜单栏
    set guioptions-=T           " 隐藏工具栏
    set guioptions-=L           " 隐藏左侧滚动条
    set guioptions-=r           " 隐藏右侧滚动条
    set guioptions-=b           " 隐藏底部滚动条
    set showtabline=0           " 隐藏Tab栏
    set guicursor=n-v-c:ver5    " 设置光标为竖线
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 卸载默认插件UnPlug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:deregister(repo)
  let repo = substitute(a:repo, '[\/]\+$', '', '')
  let name = fnamemodify(repo, ':t:s?\.git$??')
  call remove(g:plugs, name)
endfunction
command! -nargs=1 -bar UnPlug call s:deregister(<args>)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'fatih/vim-go'  " install: :GoInstallBinaries
Plug 'AndrewRadev/splitjoin.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chxuan/vim-edit'
Plug 'chxuan/prepare-code'
Plug 'chxuan/vimplus-startify'
Plug 'preservim/tagbar'
Plug 'Yggdroot/LeaderF'
Plug 'morhetz/gruvbox'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
Plug 'godlygeek/tabular'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary' " 注释插件:[n]gc
Plug 'tpope/vim-endwise'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-slash'
Plug 'Shougo/echodoc.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" vim-go 
let g:go_list_type = "quickfix"
let g:go_test_timeout = '20s'
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=1


" load vim default plugin
runtime macros/matchit.vim

" 查看vimplus的help文件
nnoremap <leader>h :view +let\ &l:modifiable=0 ~/.vimplus/help.md<cr>

" 打开当前光标所在单词的vim帮助文档
nnoremap <leader>H :execute ":help " . expand("<cword>")<cr>

" 分屏窗口移动
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" 复制当前选中到系统剪切板
vmap <leader><leader>y "+y

" 将系统剪切板内容粘贴到vim
nnoremap <leader><leader>p "+p

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" 主题设置
"colorscheme dracula
colorscheme gruvbox
set background=dark                   " dark / light; Setting mode
let g:gruvbox_transparent_bg=2        " 启用透明背景。
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark='medium'    "更改对比度。medium / hard / medium
let g:gruvbox_contrast_light='medium'   "更改对比度。medium / hard / medium
"  let g:gruvbox_number_column='bg1'
nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>
nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

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
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=20

" prepare-code
let g:prepare_code_plugin_path = expand($HOME . "/.vim/plugged/prepare-code")

" vim-edit
nnoremap Y :CopyText<cr>
nnoremap D :DeleteText<cr>
nnoremap C :ChangeText<cr>
nnoremap <leader>r :ReplaceTo<space>

" nerdtree
" Ctrl+N 打开/关闭
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'
let NERDTreeAutoCenter=1
let NERDTreeWinSize=25
let NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI=1


" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" vim-easymotion
let g:EasyMotion_smartcase = 1
map <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)
" nerdtree-git-plugin
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusConcealBrackets = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
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

" LeaderF 配置
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','dist','build','.idea','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.iml','*.so','*.py[co]']
            \}
let g:Lf_UseCache = 0
let g:Lf_ShowHidden=1
let g:Lf_WindowHeight = 0.30
" 文件搜索
nnoremap <silent> <leader>f :Leaderf file<CR>
" 函数搜索（仅当前文件里）
nnoremap <silent> <leader>F :LeaderfFunction<CR>
" 模糊搜索，很强大的功能，迅速秒搜
nnoremap <silent> <leader>rg :Leaderf rg<CR>
" 历史打开过的文件
nnoremap <silent> <Leader>m :Leaderf mru<CR>
" Buffer
nnoremap <silent> <Leader>b :Leaderf buffer<CR>

" 常用快捷键
nnoremap <silent> <Leader>gb :G blame<CR>
nnoremap <silent> <Leader>gl :G pull<CR>
nnoremap <silent> <Leader>gp :G push<CR>
nnoremap <silent> <Leader>ga :G add -- .<CR>
nnoremap <silent> zz :x<CR>
nnoremap <silent> zw :w<CR>
nnoremap <silent> zq :q!<CR>
nnoremap <silent> ee :Ve<CR>

let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_DefaultExternalTool='rg'
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


" echodoc.vim
let g:echodoc_enable_at_startup = 1

" tabular
nnoremap <leader>l :Tab /\|<cr>
nnoremap <leader>= :Tab /=<cr>

" vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" vimdiff 高亮配置
" 新增的行
hi DiffAdd    ctermbg=235  ctermfg=108  guibg=#262626 guifg=#87af87 cterm=reverse gui=reverse
" 变化的行
hi DiffChange ctermbg=235  ctermfg=103  guibg=#262626 guifg=#8787af cterm=reverse gui=reverse
" 删除的行
hi DiffDelete ctermbg=235  ctermfg=131  guibg=#262626 guifg=#af5f5f cterm=reverse gui=reverse
" 变化的文字
hi DiffText   ctermbg=235  ctermfg=208  guibg=#262626 guifg=#ff8700 cterm=reverse gui=reverse

