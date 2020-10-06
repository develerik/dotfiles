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
Plug 'mengelbrecht/lightline-bufferline'

Plug 'mhinz/vim-startify'

" git plugins
Plug 'mhinz/vim-signify'

" language plugins
Plug 'editorconfig/editorconfig-vim'

" ui plugins
Plug 'preservim/nerdtree'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:startify_files_number           = 10
let g:startify_padding_left           = 3
let g:startify_fortune_use_unicode    = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_remove_lines   = ['setlocal', 'winheight']
let g:startify_session_sort           = 1
let g:startify_update_oldfiles        = 1
let g:startify_change_to_dir          = 1

let g:startify_bookmarks = [
      \ { 'c': '~/.config'   },
      \ { 'd': '~/.dotfiles' },
      \ { 'p': '~/Projects'  },
      \ ]

let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ["  Bookmarks"]               },
      \ { 'type': 'files',     'header': ["  MRU Files"]               },
      \ { 'type': 'dir',       'header': ["  MRU Files in ". getcwd()] },
      \ { 'type': 'commands',  'header': ["  Commands"]                },
      \ ]

" icons
let g:webdevicons_enable_startify = 1
function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

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
" lightline + lightline-bufferline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline#bufferline#show_number     = 1
let g:lightline#bufferline#enable_devicons = 1

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel',
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \ },
      \ }

au BufWritePost,TextChanged,TextChangedI * call lightline#update()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" signify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set updatetime=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" editorconfig
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:EditorConfig_exclude_patterns = ['scp://.*']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDTreeDirArrowExpandable  = ''
let g:NERDTreeDirArrowCollapsible = ''

let g:webdevicons_enable_nerdtree = 1

au VimEnter * if &filetype !=# 'gitcommit' | NERDTree | wincmd p | endif
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hexokinase
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:Hexokinase_optInPatterns = ['full_hex', 'triple_hex', 'rgba']

