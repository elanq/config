let g:go_addtags_transform = "snakecase"
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
"let g:go_metalinter_enabled = ['vet', 'deadcode', 'errcheck']
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['vet']
let g:go_metalinter_deadline = "3s"
" highlight all
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
""let g:go_guru_scope=['...']
"
let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1
noremap <leader>T :GoCoverageToggle<cr>
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=8 shiftwidth=8
"au FileType go nmap <leader>g :GoDeclsDir<cr>
nmap <leader>g :CocList outline<cr>

  " nvim deoplete-go configuration
  "let g:deoplete#enable_at_startup = 1
  "let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
  "let g:deoplete#sources#go#package_dot = 1
  "let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
  "
" run GoLint on save
"autocmd BufWritePre *.go call go#lint#Golint()
"use gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
"import on save
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
