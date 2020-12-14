augroup commonform
  autocmd!
  autocmd FileType commonform setlocal autoindent
  autocmd FileType commonform setlocal shiftwidth=4
  autocmd FileType commonform setlocal tabstop=4
  autocmd FileType commonform setlocal expandtab
  autocmd FileType commonform call WrapSettings()
  autocmd FileType commonform noremap <buffer> <leader>t <Esc>:!cat '%:p' \| m4 \| commonform lint \| sort -u<CR>
  autocmd FileType commonform noremap <buffer> <leader>c <Esc>:!cat '%:p' \| m4 \| commonform critique \| sort -u<CR>
  autocmd FileType commonform abbreviate agt <Agreement>
  autocmd FileType commonform abbreviate co <Company>
augroup END

autocmd BufNewFile,BufRead *.commonform.mustache set filetype=commonform
autocmd BufNewFile,BufRead *.commonform.ejs set filetype=commonform
autocmd BufNewFile,BufRead *.commonform.m4 set filetype=commonform
autocmd BufNewFile,BufRead *.cform set filetype=commonform
autocmd BufNewFile,BufRead *.cform.mustache set filetype=commonform
autocmd BufNewFile,BufRead *.cform.ejs set filetype=commonform
autocmd BufNewFile,BufRead *.cform.m4 set filetype=commonform
autocmd BufNewFile,BufRead *.cftemplate set filetype=commonform

function! MarkUses()
  call feedkeys('ysi":%s/\<C-R>"/<\0>/g<CR>')
endfunction

augroup css
  autocmd!
  autocmd FileType css setlocal autoindent
  autocmd FileType css setlocal shiftwidth=2
  autocmd FileType css setlocal tabstop=2
  autocmd FileType css setlocal expandtab
  autocmd FileType css setlocal foldmethod=syntax
augroup END

autocmd BufNewFile,BufRead *.css set filetype=css

augroup html
  autocmd!
  autocmd FileType html setlocal autoindent
  autocmd FileType html setlocal shiftwidth=2
  autocmd FileType html setlocal tabstop=2
  autocmd FileType html setlocal expandtab
  autocmd FileType html setlocal foldmethod=syntax
augroup END

autocmd BufNewFile,BufRead *.html set filetype=html

augroup ledger
  autocmd!
  autocmd FileType ledger setlocal autoindent
  autocmd FileType ledger setlocal spell
augroup END

autocmd BufNewFile,BufRead *.dat set filetype=ledger

fu! WriteMail()
  call PlainText()
  setlocal spell
  setlocal tw=60
endfu

autocmd BufNewFile,BufRead *.mail :call WriteMail()

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:markdown_enable_spell_checking = 1
let g:markdown_enable_input_abbreviations = 0

augroup markdown
  autocmd!
  autocmd FileType markdown setlocal shiftwidth=2
  autocmd FileType markdown setlocal tabstop=2
  autocmd FileType markdown setlocal expandtab
  autocmd FileType markdown call WrapSettings()
  autocmd FileType markdown setlocal conceallevel=0
  " Common Form
  autocmd FileType markdown noremap <buffer> <leader>L <Esc>:!cat '%:p' \| commonform-commonmark parse --only form \| commonform-lint \| json -a message \| sort -u<CR>
  autocmd FileType markdown noremap <buffer> <leader>C <Esc>:!cat '%:p' \| commonform-commonmark parse --only form \| commonform-critique \| json -a message \| sort -u<CR>
augroup END

autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.markdown set filetype=markdown

fu! PlainText()
  setlocal cpo+=J
  setlocal fo+=anl
  setlocal tw=60
  setlocal spell
endfu

fu! HighlightPronouns()
	highlight Pronouns ctermfg=green
	match Pronouns /\<I\>\|\<me\>\|\<my\>\|\<mine\>\|\<myself\>\|\<you\>\|\<you\>\|\<your\>\|\<yours\>\|\<yourself\>\|\<he\>\|\<him\>\|\<his\>\|\<his\>\|\<himself\>\|\<she\>\|\<her\>\|\<her\>\|\<hers\>\|\<herself\>\|\<it\>\|\<it\>\|\<its\>\|\<its\>\|\<itself\>\|\<we\>\|\<us\>\|\<our\>\|\<ours\>\|\<ourselves\>\|\<you\>\|\<you\>\|\<your\>\|\<yours\>\|\<yourselves\>\|\<they\>\|\<them\>\|\<their\>\|\<theirs\>\|\<themselves\>/
endfu

augroup yaml
  autocmd!
  autocmd FileType yaml set ai sw=2 sts=2 et
  autocmd FileType yaml setl indentkeys-=<:>
  autocmd FileType yaml call WrapSettings()
augroup END

autocmd BufNewFile,BufRead *.yml set filetype=ansible
autocmd BufNewFile,BufRead *.yaml set filetype=ansible
