" Use Vim settings, rather than Vi
" This must be first because it changes other options as a side effect
set nocompatible
filetype off

" Make backspace behave in a sane manner
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Set show mode and last status
set laststatus=2

" Enable file type detection and do language-dependent indenting
filetype plugin indent on
set autoindent

" Eliminate delays on ESC in vim
set ttimeoutlen=10

" Show linenumbers 
set number 

" Set search options for incremental search and highlighting as you go 
set incsearch
set hlsearch

" Set tabs and indents
set tabstop=4
set shiftwidth=4

" Enable clipboard
set clipboard=unnamed

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP> 

" Enable highlighting of the current line
set cursorline

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Status line
Plugin 'itchyny/lightline.vim'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Commenting
Plugin 'tpope/vim-commentary'

" Shortcuts for adding/changing surrounding delimiters
Plugin 'tpope/vim-surround'

" enable Nerdtree and devicons
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-webdevicons'

" enable auto pairs
Plugin 'jiangmiao/auto-pairs'

" enable syntax checking
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Configure lightline colorscheme
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Configure nerdtree with ctrl+N kb shortcut, to enable hidden files and
" devicons
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
set encoding=utf8
set guifont=InconsolataForPowerline\ Nerd\ Font\ Medium:h13

" Configure Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
