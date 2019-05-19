let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

augroup markdown
  autocmd!
  autocmd FileType markdown setlocal shiftwidth=2
  autocmd FileType markdown setlocal tabstop=2
  autocmd FileType markdown setlocal expandtab
  autocmd FileType markdown call WrapSettings()
augroup END

autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.markdown set filetype=markdown
