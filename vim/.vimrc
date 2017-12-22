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

" Disable default status line and let lightline take care of the work
set noshowmode

" watch for file changes and auto update
set autoread         

" Don't redraw vim in all situations
set lazyredraw        

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Change the terminal's title
set title            

" Fold settings
set nofoldenable               " Have all folds open by default
set foldnestmax=10             " Set deepest fold to x levels
set foldmethod=indent          " Decide where to fold based off syntax
set foldcolumn=2               " The width of the gutter column showing folds by line

" Toggle folds with the space bar
nnoremap <Space> za

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP> 

" Enable highlighting of the current line
" set cursorline

" Set cursorline colors
" highlight CursorLine cterm=underline 
" highlight CursorLine ctermfg=220

" Set color of number column on cursorline
" highlight CursorLineNR ctermfg=220


" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""""""""""""""
" INSTALL PLUGINS 
"""""""""""""""""""

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Status line
Plugin 'itchyny/lightline.vim'

" Commenting
Plugin 'tpope/vim-commentary'

" Shortcuts for adding/changing surrounding delimiters
Plugin 'tpope/vim-surround'

" Enable Nerdtree and devicons
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-webdevicons'

" Enable auto pairs
Plugin 'jiangmiao/auto-pairs'

" Enable syntax checking
Plugin 'vim-syntastic/syntastic'

" Enable keyboard shortcut navigation from tmux and vim 
Plugin 'christoomey/vim-tmux-navigator'

" Enable runner to communicate between vim and tmux
Plugin 'christoomey/vim-tmux-runner'

" Wes Anderson color scheme
Plugin 'gilgigilgil/anderson.vim'

" Emoji support for markdown files
Plugin 'junegunn/vim-emoji'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""
" PLUGIN CONFIGURATIONS 
"""""""""""

" Set colorscheme 
colo anderson

" Configure lightline colorscheme - Wombat or seoul256
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Configure nerdtree with ctrl+N kb shortcut, to enable hidden files and
" devicons
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
set encoding=utf8
set guifont=InconsolataForPowerline\ Nerd\ Font\ Medium:h13

" Open NerdTree automatically if open vim with directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Open NerdTree automatically if no startup files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if NerdTree is the last window open 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Configure Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Configure vim-emoji only for Markdown files
augroup emoji_complete
  autocmd!
  autocmd FileType markdown setlocal completefunc=emoji#complete
augroup END
