fu! WriteMail()
  call PlainText()
  setlocal tw=60
endfu

autocmd BufNewFile,BufRead *.mail :call WriteMail()
