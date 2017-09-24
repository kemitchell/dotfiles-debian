fu! WriteMail()
  setlocal textwidth=40

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

	setlocal spell
endfu

autocmd BufNewFile,BufRead *.mail :call WriteMail()
