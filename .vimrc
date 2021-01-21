" 语法高亮
syntax enable
syntax on

let mapleader = ","

" 配色方案
"colorscheme molokai
colorscheme solarized

" 搜索相关
set hlsearch " highlight the search matches
set incsearch " 部分匹配
set mouse=c
set ic " Ignore Case

" show file path in vim
set statusline+=%F
set laststatus=2

set number
set tags=tags;
set autochdir

set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
"set textwidth=100 "设置超过100个字符，自动折行
set sidescroll=10
set encoding=utf8
set fileencodings=utf-8,gb18030
set termencoding=utf8

set cursorline
"set cursorcolumn
set backspace=indent,start,eol
set autoindent
set expandtab

"set list
"set listchars=eol:$,tab:>-

set wrap

set formatoptions+=ro

" color scheme
set background=dark
colorscheme darkblue


" vim diff
hi DiffChange ctermfg=black ctermbg=yellow
hi cursorcolumn cterm=NONE ctermbg=grey

filetype plugin on
filetype indent on

let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '|'

runtime macros/matchit.vim

" map
" tab -> four spaces
nmap <leader>t  :%s/\t/    /g<CR> 
nmap <F3> :NERDTreeToggle<CR>
nmap <F4> :TlistToggle<CR>

nmap <F5> :w<CR>:make %<CR>

nmap <F9>  :cprev<CR>
nmap <F10> :cnext<CR>

nmap <F11> :previous<CR>
nmap <F12> :next<CR>

nmap <UP> gk
nmap <DOWN> gj
nmap <LEFT> 10zh
nmap <RIGHT> 10zl

" inoremap jk <Esc>

" auto load view when open the file
auto BufWinEnter * silent loadview

" let g:neocomplcache_enable_at_startup=1
let g:SuperTabDefaultCompletionType="context"

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

" vim-go
nnoremap <c-]> :GoDef<cr>
nnoremap <c-t> :GoDefPop<cr>
" https://github.com/fatih/vim-go/issues/2760
let g:go_gopls_enabled = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_referrers_mode = 'gopls'
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 1

" import on save
let g:go_fmt_command = "goimports"


" vim: set ts=4 sw=4 sts=4 tw=100 et:
" vim: set ts=4 sw=4 sts=4 tw=100 foldmethod=marker et: 
