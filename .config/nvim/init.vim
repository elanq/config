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
Plug 'rhysd/git-messenger.vim'
Plug 'franbach/miramare'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'sainnhe/sonokai'
Plug 'junegunn/seoul256.vim'
"Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'camspiers/animate.vim'
"Plug 'camspiers/lens.vim'
call plug#end()

set termguicolors
"colorscheme seoul256-light
"colorscheme "blink-contrast"
"let g:seoul256_background=256
"colorscheme gruvbox-material
"let g:miramare_transparent_background=1
"colorscheme miramare
colorscheme vim-monokai-tasty
" set vim background to transparent
let g:gruvbox_contrast_dark='dark'

let g:coc_global_extensions = ['coc-solargraph']
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.config/nvim/editor.vim
source ~/.config/nvim/commons.vim
source ~/.vimrc
source ~/.config/nvim/golang.vim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_theme='minimalist'
"let g:airline_theme='zenburn'

augroup TerminalStuff
  au!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
set noshowcmd
set noshowmode

let g:coc_disable_startup_warning = 1

hi Normal guibg=NONE ctermbg=NONE
