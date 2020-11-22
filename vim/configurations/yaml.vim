augroup yaml
  autocmd!
  autocmd FileType yaml set ai sw=2 sts=2 et
  autocmd FileType yaml setl indentkeys-=<:>
  autocmd FileType yaml call WrapSettings()
augroup END

autocmd BufNewFile,BufRead *.yml set filetype=ansible
autocmd BufNewFile,BufRead *.yaml set filetype=ansible
