fu! WriteMail()
	setlocal spell
	setlocal fo+=awn
	call AutoCorrect()
endfu

autocmd BufNewFile,BufRead *.mail :call WriteMail()
