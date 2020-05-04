" download vim-plug if not already installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo '~/.local/share/nvim/site/autoload/plug.vim' --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')

" register vim-plug as a plugin for help
Plug 'junegunn/vim-plug'

" theme plugins
Plug 'arcticicestudio/nord-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'

call plug#end()

" theme settings
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

" theme overrides
augroup nord-theme-overrides
  autocmd!
  " set background transparent
  autocmd ColorScheme nord highlight Normal guibg=NONE ctermbg=NONE
augroup END

" lightline settings
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ }
