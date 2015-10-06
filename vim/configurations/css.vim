let g:syntastic_css_checkers = ['csslint']

augroup css
  autocmd!
  autocmd FileType css setlocal autoindent
  autocmd FileType css setlocal shiftwidth=2
  autocmd FileType css setlocal tabstop=2
  autocmd FileType css setlocal expandtab
  autocmd FileType css setlocal foldmethod=syntax
augroup END

autocmd BufNewFile,BufRead *.css set filetype=css
