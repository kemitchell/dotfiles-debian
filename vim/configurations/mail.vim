fu! WriteMail()
  call PlainText()
  "call AutoCorrect()
  setlocal spell
  setlocal tw=60
endfu

autocmd BufNewFile,BufRead *.mail :call WriteMail()
