set encoding=utf-8

let mapleader = ","               " set leader key to comma

syntax on                         " show syntax highlighting
filetype plugin indent on
set hidden
set tags=./.tags;,tags;
set autowrite
set backspace=indent,eol,start
set history=500
set autoread
set autoindent                    " set auto indent
set ts=2                          " set indent to 2 spaces
set shiftwidth=2
set expandtab                     " use spaces, not tab characters
set nocompatible                  " don't need to be compatible with old vim
set re=1                          "set regex engine to old one. apparently it's faster for ruby files
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set ttimeoutlen=0                 " decrease timeout for faster insert with 'O'
set foldmethod=indent             " fold by syntax is really slow
set clipboard=unnamedplus         " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
set smarttab
set rtp+=/usr/bin/fzf       " use fzf in vim
set lazyredraw
set linespace=8
set splitright
set guioptions=                   "remove any gui in macvim
set foldlevelstart=99            "don't atomatically fold large file
set updatetime=100               " useful for go info
"improve syntax speed
set nocursorcolumn
"set nocursorline
set relativenumber
set mouse=a
syntax sync minlines=256

