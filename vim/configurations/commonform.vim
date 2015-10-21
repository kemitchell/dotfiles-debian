augroup commonform
  autocmd!
  autocmd FileType commonform setlocal autoindent
  autocmd FileType commonform setlocal shiftwidth=4
  autocmd FileType commonform setlocal tabstop=4
  autocmd FileType commonform setlocal expandtab
  autocmd FileType commonform call WrapSettings()
  autocmd FileType commonform call AutoCorrect()
  autocmd FileType commonform noremap <buffer> <leader>t <Esc>:!commonform lint < '%:p' \| uniq<CR>
  autocmd FileType commonform noremap <buffer> <leader>c <Esc>:!commonform critique < '%:p' \| sort -u<CR>
  autocmd FileType commonform abbreviate agt <Agreement>
  autocmd FileType commonform abbreviate co <Company>
  " autocmd FileType commonform spellgood! >'s
  " autocmd FileType commonform spellgood! 16a-1(h)
  " autocmd FileType commonform spellgood! 163(m)
  " autocmd FileType commonform spellgood! 16b-3
  " autocmd FileType commonform spellgood! 16d-3
  " autocmd FileType commonform spellgood! 22(e)(3)
  " autocmd FileType commonform spellgood! 25102(o)
  " autocmd FileType commonform spellgood! 15(d)
  " autocmd FileType commonform spellgood! 13(d)
  " autocmd FileType commonform spellgood! 14(d)
  " autocmd FileType commonform spellgood! 16a-1(b)
  " autocmd FileType commonform spellgood! 12h-1(f)
  " autocmd FileType commonform spellgood! (s)
augroup END

autocmd BufNewFile,BufRead *.commonform.mustache set filetype=commonform
autocmd BufNewFile,BufRead *.commonform.ejs set filetype=commonform
