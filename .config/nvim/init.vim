call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-fugitive'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'ayu-theme/ayu-vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'gf3/molotov'
Plug 'mileszs/ack.vim'
Plug 'sebdah/vim-delve'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'wakatime/vim-wakatime'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-ruby/vim-ruby'
Plug 'keith/rspec.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/goyo.vim'
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'morhetz/gruvbox'
Plug 'rainglow/vim'
Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'
call plug#end()

set termguicolors
let ayucolor="dark"
"colorscheme seoul256
colorscheme gruvbox-material
"colorscheme "blink-contrast"
"let g:gruvbox_contrast_dark='light'

let g:coc_global_extensions = ['coc-solargraph']
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.config/nvim/editor.vim
source ~/.config/nvim/commons.vim
source ~/.vimrc
source ~/.config/nvim/golang.vim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set noshowcmd
set noshowmode
