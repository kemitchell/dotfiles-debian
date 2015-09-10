set shell=zsh

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'L9'
Plugin 'gmarik/Vundle.vim'

Plugin 'Lokaltog/vim-distinguished'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Shougo/neocomplcache'
Plugin 'SirVer/ultisnips'
Plugin 'UniCycle'
Plugin 'ZenCoding.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'groenewege/vim-less'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'krisajenkins/vim-pipe'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'panozzaj/vim-autocorrect'
Plugin 'paredit.vim'
Plugin 'repeat.vim'
Plugin 'scratch.vim'
Plugin 'scrooloose/syntastic'
Plugin 'spiiph/vim-space'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-misc'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'xolox/vim-reload'

for f in split(glob('~/.vim/configurations/*.vundle'), '\n')
	exec 'source' f
endfor

call vundle#end()

filetype plugin indent on
syntax enable

set modeline
set ruler
set nomore
set fileencodings=utf-8
set display=lastline
set nojoinspaces
set complete-=k complete+=k
set nonumber
set showmatch
set incsearch
set ignorecase
set smartcase
set hlsearch
set smarttab
set showcmd
set novisualbell
set noerrorbells
set nowrap
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
nnoremap <CR> :nohlsearch<CR>
noremap  <leader>t <Esc>:!node-test<CR>
noremap  <leader>u <Esc>:!git add -u && git commit <CR>
noremap  <leader>m <Esc>:!make<CR>

" Spelling
map <leader>s :w!<CR>:!aspell check %<CR>:e! %<CR>
set spelllang=en_us
set spellfile=$HOME/.vim/spell/en.utf-8.add

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

autocmd Filetype pandoc,markdown setlocal autoindent shiftwidth=2 tabstop=2 expandtab
autocmd FileType pandoc,markdown call WrapSettings()

autocmd FileType tex call WrapSettings()

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

digraph .. 8230 "ellipsis

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

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

for f in split(glob('~/.vim/configurations/*.vim'), '\n')
	exec 'source' f
endfor

" Rainbow Parentheses

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
