" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" Appearance stuff {{{
colorscheme jellybeans
set gfn=ubuntumono
" }}}

" General Settings {{{
syntax on
filetype plugin indent on
set encoding=utf-8
" }}}
" Other settings {{{
set number
set modeline
set modelines=5
set shortmess+=I

" Tabs {{{
set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
" }}}

" improves redrawing for newer computers {{{
set nolazyredraw        " turn off lazy redraw
set nohlsearch          " highlight no search results
set spelllang=en     " set spelling lang
" }}}

" Searching and history {{{
set incsearch         " increment search
set ignorecase        " case-insensitive search;
set nobackup          " don't create backup files
set noswapfile        " don't create swap file
set history=50        " keep 50 lines of command line history
" }}}

" Gvim stuff {{{
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
