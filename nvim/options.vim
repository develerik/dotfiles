"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" sets how many lines of history VIM has to remember
set history=500

" enable filetype plugins
filetype plugin indent on

" set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" with a map leader it's possible to do extra key combinations
let mapleader = ","

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set 7 lines to the cursor - when moving vertically using j/k
set so=7

" minimum lines to keep above and below cursor when scrolling
set scrolloff=3

" turn on the Wild menu
set wildmenu

" ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

"always show current position
set ruler

" height of the command bar
set cmdheight=1

" a buffer becomes hidden when it is abandoned
set hid

" configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" ignore case when searching
set ignorecase

" when searching try to be smart about cases
set smartcase

" highlight search results
set hlsearch

" makes search act like search in modern browsers
set incsearch

" the way to show the result of substitution in realtime for preview
set inccommand=nosplit

" don't redraw while executing macros
set lazyredraw

" for regular expressions turn magic on
set magic

" show matching brackets when text indicator is over them
set showmatch
" how many tenths of a second to blink when matching brackets
set mat=2

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" add a bit extra margin to the left
set foldcolumn=1

" do not show mode on command line since vim-lightline can show it
set noshowmode

" split natural
set splitbelow splitright

" list all items and start selecting matches in cmd completion
set wildmode=list:full

" show current line where the cursor is
set cursorline

" show line number and relative line number
set number relativenumber

" do not show "match xx of xx" and other messages during auto-completion
set shortmess+=c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" turn persistent undo on
let g:undodir=expand(stdpath('data') . '/undo')
if !isdirectory(g:undodir)
   call mkdir(g:undodir, "p")
endif
let &undodir=g:undodir
set undofile

" setup swap file directory
let g:swapdir=expand(stdpath('data') . '/swap')
if !isdirectory(g:swapdir)
   call mkdir(g:swapdir, "p")
endif
let &directory=g:swapdir


" setup backup directory
let g:backupdir=expand(stdpath('data') . '/backup')
if !isdirectory(g:backupdir)
   call mkdir(g:backupdir, "p")
endif
let &backupdir=g:backupdir


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use spaces instead of tabs
set expandtab

" be smart when using tabs
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Linebreak on 120 characters
set lbr
set tw=120

set ai " auto indent
set si " smart indent
set wrap " wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry


""""""""""""""""""""""""""""""
" status line
""""""""""""""""""""""""""""""

" always show the status line
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" always use clipboard for all delete, yank, change, put operation
set clipboard+=unnamedplus

" break line at predefined characters
set linebreak

" character to show before the lines that have been soft-wrapped
set showbreak=↪

" use mouse to select and resize windows, etc.
set mouse=nic
set mousemodel=popup

" ask for confirmation when handling unsaved or read-only files
set confirm

" correctly break multi-byte characters such as CJK
set formatoptions+=mM
