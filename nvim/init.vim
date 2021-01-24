" ==================== common config start ==============================

set nocompatible " Use VIM settings rather than Vi settings; this *must* be first in .vimrc

" " Panel switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" " Split panel
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s

" " Map yanked to clipboard
vnoremap <D-c> "*y

syntax enable " enable syntax highglighting
syntax on " turn on syntax highlighting

" 设置 vimrc 修改保存后立刻生效，不用在重新打开
" " 建议配置完成后将这个关闭
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" ========================
" 代码缩进 za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠
" ========================
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 窗格配置
" 跳转至右方的窗口
" nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
" nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
" nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
" nnoremap <Leader>jw <C-W>j

" 编辑相关配置
" 不创建交换文件。交换文件主要用于系统崩溃时恢复文件，文件名的开头是.、结尾是.swp
set noswapfile
" 自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录。该配置可以将工作目录自动切换到，正在编辑的文件的目录。
set autochdir
" 出错时，不要发出响声
set noerrorbells
" 出错时，发出视觉提示，通常是屏幕闪烁
set visualbell
" 打开文件监视。如果在编辑过程中文件发生外部改变，就会发出提示。
set autoread
" 命令模式下，底部操作指令按下 Tab 键自动补全
set wildmenu

" 搜索相关
set hlsearch " highlight the search matches
set incsearch " 部分匹配
set mouse=a
set ic " Ignore Case

set nu " 显示行号
set cursorline
"set cursorcolumn
set showmatch " 显示括号匹配

" tab 缩进
set expandtab " insert space characters whenever the tab key is pressed; C + V + <Tab> 插入真是tab
set tabstop=4 " 设置tab长度为4
set shiftwidth=4 " 自动缩进的长度为4的空格
set autoindent " 继承上一行的缩进方式, 用于多行注释
set softtabstop=4 " case <Tab> and <BS> to insert correct number of spaces
set smarttab " 缩进:shiftwidth, 其他地方使用tabstop和softtabstop; <BS>在一行开头, 删除shiftwidth个空白字符

"set textwidth=100 "设置超过100个字符，自动折行
set encoding=utf8
set fileencodings=utf-8,gb18030
set termencoding=utf8

set backspace=indent,start,eol " make the backspace work

set formatoptions-=ro " 注释行后, 自动添加注释行 +=ro 开启
set wrap " 超出屏幕范围的文本折行显示

" tab -> four spaces
" 百分号（%）表示所有行
nmap <leader>t  :%s/\t/    /g<CR>


" ==================== common config end ==============================

" ==================== provider start =================================

" provider
let g:python3_host_prog = '/usr/local/Cellar/python@3.8/3.8.5/bin/python3'
let g:python_host_prog  = '/usr/bin/python2'
" disable provider
" To disable Python 2 support:
 "let g:loaded_python_provider = 0
"To disable Python 3 support:
"let g:loaded_python3_provider = 0

" ==================== provider end =================================


" ====================  plug start =================================

call plug#begin("~/.config/nvim/plugged")
	" example: https://github.com/pluginOwner/pluginNames
	" Plug 'pluginOwner/pluginNames' 
	Plug 'morhetz/gruvbox'
	" file explorer
	Plug 'preservim/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'Xuyuanp/nerdtree-git-plugin' 
	Plug 'ryanoasis/vim-devicons'
    " file search
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
    " vim-go
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " Code Completion, IntelliSense and Syntax Highlighting
    " LSP language Server Protocol
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Plug 'w0rp/ale'
    "Plug 'sheerun/vim-polyglot'
    " Code comment
    Plug 'preservim/nerdcommenter'
    " vim-airline
    Plug 'vim-airline/vim-airline'
    " thrift
    Plug 'solarnz/thrift.vim'
    Plug 'jiangmiao/auto-pairs'
    "indentLine
    Plug 'Yggdroot/indentLine'
    " rainbow 
    Plug 'luochen1990/rainbow'


call plug#end()

" ====================  plug end =================================

" ====================  plug config start =================================
" gruvbox
if (has("termguicolors"))
     set termguicolors
endif
set background=dark
colorscheme gruvbox

" file explorer
" NERDTree
let g:NERDTreeShowHidden = 1 
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeIgnore = ['^node_modules$'] " ignore node_modules to increase load speed 
let g:NERDTreeStatusline = '' " set to empty to use lightline
" " Toggle
noremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeToggle<CR> " 开启/关闭nerdtree快捷键
" " Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Map to open current file in NERDTree and set size
nnoremap <leader>pv :NERDTreeFind<bar> :vertical resize 45<CR>

" NERDTree Syntax Highlight
" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1 
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1 
" " Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
" " This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {} 
" " Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue 
" " This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {} 
" " Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange 
" " This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {} 
" " Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red 
" " Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige 
" " Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue 


" NERDTree Git Plugin
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

" 缩进指示线 indentLine
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '|'

" for LeaderF
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<c-l>'
let g:Lf_StlColorscheme = 'molokai'
let g:Lf_PreviewInPopup = 1
let g:Lf_WindowHeight = 0.30
let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']
let g:Lf_DefaultExternalTool='rg'
let g:Lf_PreviewResult = {
        \ 'File': 0,
        \ 'Buffer': 1,
        \ 'Mru': 1,
        \ 'Tag': 0,
        \ 'BufTag': 1,
        \ 'Function': 1,
        \ 'Line': 1,
        \ 'Colorscheme': 0,
        \ 'Rg': 0,
        \ 'Gtags': 0
        \}
noremap <leader>f :LeaderfSelf<cr>

" for vim-go
" https://github.com/fatih/vim-go/issues/2760
let g:go_gopls_enabled = 1 " go LSP "go please"
let g:go_def_mode='gopls' " :GoDef use gopls
let g:go_info_mode='gopls' " :GoDef use gopls
let g:go_referrers_mode = 'gopls'
" import on save
let g:go_fmt_command = "goimports"
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" for code comment
" Nerd Commenter
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" " Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" " Map ++ to call NERD Commenter and use iTerm key bindings 
" " to bind Ctmd+/ to ++
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}


" ====================  plug config end =================================

