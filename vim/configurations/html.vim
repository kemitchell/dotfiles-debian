augroup html
  autocmd!
  autocmd FileType html setlocal autoindent
  autocmd FileType html setlocal shiftwidth=2
  autocmd FileType html setlocal tabstop=2
  autocmd FileType html setlocal expandtab
  autocmd FileType html setlocal foldmethod=syntax
augroup END

autocmd BufNewFile,BufRead *.html set filetype=html
