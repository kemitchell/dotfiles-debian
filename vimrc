set shell=zsh

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'L9'
Plugin 'gmarik/Vundle.vim'

Plugin 'AndrewRadev/linediff.vim'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Shougo/neocomplcache'
Plugin 'SirVer/ultisnips'
Plugin 'UniCycle'
Plugin 'ZenCoding.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'alunny/pegjs-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'groenewege/vim-less'
Plugin 'kien/ctrlp.vim'
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
" Plugin 'tpope/vim-markdown'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-misc'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'xolox/vim-reload'
Plugin 'reedes/vim-wordy'

for f in split(glob('~/.vim/configurations/*.vundle'), '\n')
	exec 'source' f
endfor

call vundle#end()

filetype plugin indent on
syntax enable

set modeline
set modelines=2
set history=999
set ruler
set wildmenu
set wildignore+=.git
set nomore
set fileencodings=utf-8
set display=lastline
set nojoinspaces
set complete-=k complete+=k
set nonumber
set showmatch
set matchtime=3
set incsearch
set pastetoggle=<F11>
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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set switchbuf=useopen
set bg=dark
set termencoding=utf8
set diffopt+=vertical
if has('persistent_undo')
	set undodir=$HOME/.vim/undo
	set undofile
endif
if has('gui_running')
    set guifont=Droid\ Sans\ Mono\ 12
	set antialias
	set guioptions-=T
	set guioptions-=m
	set guioptions-=r
	set guioptions-=L
	set guicursor=a:blinkon0
endif
set formatprg=fmt\ -w72\ -u
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
inoremap jk <Esc>
inoremap <C-d> <C-r>=substitute(system('isodate'), '\n\+$', '', '')<CR>
inoremap <C-d><C-d> <C-r>=substitute(system('date --iso-8601'), '\n\+$', '', '')<CR>
inoremap <C-t> <C-r>=substitute(system('date +"%H%M"'), '\n\+', '', '')<CR>
nnoremap <CR> :nohlsearch<CR>
noremap  <leader>t <Esc>:!node-test<CR>
noremap  <leader>u <Esc>:!git add -u && git commit --verbose <CR>
noremap  <leader>U <Esc>:!git add -u && git commit --allow-empty-message --message "" <CR>
noremap  <leader>p <Esc>:!git push && if [ -x "./publish" ] && prompt-y-or-n "Publish?"; then ./publish ; fi<CR><CR>
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

fu! WriteAtEnd()
  normal G
  normal o
  startinsert
endfu

autocmd Filetype pandoc,markdown setlocal autoindent shiftwidth=2 tabstop=2 expandtab
autocmd FileType pandoc,markdown call WrapSettings()

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

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

" Change shape of cursor in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical line in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode

" Change spelling error formatting
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

"Syntastic Recommended
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
