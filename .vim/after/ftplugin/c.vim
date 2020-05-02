
autocmd bufnewfile,bufread *.ros,*.inc,*.php set keywordprg="help"

if !exists("g:loaded_cscope_c_db")
    let g:loaded_cscope_c_db = 1
    set nocsverb
    cscope add /Users/weiyuyue/Documents/Private/CodeHub/dict/c/cscope.out
    set csverb
endif
