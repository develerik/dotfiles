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

Plug 'junegunn/vim-plug'

" common
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-signify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'editorconfig/editorconfig-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mhinz/vim-startify'

" html
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript'] }
Plug 'othree/html5.vim', { 'for': ['html', 'javascript'] }

" css/scss
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }

" javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

" c/c++
Plug 'Rip-Rip/clang_complete', { 'for': ['c', 'cpp'] }
Plug 'justmao945/vim-clang'

" graphviz
Plug 'liuchengxu/graphviz.vim', { 'for': 'dot' }

" latex
Plug 'lervag/vimtex'

" themes
Plug 'arcticicestudio/nord-vim'

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
  " fix vimtex
  autocmd ColorScheme nord highlight Conceal guibg=NONE ctermbg=NONE
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline + lightline-bufferline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline#bufferline#show_number     = 1
let g:lightline#bufferline#enable_devicons = 1

let lightline               = {}
let g:lightline.colorscheme = 'nord'

let g:lightline.component_function = {
      \ 'currentfunction': 'CocCurrentFunction',
      \ }

let g:lightline.component_expand = {
      \ 'buffers': 'lightline#bufferline#buffers',
      \ 'cocerror': 'LightLineCocError',
      \ 'cocwarn': 'LightLineCocWarn',
      \ }

let g:lightline.component_type = {
      \ 'buffers': 'tabsel',
      \ 'cocerror': 'error',
      \ 'cocwarn': 'warning',
      \ }

let g:lightline.tabline = {
      \ 'left': [['buffers']],
      \ 'right': [['cocerror', 'cocwarn','currentfunction']],
      \ }

au User CocDiagnosticChange call lightline#update()
au BufWritePost,TextChanged,TextChangedI * call lightline#update()

function! LightLineCocError()
  let s:error_sign = get(g:, 'coc_status_error_sign')
  let info = get(b:, 'coc_diagnostic_info', {})

  if empty(info)
    return ''
  endif

  let errmsgs = []

  if get(info, 'error', 0)
    call add(errmsgs, s:error_sign . info['error'])
  endif

  return trim(join(errmsgs, ' ') . ' ' . get(g:, 'coc_status', ''))
endfunction

function! LightLineCocWarn()
  let s:warning_sign = get(g:, 'coc_status_warning_sign')
  let info = get(b:, 'coc_diagnostic_info', {})

  if empty(info)
    return ''
  endif

  let warnmsgs = []

  if get(info, 'warning', 0)
    call add(warnmsgs, s:warning_sign . info['warning'])
  endif

  return trim(join(warnmsgs, ' ') . ' ' . get(g:, 'coc_status', ''))
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" signify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set updatetime=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" editorconfig
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:EditorConfig_exclude_patterns = ['scp://.*']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" golang
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" latex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDTreeDirArrowExpandable  = ''
let g:NERDTreeDirArrowCollapsible = ''

let g:webdevicons_enable_nerdtree = 1

au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hexokinase
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:Hexokinase_optInPatterns = ['full_hex', 'triple_hex', 'rgba']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:coc_global_extensions = ['coc-solargraph', 'coc-highlight', 'coc-yaml', 'coc-html', 'coc-css', 'coc-json', 'coc-xml', 'coc-tsserver', 'coc-explorer', 'coc-markdownlint']
au CursorHold * silent call CocActionAsync('highlight')

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

let g:coc_snippet_next        = '<tab>'
let g:coc_status_error_sign   = ' '
let g:coc_status_warning_sign = ' '

let g:coc_explorer_global_presets = {
      \ 'floating': {
      \   'position': 'floating',
      \ },
      \ 'floatingTop': {
      \   'position': 'floating',
      \   'floating-position': 'center-top',
      \ },
      \ 'floatingLeftside': {
      \   'position': 'floating',
      \   'floating-position': 'left-center',
      \   'floating-width': 50,
      \ },
      \ 'floatingRightside': {
      \   'position': 'floating',
      \   'floating-position': 'left-center',
      \   'floating-width': 50,
      \ },
      \ 'simplify': {
      \   'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
      \ },
      \ }

au BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
