set nocompatible

syntax on
set hlsearch " highlight the search matches
set incsearch
set mouse=c

set number
set tags=tags;
set autochdir

set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set textwidth=100
set sidescroll=10
set encoding=utf8
set fileencodings=utf-8,gb18030
set termencoding=utf8

set cursorline
set cursorcolumn
set backspace=indent,start,eol
set autoindent
set expandtab
set list

set wrap

set formatoptions+=ro

" color scheme
set background=dark
colorscheme darkblue

set listchars=eol:$,tab:>-

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

" vim: set ts=4 sw=4 sts=4 tw=100 et:
