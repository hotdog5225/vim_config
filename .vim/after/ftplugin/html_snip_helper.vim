
" Automatically closes tag if in xhtml
fun! Close() abort
	return stridx(&ft, 'xhtml') == -1 ? '' : ' /'
endf
