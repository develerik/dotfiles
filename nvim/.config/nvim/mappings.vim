" remap VIM 0 to first non-blank character
map 0 ^

" save key strokes
nnoremap ; :
xnoremap ; :

" yank from current cursor position to the end of the line
nnoremap Y y$

" use Esc to quit builtin terminal
tnoremap <ESC> <C-\><C-n>

" fast saving
nmap <leader>w :w!<cr>

" map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" opens a new tab with the current buffer's path
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>
