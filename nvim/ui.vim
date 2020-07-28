"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable syntax highlighting
syntax enable

" enable 256 colors palette
if $TERM == "xterm-256color"
  set termguicolors
endif

try
  colorscheme nord
catch
endtry

set background=dark

" set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" use unix as the standard file type
set ffs=unix,dos
