set shell=zsh

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" needed for Vundle
Plugin 'L9'
" plugin framework
Plugin 'gmarik/Vundle.vim'
" line diff
Plugin 'AndrewRadev/linediff.vim'
" a dark vim color scheme for 256-color terminals
Plugin 'Lokaltog/vim-distinguished'
" <Leader><Leader><motion> jump highlighting
Plugin 'Lokaltog/vim-easymotion'
" dark powered asynchronous completion framework for neovim/Vim8
Plugin 'Shougo/deoplete.nvim'
" snippets
Plugin 'SirVer/ultisnips'
" Git status in gutter
Plugin 'airblade/vim-gitgutter'
" .editorconfig support
Plugin 'editorconfig/editorconfig-vim'
" Vim syntax for LESS (CSS)
Plugin 'groenewege/vim-less'
" Ctrl+P fle switching
Plugin 'ctrlpvim/ctrlp.vim'
" expands abbreviations for, e.g., HTML tags
Plugin 'mattn/emmet-vim'
" highlight trailing whitespace
Plugin 'ntpeters/vim-better-whitespace'
" paredit emulation
Plugin 'paredit.vim'
" repeat with ".".
Plugin 'tpope/vim-repeat'
" nobtrusive scratch window
Plugin 'scratch.vim'
" asynchronous linting
Plugin 'w0rp/ale'
" enhanced ga character info
Plugin 'tpope/vim-characterize'
" gcc, gc<motion>, gcap to comment out
Plugin 'tpope/vim-commentary'
" automatically add "end" in ruby, vimscript, &c.
Plugin 'tpope/vim-endwise'
" Unix sugar, e.g. :Delete, :Move, :Rename
Plugin 'tpope/vim-eunuch'
" align text
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plugin 'godlygeek/tabular'
" surround in quotes, parens, &c.
Plugin 'tpope/vim-surround'
" bracket mappings
Plugin 'tpope/vim-unimpaired'
" :BufOnly command
Plugin 'vim-scripts/BufOnly.vim'
" required by vim-reload
Plugin 'vim-misc'
" automatically reload VimScripts on edit
Plugin 'xolox/vim-reload'
" two-pane outliner
Plugin 'vim-voom/VOoM'
" LanguageTool Grammar Checking
Plugin 'rhysd/vim-grammarous'

for f in split(glob('~/.vim/configurations/*.vundle'), '\n')
	exec 'source' f
endfor

call vundle#end()

filetype plugin indent on
syntax enable

set autoindent
set backspace=indent,eol,start
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set bg=dark
set complete-=k complete+=k
set conceallevel=0
set cryptmethod=blowfish2
set diffopt+=vertical
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp "swap
set display=lastline
set encoding=utf-8 " Necessary to show unicode glyphs
set expandtab
set fileencodings=utf-8
set formatprg=fmt\ -w72\ -u
set hidden
set history=999
set hlsearch
set ignorecase
set incsearch
set laststatus=2   " Always show the statusline
set matchtime=3
set modeline
set modelines=2
set noerrorbells
set nofoldenable
set nojoinspaces
set nomore
set nonumber
set novisualbell
set nowrap
set pastetoggle=<F2>
set ruler
set scrolloff=3
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set smarttab
set softtabstop=2
set spellfile=$HOME/.vim/spell/en.utf-8.add
set spelllang=en_us
set switchbuf=useopen
set tabstop=2
set termencoding=utf8
set updatetime=100
set wildignore+=.git
set wildmenu

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

" Unmap <F1> for help
nmap <F1> <nop>
imap <F1> <nop>

" select last yank
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

let mapleader=","
nnoremap <C-l> :redraw!<CR>
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
noremap  <leader>u <Esc>:!git add -u && git commit --verbose <CR>
noremap  <leader>U <Esc>:!git add -u && git commit --allow-empty-message --message "" <CR>
noremap  <leader>p <Esc>:!git push && deployproject<CR><CR>
noremap  <leader>m <Esc>:!make<CR>
noremap  <leader>b <Esc>:!build<CR>
noremap  <leader>s <Esc>:!save<CR><CR>

" Spelling
map <leader>S :w!<CR>:!aspell check %<CR>:e! %<CR>
" Change spelling error formatting
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" Helper Functions
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

"Easier start/end line navigation
noremap H ^
noremap L $
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

let g:neocomplcache_enable_at_startup = 1

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
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Change shape of cursor in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical line in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode

for f in split(glob('~/.vim/configurations/*.vim'), '\n')
	exec 'source' f
endfor
