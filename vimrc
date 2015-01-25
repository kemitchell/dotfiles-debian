set shell=zsh

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'L9'
Plugin 'gmarik/Vundle.vim'

" Generic
Plugin 'vim-misc'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ZenCoding.vim'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'Shougo/neocomplcache'
Plugin 'UniCycle'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'krisajenkins/vim-pipe'
Plugin 'mileszs/ack.vim'
Plugin 'repeat.vim'
Plugin 'scrooloose/syntastic'
Plugin 'spiiph/vim-space'
Plugin 'xolox/vim-reload'
Plugin 'groenewege/vim-less'
Plugin 'paredit.vim'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

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

" HTML
Plugin 'mattn/emmet-vim'

call vundle#end()


filetype plugin indent on
syntax enable

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
set showbreak=>>>\ 
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

autocmd FileType ruby,haml,eruby,yaml,sass,cucumber set ai sw=2 sts=2 et
autocmd FileType coffee set ai sw=2 sts=2 et
autocmd FileType php set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab

let g:haddock_browser = "open -a 'Google Chrome'"
let g:ghc = "/usr/local/bin/ghc"
let g:CommandTCancelMap=['<ESC>','<C-c>']
let g:tex_flavor='latex'

let mapleader=","
nnoremap ; :
cnoremap %% <C-R>=expand('%:h').'/'<CR>
inoremap <C-F> <C-O>:exit<Enter>
inoremap <C-S> <C-O>:update<CR>
inoremap <C-l> <C-O>zz
map <C-l> zz
nnoremap <CR> :nohlsearch<CR>

au BufNewFile,BufReadPost Guardfile setl ft=ruby

autocmd FileType pandoc,markdown call WrapSettings()
fu! WrapSettings()
	set spell
	set wrap
	set showbreak=
	noremap  <buffer> <silent> k gk
	noremap  <buffer> <silent> j gj
	noremap  <buffer> <silent> 0 g0
	noremap  <buffer> <silent> $ g$
endfu

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
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
let coffee_linter = '/usr/local/bin/coffeelint'
au BufWritePost *.coffee silent make

let g:Tex_DefaultTargetFormat='pdf'

au BufNewFile,BufReadPost *.py setl expandtab shiftwidth=4 tabstop=4 softtabstop=4

"map <leader>jt <Esc>:%!python -mjson.tool<CR>
" sudo npm -g install jsontool
map <leader>jt <Esc>:%!json<CR>

map <leader>t <Esc>:!runtests<CR>

au BufNewFile,BufReadPost *.jade setl foldmethod=indent
au BufNewFile,BufReadPost *.jade setl shiftwidth=2 expandtab

digraph .. 8230 "ellipsis

au BufRead,BufNewFile,BufReadPost *.pre set filetype=precedent

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Javascript
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
