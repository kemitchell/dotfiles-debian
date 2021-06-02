set shell=zsh

" Plugins
call plug#begin("~/.vim/plug")
Plug 'AndrewRadev/linediff.vim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-voom/VOoM'
call plug#end()

filetype plugin indent on
syntax enable

" Unmap <F1> for help
nmap <F1> <nop>
imap <F1> <nop>

let mapleader=","
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap ; :
cnoremap %% <C-R>=expand('%:h').'/'<CR>
inoremap <C-S> <C-O>:update<CR>
inoremap <C-d> <C-r>=substitute(system('isodate'), '\n\+$', '', '')<CR>
inoremap <C-d><C-d> <C-r>=substitute(system('date --iso-8601'), '\n\+$', '', '')<CR>
inoremap <C-d><C-m> <C-r>=substitute(system('nextmonday'), '\n\+$', '', '')<CR>
inoremap <C-d><C-t> <C-r>=substitute(system('tomorrow'), '\n\+$', '', '')<CR>
inoremap <C-t> <C-r>=substitute(system('date +"%H%M"'), '\n\+', '', '')<CR>
nnoremap <CR> :nohlsearch<CR>
noremap  <leader>t <Esc>:!runtests<CR>
noremap  <leader>c <Esc>:!nodecoverage<CR>
noremap  <leader>u <Esc>:!git add -u<CR>:Git commit<CR>
noremap  <leader>U <Esc>:!git add -u<CR>:Git commit --allow-empty-message --message ""<CR>
noremap  <leader>p <Esc>:Git push<CR>
noremap  <leader>m <Esc>:!make<CR>
noremap  <leader>b <Esc>:!build<CR>
noremap  <leader>w <Esc>:write<CR>
noremap  <leader>x <Esc>:x<CR>
noremap  <leader>s <Esc>:!save<CR><CR>
map <leader>S :w!<CR>:!aspell check %<CR>:e! %<CR>

set conceallevel=0
set diffopt+=vertical
set expandtab
set fileencodings=utf-8
set formatprg=fmt\ -w72\ -u
set hidden
set history=999
set hlsearch
set ignorecase
set matchtime=3
set modeline
set modelines=2
set noerrorbells
set nofoldenable
set nojoinspaces
set nomore
set nonumber
set novisualbell
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set softtabstop=2
set spellfile=$HOME/.vim/spell/en.utf-8.add
set spelllang=en_us
set tabstop=2
set termencoding=utf8

if has('persistent_undo')
	set undodir=$HOME/.vim/undo
	set undofile
endif

fu! WriteMail()
  call PlainText()
  setlocal spell
  setlocal tw=60
endfu

autocmd BufNewFile,BufRead *.mail :call WriteMail()

fu! PlainText()
  setlocal cpo+=J
  setlocal fo+=anl
  setlocal tw=60
  setlocal spell
endfu

fu! WrapSettings()
	setlocal spell
	setlocal wrap
	setlocal linebreak
	setlocal nolist
	setlocal textwidth=0
	setlocal wrapmargin=0
	noremap <buffer> <silent> k gk
	noremap <buffer> <silent> j gj
	noremap <buffer> <silent> 0 g0
	noremap <buffer> <silent> $ g$
endfu

fu! WriteAtEnd()
  normal G
  normal o
  startinsert
endfu

" Easier start/end line navigation
noremap H ^
noremap L $

digraph .. 8230 "ellipsis

" Ctrl-P
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    let g:ctrlp_custom_ignore = 'node_modules\|vendor\|DS_Store\|git'
    let g:ctrlp_user_command = 'ag %s -l --ignore-dir node_modules --ignore-dir vendor --nocolor -g ""'
    let g:ctrlp_dotfiles = 1
    let g:ctrlp_show_hidden = 1
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
  let g:ctrlp_root_markers = ['package.json', 'pom.xml', 'Gopkg.toml', 'Cargo.toml']
endfunction

if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

" UltiSnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Change shape of cursor in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical line in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode

augroup tex
  autocmd!
  autocmd FileType tex setlocal spell
  autocmd FileType tex call WrapSettings()
augroup END

autocmd BufNewFile,BufRead *.tex set filetype=tex
autocmd BufNewFile,BufRead *.latex set filetype=tex
autocmd BufNewFile,BufRead *.xetex set filetype=tex

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
  autocmd FileType markdown set spell
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

autocmd BufNewFile,BufRead *.yml set filetype=yaml
autocmd BufNewFile,BufRead *.yaml set filetype=yaml

autocmd FileType gitcommit setlocal spell
