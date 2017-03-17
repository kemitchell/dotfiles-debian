fu! WriteMail()
	setlocal spell

  setlocal textwidth=65

  " see :help formatoptions

  " Automatic formatting of paragraphs
	" setlocal formatoptions+=a

  " Auto-wrap using textwidth
	setlocal formatoptions+=t

	" Trailing white space indicates a paragraph continues in the next line.
	"setlocal formatoptions+=w

  " Recognize numbered lists
	setlocal formatoptions+=n

	call AutoCorrect()
endfu

autocmd BufNewFile,BufRead *.mail :call WriteMail()
