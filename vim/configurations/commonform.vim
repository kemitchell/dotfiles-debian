augroup commonform
  autocmd!
  autocmd FileType commonform setlocal autoindent
  autocmd FileType commonform setlocal shiftwidth=4
  autocmd FileType commonform setlocal tabstop=4
  autocmd FileType commonform setlocal expandtab
  autocmd FileType commonform setlocal wrap linebreak nolist spell
  autocmd FileType commonform noremap <buffer> <silent> k gk
  autocmd FileType commonform noremap <buffer> <silent> j gj
  autocmd FileType commonform noremap <buffer> <silent> 0 g0
  autocmd FileType commonform noremap <buffer> <silent> $ g$
  autocmd FileType commonform noremap <buffer> <leader>t <Esc>:!commonform lint < '%:p' \| uniq<CR>
augroup END

