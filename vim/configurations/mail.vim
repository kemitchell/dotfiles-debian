fu! WriteMail()
<<<<<<< HEAD
  setlocal textwidth=60

  " see :help formatoptions

  " Automatic formatting of paragraphs
	" setlocal formatoptions+=a

  " Auto-wrap using textwidth
	setlocal formatoptions+=t

	" Trailing white space indicates a paragraph continues in the next line.
	"setlocal formatoptions+=w

  " Recognize numbered lists
	setlocal formatoptions+=n

||||||| f18174c... 
	setlocal spell
  set wrap linebreak nolist textwidth=0 wrapmargin=0
=======
	setlocal spell
	call WrapSettings()
>>>>>>> parent of f18174c... 
	call AutoCorrect()

	setlocal spell
endfu

autocmd BufNewFile,BufRead *.mail :call WriteMail()
