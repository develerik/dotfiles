" setup vim-plug
" TODO: consider adding as submodule
let vimplug_exists=expand('~/.local/share/nvim/site/autoload/plug.vim')
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug by yourself!"
    execute "q!"
  endif

  echo "Installing vim-plug..."
  echo ""
  silent exec "!curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin(stdpath('data') . '/plugged')

" register vim-plug as a plugin for help
Plug 'junegunn/vim-plug'

" theme plugins
Plug 'arcticicestudio/nord-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'

Plug 'mhinz/vim-startify'

" git plugins
Plug 'mhinz/vim-signify'

" javascript plugins
Plug 'pangloss/vim-javascript'

" ui plugins
Plug 'preservim/nerdtree'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

" overrides
augroup nord-theme-overrides
  autocmd!
  " set background transparent
  autocmd ColorScheme nord highlight Normal guibg=NONE ctermbg=NONE
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
  \ 'colorscheme': 'nord',
  \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" signify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set updatetime=100


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:javascript_plugin_jsdoc = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

map <C-n> :NERDTreeToggle<CR>
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
