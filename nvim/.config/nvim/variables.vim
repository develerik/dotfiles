" path to Python 3 interpreter (must be an absolute path), make startup faster
" see https://neovim.io/doc/user/provider.html
if executable('python')
  let g:python3_host_prog=exepath('python')
else
  echoerr 'Python executable not found! You must install Python and set its PATH!'
endif

" disable Python2 support
let g:loaded_python_provider=0

" do not load netrw by default
" see https://github.com/bling/dotvim/issues/4
let g:loaded_netrwPlugin = 1
