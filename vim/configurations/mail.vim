fu! WriteMail()
	setlocal spell
	call WrapSettings()
	call AutoCorrect()
endfu

autocmd BufNewFile,BufRead *.mail :call WriteMail()
