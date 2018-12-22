call plug#begin('~/.vim/plugged')
  Plug 'chriskempson/base16-vim'          " Color scheme
  Plug 'sheerun/vim-polyglot'             " More syntax highlighting
  Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy file search
  Plug 'w0rp/ale'                         " Async lint engine
  Plug 'vim-airline/vim-airline'          " Status bar
  Plug 'vim-airline/vim-airline-themes'   " Status bar themes
  Plug 'tpope/vim-commentary'             " Comment stuff out
  Plug 'tpope/vim-surround'               " Manipulate various surroundings
  Plug 'tpope/vim-fugitive'               " Git wrapper
  Plug 'Raimondi/delimitMate'             " Autocomplete quotes, brackets etc.
  Plug 'scrooloose/nerdtree'              " Tree explorer
  Plug 'LucHermitte/lh-vim-lib'           " Vim functions 
  Plug 'LucHermitte/local_vimrc'          " Project management 
  Plug 'rust-lang/rust.vim'               " Rust
  Plug 'Valloric/YouCompleteMe'           " Completion engine 
call plug#end()                           " Initialize plugin system

" Display Settings
" ================
if (has('termguicolors'))
  set termguicolors
endif

" Color scheme
" ============
colorscheme base16-eighties 
syntax enable                             " Syntax highlighting on

" General config
" ==============
set encoding=utf8                         " UTF8
set number relativenumber                 " Line numbers
set backspace=indent,eol,start            " Allow backspace
set showcmd                               " Show cmd 
set showmode                              " Show current mode
set laststatus=2                          " Show status line
set autoread                              " Auto refresh any files that haven't been edited by Vim
set clipboard^=unnamed,unnamedplus        " Enable clipboard
set mouse=a                               " Enable mouse 
set hlsearch                              " Highlight search 
set incsearch                             " Auto search
au FocusGained * :checktime               " Automatically reload files 

" Turn off Swap files
" ===================
set noswapfile                            " Disable .swp files
set nobackup                              " Disable backup files
set nowritebackup                         " Nope
set backupdir=~/vimtmp,.                  " Write backup here
set directory=~/vimtmp,.                  " Or here 

" Indentation and display
" =======================
filetype plugin on                        " Filetype detection
filetype indent on                        " Enable loading the indent file 
set autoindent                            " Automatic indentation
set tabstop=2                             " Control the number of spaces
set shiftwidth=2                          " Number of spaces for indentation
set expandtab                             " Insert spaces when tab is pressed
set softtabstop=2                         " Treat the spaces like a tab
set colorcolumn=80                        " Show a marker at 80 chars

" Autocompletion
" ==============
set wildmenu
set wildmode=list:longest,full

" CtrlP 
" =====
let g:ctrlp_custom_ignore = 'node_modules'

" NERDTree
" ========
map <C-n> :NERDTreeToggle<CR>

" Ale
" === 
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_lint_on_save = 'never'          " Run lint only when files are saved 
let g:ale_fix_on_save = 1                 " Auto fix 
let g:ale_change_sign_column_color = 1 
let g:ale_linters = {
\ 'javascript': ['standard'],
\ }
let g:ale_fixers = {
\ 'javascript': ['standard'],
\ }

" Airline
" =======
let g:airline_theme='base16_eighties'
let g:airline_powerline_fonts = 0
let g:airline#extensions#ale#enabled = 1

" YouCompleteMe
" =============
let g:ycm_autoclose_preview_window_after_completion=1

" Habit breaking, habit making
" ============================
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
