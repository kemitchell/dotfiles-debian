syntax enable

set nocompatible
set autoindent
set conceallevel=0
set diffopt+=vertical
set encoding=utf-8
set expandtab
set fileencodings=utf-8
set formatprg=fmt\ -w72\ -u
set hidden
set history=999
set hlsearch
set ignorecase
set incsearch
set laststatus=2
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
set tabstop=2
set termencoding=utf8

" Unmap <F1> for help
nmap <F1> <nop>
imap <F1> <nop>

let mapleader=","
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
noremap  <leader>w <Esc>:write<CR>
noremap  <leader>x <Esc>:x<CR>
noremap  <leader>s <Esc>:!save<CR><CR>
map <leader>S :w!<CR>:!aspell check %<CR>:e! %<CR>

call plug#begin("~/.neovim/plug")
Plug 'SirVer/ultisnips'
Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-voom/VOoM'
call plug#end()
