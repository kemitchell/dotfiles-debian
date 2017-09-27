fu! WriteMail()
	setlocal spell
  set wrap linebreak nolist textwidth=0 wrapmargin=0
	call AutoCorrect()
endfu

autocmd BufNewFile,BufRead *.mail :call WriteMail()
