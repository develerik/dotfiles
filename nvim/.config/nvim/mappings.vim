" save key strokes
" (now we do not need to press shift to enter command mode)
nnoremap ; :
xnoremap ; :

" yank from current cursor position to the end of the line
" (make it consistent with the behavior of D, C)
nnoremap Y y$

" use Esc to quit builtin terminal
tnoremap <ESC> <C-\><C-n>
