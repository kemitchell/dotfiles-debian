augroup ledger
  autocmd!
  autocmd FileType ledger setlocal autoindent
  autocmd FileType ledger setlocal spell
augroup END

autocmd BufNewFile,BufRead *.dat set filetype=ledger
