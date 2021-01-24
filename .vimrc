set nocompatible " Use VIM settings rather than Vi settings; this *must* be
                " first in .vimrc 

" copy paste
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p


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

" ======================== 
" 窗格配置
" ======================== 
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j

" ======================== 
" 配色方案
" ======================== 
set background=dark " 指定dark light, 在语法高亮之前
"colorscheme molokai
"colorscheme solarized
"colorscheme darkblue
colorscheme gruvbox

" ======================================
" 编辑相关配置
" ======================================
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

" 语法高亮
syntax enable
syntax on
filetype plugin indent on    " 开启文件类型检测, 缩进格式

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


" ctags 设置
"set tags=tags;

"set textwidth=100 "设置超过100个字符，自动折行
set encoding=utf8
set fileencodings=utf-8,gb18030
set termencoding=utf8

set backspace=indent,start,eol " make the backspace work 

"set list
"set listchars=eol:$,tab:>-

set wrap " 超出屏幕范围的文本折行显示
set sidescroll=10 " 设置横向滑动的粒度

set formatoptions-=ro " 注释行后, 自动添加注释行 +=ro 开启

" vim diff
hi DiffChange ctermfg=black ctermbg=yellow
hi cursorcolumn cterm=NONE ctermbg=grey

" 缩进指示线 indentLine
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '|'

" runtime macros/matchit.vim " html标签成对跳转

" map
" tab -> four spaces
" 百分号（%）表示所有行
nmap <leader>t  :%s/\t/    /g<CR> 

nmap <F11> :previous<CR>
nmap <F12> :next<CR>

" insert the modeline
function! AppendModeline()
    let l:modeline=printf(" vim: set ts=%d sw=%d sts=%d tw=%d foldmethod=marker %s: ",
        \ &tabstop, &shiftwidth, &softtabstop, &textwidth, (&expandtab ? "et" : "noet"))
    let l:modeline = substitute(&commentstring, "\\s*%s\\s*", l:modeline, "")
    call append(line("$"), l:modeline)
endfunction

" normal map to \m1
nnoremap <silent> <leader>m1 :call AppendModeline()<CR>

" ======================== 
" vim-plug
" ======================== 
call plug#begin('~/.vim/plugged')
" 快速对齐插件
Plug 'junegunn/vim-easy-align'
" pearofducks/ansible-vim : syntax plugin for Ansible 2.x
Plug 'pearofducks/ansible-vim' 
"fuzzy finder
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" LSP language Server Protocol
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" vim-airline statusline
Plug 'vim-airline/vim-airline'
" vim-bookmark
Plug 'MattesGroeger/vim-bookmarks'

Plug 'preservim/nerdtree'

Plug 'solarnz/thrift.vim'

Plug 'jiangmiao/auto-pairs'

call plug#end()

" for ansible-vim
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'

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

" for nerdtree
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings : LSP
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" statusline 设置
" show file path in vim
" set statusline+=%F " %F 完整文件路径
set laststatus=2


" vim: set ts=4 sw=4 sts=4 tw=100 et:
" vim: set ts=4 sw=4 sts=4 tw=100 foldmethod=marker et: 
" vim: set ts=4 sw=4 sts=4 tw=100 foldmethod=marker et: 
