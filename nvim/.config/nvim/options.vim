" split natural
set splitbelow splitright

" always use clipboard for all delete, yank, change, put operation
" see https://goo.gl/YAHBbJ
set clipboard+=unnamedplus

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

" general tab settings
set tabstop=2     " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2  " number of spaces to use for autoindent
set expandtab     " expand tab to spaces so that tabs are spaces

" show line number and relative line number
set number relativenumber

" ignore case in general, but become case-sensitive when uppercase is present
set ignorecase smartcase

" file and script encoding settings
set fileencoding=utf-8
set fileencodings=utf-8,latin1
scriptencoding utf-8

" break line at predefined characters
set linebreak

" character to show before the lines that have been soft-wrapped
set showbreak=↪

" list all items and start selecting matches in cmd completion
set wildmode=list:full

" show current line where the cursor is
set cursorline

" minimum lines to keep above and below cursor when scrolling
set scrolloff=3

" use mouse to select and resize windows, etc.
set mouse=nic        " enable mouse in several mode
set mousemodel=popup " set the behaviour of mouse

" do not show mode on command line since vim-lightline can show it
set noshowmode

" fileformats to use for new files
set fileformats=unix,dos

" the way to show the result of substitution in realtime for preview
set inccommand=nosplit

" ask for confirmation when handling unsaved or read-only files
set confirm

" do not use visual and errorbells
set visualbell noerrorbells

" auto-write the file based on some condition
set autowrite

" persistent undo even after you close a file and re-open it
set undofile

" do not show "match xx of xx" and other messages during auto-completion
set shortmess+=c

" correctly break multi-byte characters such as CJK
" see http://tinyurl.com/y4sq6vf3
set formatoptions+=mM
