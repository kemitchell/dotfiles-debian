fu! WriteMail()
  call PlainText()
  setlocal spell
  setlocal tw=60
endfu

autocmd BufNewFile,BufRead *.mail :call WriteMail()
