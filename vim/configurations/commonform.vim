augroup commonform
  autocmd!
  autocmd FileType commonform setlocal autoindent
  autocmd FileType commonform setlocal shiftwidth=4
  autocmd FileType commonform setlocal tabstop=4
  autocmd FileType commonform setlocal expandtab
  autocmd FileType commonform call WrapSettings()
  autocmd FileType commonform noremap <buffer> <leader>t <Esc>:!commonform lint < '%:p' \| uniq<CR>
  autocmd FileType commonform noremap <buffer> <leader>c <Esc>:!commonform critique < '%:p' \| sort -u<CR>
  autocmd FileType commonform call AutoCorrect()
augroup END

