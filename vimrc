set shell=zsh

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'L9'
Plugin 'gmarik/Vundle.vim'

" Generic
Plugin 'panozzaj/vim-autocorrect'
Plugin 'vim-misc'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ZenCoding.vim'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'Shougo/neocomplcache'
Plugin 'UniCycle'
Plugin 'kien/ctrlp.vim'
Plugin 'krisajenkins/vim-pipe'
Plugin 'mileszs/ack.vim'
Plugin 'scratch.vim'
Plugin 'repeat.vim'
Plugin 'scrooloose/syntastic'
Plugin 'spiiph/vim-space'
Plugin 'xolox/vim-reload'
Plugin 'groenewege/vim-less'
Plugin 'paredit.vim'

Bundle 'SirVer/ultisnips'

Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fireplace'

Plugin 'Lokaltog/vim-distinguished'
Plugin 'Lokaltog/vim-easymotion'

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-leiningen'

" Haskell
Plugin 'indenthaskell.vim'

" Ruby
Plugin 'skwp/vim-rspec'
Plugin 'ruby.vim'
Plugin 'tpope/vim-haml'

" Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'raichoo/purescript-vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'JSON.vim'
Plugin 'moll/vim-node'

" Data
Plugin 'avakhov/vim-yaml'

" HTML
Plugin 'mattn/emmet-vim'

Plugin 'commonform/vim-commonform'
call vundle#end()


filetype plugin indent on
syntax enable

set ruler
set nomore
set fileencodings=utf-8
set display=lastline
set nojoinspaces
set complete-=k complete+=k
set number
set showmatch
set incsearch
set ignorecase
set smartcase
set hlsearch
set smarttab
set showcmd
set novisualbell
set noerrorbells
set linebreak
set nowrap
" set showbreak=>>>\ 
set hidden
set wildmenu
set scrolloff=3
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set switchbuf=useopen
set bg=dark
set termencoding=utf8
if has('gui_running')
    set guifont=Droid\ Sans\ Mono\ 12
	set antialias
	set guioptions-=T
	set guioptions-=m
	set guioptions-=r
	set guioptions-=L
	set guicursor=a:blinkon0
endif
set formatprg=par\ -w72r\ -s0
set backspace=indent,eol,start


autocmd FileType ruby,haml,eruby,yaml,sass,cucumber set ai sw=2 sts=2 et
autocmd FileType php set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab

" select last yank
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

let g:haddock_browser = "open -a 'Google Chrome'"
let g:ghc = "/usr/local/bin/ghc"
let g:CommandTCancelMap=['<ESC>','<C-c>']
let g:tex_flavor='latex'

let mapleader=","
nnoremap <C-l> :redraw!<CR>
nnoremap ; :
cnoremap %% <C-R>=expand('%:h').'/'<CR>
inoremap <C-F> <C-O>:exit<Enter>
inoremap <C-S> <C-O>:update<CR>
" inoremap <C-l> <C-O>zz
" map <C-l> zz
nnoremap <CR> :nohlsearch<CR>

fu! WrapSettings()
	setlocal spell
	setlocal wrap
	setlocal showbreak=
	noremap <buffer> <silent> k gk
	noremap <buffer> <silent> j gj
	noremap <buffer> <silent> 0 g0
	noremap <buffer> <silent> $ g$
endfu

au BufNewFile,BufReadPost Guardfile setl ft=ruby

autocmd FileType pandoc,markdown call WrapSettings()

autocmd FileType tex call WrapSettings()
autocmd FileType Rnw call WrapSettings()
let g:Tex_ViewRule_pdf = "open -a texshop"

" Command Line Editing
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"Easier start/end line navigation
noremap H ^
noremap L $

" Backups
set nobackup 
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set nowritebackup

set nofoldenable

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

let g:neocomplcache_enable_at_startup = 1

let g:Tex_DefaultTargetFormat='pdf'

au BufNewFile,BufReadPost *.py setl expandtab shiftwidth=4 tabstop=4 softtabstop=4

au BufNewFile,BufReadPost *.jade setl foldmethod=indent
au BufNewFile,BufReadPost *.jade setl shiftwidth=2 expandtab

digraph .. 8230 "ellipsis

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Javascript
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
" let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_json_checkers = ['jsonval']
let g:syntastic_aggregate_errors = 1

augroup javascript
  autocmd Filetype javascript setlocal autoindent shiftwidth=2 tabstop=2 expandtab
  autocmd FileType javascript noremap <buffer> <leader>t <Esc>:!runtests<CR>
  autocmd FileType javascript noremap <buffer> <leader>c <Esc>:!runcoverage<CR>
  autocmd FileType javascript noremap <buffer> <leader>l <Esc>:!runlint<CR>
  autocmd FileType javascript noremap <buffer> <leader>m <Esc>:!make<CR>
augroup END

" Coffee Script
augroup coffee
  autocmd FileType coffee setlocal foldmethod=indent
  autocmd FileType coffee setlocal shiftwidth=2
  autocmd FileType coffee setlocal expandtab
  autocmd FileType coffee setlocal coffee_linter = '/usr/local/bin/coffeelint'
  autocmd FileType coffee setlocal ai sw=2 sts=2 et
  " au BufWritePost *.coffee silent make
augroup END

let g:syntastic_coffee_checkers = ['coffee', 'coffeelint']

" JSON
autocmd BufRead,BufNewFile *.json set filetype=json 
autocmd BufNewFile,BufRead .jshintrc set filetype=json
autocmd BufNewFile,BufRead .jscsrc set filetype=json

augroup json_autocmd
  autocmd!
  autocmd FileType json setlocal autoindent
  autocmd FileType json setlocal shiftwidth=2
  autocmd FileType json setlocal tabstop=2
  autocmd FileType json setlocal expandtab
  autocmd FileType json setlocal foldmethod=syntax
  autocmd FileType json setlocal formatprg=json
augroup END

" Plain Text
autocmd BufRead,BufNewFile *.txt set filetype=text
augroup text_autocmd
  " autocmd Filetype text setlocal shiftwidth=2 tabstop=2 expandtab
  " autocmd FileType text call WrapSettings()
  " autocmd FileType text call AutoCorrect()
augroup END

" Common Form
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

" YAML
augroup yaml
  autocmd!
  " autocmd FileType yaml setlocal noautoindent
  " autocmd FileType yaml setlocal nocindent
  " autocmd FileType yaml setlocal nosmartindent
  " autocmd FileType yaml setlocal indentexpr=
  autocmd FileType yaml setlocal spell
augroup END

" Ruby
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

" CSS
let g:syntastic_css_checkers = ['csslint']

" ctrlp
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction

if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

fu! WriteMail()
	setlocal spell
	" setlocal nolist
	" setlocal wrap
	" setlocal linebreak
	" setlocal textwidth=0
	" setlocal wrapmargin=0
	" call WrapSettings()
	call AutoCorrect()
endfu
