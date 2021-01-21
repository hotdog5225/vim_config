set nocompatible " Use VIM settings rather than Vi settings; this *must* be
                " first in .vimrc 


" 设置 vimrc 修改保存后立刻生效，不用在重新打开
" " 建议配置完成后将这个关闭
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 配色方案
set background=dark " 指定dark light, 在语法高亮之前
"colorscheme molokai
"colorscheme solarized
"colorscheme darkblue
colorscheme gruvbox

" 语法高亮
syntax enable
syntax on
filetype plugin indent on    " 开启文件类型检测, 缩进格式

" 搜索相关
set hlsearch " highlight the search matches
set incsearch " 部分匹配
set mouse=c
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

" 定义快捷键的前缀，即<Leader>
let mapleader=";" 
 
" statusline 设置
" show file path in vim
set statusline+=%F " %F 完整文件路径
set laststatus=2

" ctags 设置
"set tags=tags;

set autochdir " 自动切换当前目录为当前文件所在的目录

"set textwidth=100 "设置超过100个字符，自动折行
set encoding=utf8
set fileencodings=utf-8,gb18030
set termencoding=utf8

set backspace=indent,start,eol

"set list
"set listchars=eol:$,tab:>-

set wrap " 超出屏幕范围的文本折行显示
set sidescroll=10 " 设置横向滑动的粒度

set formatoptions+=ro " 注释行后, 自动添加注释行 -=ro 关闭

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
nmap <F3> :NERDTreeToggle<CR>
nmap <F4> :TlistToggle<CR>

nmap <F11> :previous<CR>
nmap <F12> :next<CR>

" auto load view when open the file
auto BufWinEnter * silent loadview

" let g:neocomplcache_enable_at_startup=1
"let g:SuperTabDefaultCompletionType="context"

" make Tlist show on right
let Tlist_Use_Right_Window = 1

" insert the modeline
function! AppendModeline()
    let l:modeline=printf(" vim: set ts=%d sw=%d sts=%d tw=%d foldmethod=marker %s: ",
        \ &tabstop, &shiftwidth, &softtabstop, &textwidth, (&expandtab ? "et" : "noet"))
    let l:modeline = substitute(&commentstring, "\\s*%s\\s*", l:modeline, "")
    call append(line("$"), l:modeline)
endfunction

" normal map to \m1
nnoremap <silent> <leader>m1 :call AppendModeline()<CR>


" vim-plug for plug auto install
" https://github.com/junegunn/vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
call plug#begin('~/.vim/plugged')
" pearofducks/ansible-vim : syntax plugin for Ansible 2.x
Plug 'pearofducks/ansible-vim' 
"fuzzy finder
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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
noremap gd :GoDef<CR>



" vim: set ts=4 sw=4 sts=4 tw=100 et:
" vim: set ts=4 sw=4 sts=4 tw=100 foldmethod=marker et: 
