
set complete+=k

compiler php

" let g:snipMate={}
let g:snipMate.scope_aliases={}
let g:snipMate.scope_aliases.php='php'

autocmd bufnewfile,bufread *.ros,*.inc,*.php set keywordprg="help"

if !exists("g:loaded_cscope_php_db")
    let g:loaded_cscope_php_db = 1
    set nocsverb
    cscope add /Users/weiyuyue/Documents/Private/CodeHub/dict/php/cscope.out
    set csverb
endif

set runtimepath+=$HOME/.vim/vimfiles/phpmanual
setlocal dictionary+=$HOME/.vim/vimfiles/dict/php_funclist.txt
