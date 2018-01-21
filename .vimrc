set encoding=utf-8

" load up pathogen and all bundles
call pathogen#infect()
call pathogen#helptags()

syntax on                         " show syntax highlighting
filetype plugin indent on
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
"set relativenumber                " show relative line numbers
set re=1                          "set regex engine to old one. apparently it's faster for ruby files
set relativenumber
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set ttimeoutlen=0                 " decrease timeout for faster insert with 'O'
"set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set foldmethod=indent             " fold by syntax is really slow
set clipboard=unnamed             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
set smarttab
set rtp+=/usr/local/opt/fzf       " use fzf in vim
set lazyredraw
set linespace=8
set splitright
set guioptions=                   "remove any gui in macvim
"set termguicolors
set foldlevelstart=99            "don't atomatically fold large file
"runtime macros/matchit.vim        " use % to jump between start/end of methods

"improve syntax speed
set nocursorcolumn
set nocursorline
"set norelativenumber
syntax sync minlines=256
"

let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_added = '❖'
highlight GitGutterAdd guifg = '#A3E28B'

" set dark background and color scheme
set background=dark
colorscheme nord
" set up some custom coloro
highlight clear SignColumn
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" set leader key to comma
let mapleader = ","


" fzf plugin related action
if executable("fzf")
  " we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)
  nmap ; :Buffers<CR>
  nmap <Leader>f :Files<CR>
  nmap <Leader>g :Tags<CR>
  " nmap <leader>F :Lines<CR> conflicted with JSONPrettify
endif

" Map space " unmap ex mode: 'Type visual to go into Normal mode.'
nnoremap Q <nop>

" fast saving
map <leader>w :w!<cr>
" call GoCoverageToggle
noremap <leader>T :GoCoverageToggle<cr>
" ack to current cursor
noremap <Leader>a :Ack <cword><cr>
" call GoDef
noremap <leader>D :GoDef<cr>

" map . in visual mode
vnoremap . :norm.<cr>

"Remove all trailing whitespace by pressing leader+b
"nnoremap <leader>reb :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" check white space on save
autocmd BufWritePre * %s/\s\+$//e
" map git commands
map <leader>l :!clear && git log -p %<cr>
map <leader>d :!clear && git diff %<cr>

" navigate tabs
map <leader>m :tabprevious<cr>
map <leader>. :tabnext<cr>
map <leader>t :tabnew<cr>
" clear the command line and search highlighting
noremap <C-l> :nohlsearch<CR>
" toggle tree
map <leader>e :NERDTreeToggle<cr>

"macvim specific command
if has("gui_macvim")
  colorscheme onedark
  " autochange folder to current buffer
  "http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
  "autocmd BufEnter * if expand("%:p:h") !~ '/^tmp|^eq' | silent! lcd %:p:h | endif

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>

  if executable("rg")
    " Use rg over grep
    let g:ctrlp_user_command = 'rg --files %s'
    let g:ctrlp_use_caching = 0
    map <leader>f :CtrlP<cr>
  endif

endif

let g:ackprg = 'rg --vimgrep'
" vim-go specific command
let g:go_highlight_functions = 1
let g:go_highlight_fields = 1
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"

" turn off ycm
nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
" turn on ycm
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>

" run GoLint on save
autocmd BufWritePre *.go call go#lint#Golint()

" rename current file, via Gary Bernhardt
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

" prettify json file
function! JSONPrettify()
  exec ':%!python3 -m json.tool'
endfunction

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
map <leader>F :call JSONPrettify()<cr>
