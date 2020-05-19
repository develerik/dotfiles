" source configuration files
let g:nvim_config_root = expand('<sfile>:p:h')
let g:config_file_list = [
  \ 'variables',
  \ 'options',
  \ 'autocommands',
  \ 'mappings',
  \ 'filetypes',
  \ 'plugins',
  \ 'ui'
  \ ]

for s:fname in g:config_file_list
  execute 'source ' . g:nvim_config_root . '/' . s:fname . '.vim'
endfor

" load local configurations if available
silent! source g:nvim_config_root . '/local.vim'
