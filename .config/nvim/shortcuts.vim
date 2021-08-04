if executable("fzf")
  nmap ; :Buffers<CR>
  nmap <Leader>f :Files<CR>
  " nmap <Leader>g :Tags<CR>
  " nmap <leader>F :Lines<CR> conflicted with JSONPrettify
  nnoremap f :Rg<cr>
  nnoremap L :Lines<cr>
  noremap <silent> <Leader>a :Rg <C-R><C-W><cr>
endif

" set floating terminal
nnoremap t :FloatermToggle <cr>
"nnoremap t :FloatermNew --height=0.6 --width=0.4 --wintype=floating --name=floaterm1<cr>
" Map space " unmap ex mode: 'Type visual to go into Normal mode.'
nnoremap Q <nop>
" fast saving
map <Leader>w :w!<cr>
vnoremap . :norm.<cr>
nnoremap <space> za
vnoremap <space> za
" easymotion
"map <leader>j <Plug>(easymotion-j)
"map <leader>k <Plug>(easymotion-k)
" navigate tabs
map <leader>m :tabprevious<cr>
map <leader>. :tabnext<cr>
map <leader>t :tabnew<cr>
" clear the command line and search highlighting
noremap <C-l> :nohlsearch<CR>
" toggle tree
map <leader>e :NERDTreeToggle<cr>
map <leader>n :call RenameFile()<cr>
"map <leader>F :call JSONPrettify()<cr>

"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
""inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
"" use <C-space> for trigger completion
"inoremap <silent><expr> <c-space> coc#refresh()
"
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
noremap <leader>h :Goyo <cr>
noremap <leader>H :Goyo 200 <cr>
noremap <leader>E :call CheckError() <cr>

