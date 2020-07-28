" do not use smart case in command line mode
" see https://goo.gl/vCTYdk
augroup dynamic_smartcase
  autocmd!
  autocmd CmdLineEnter : set nosmartcase
  autocmd CmdLineLeave : set smartcase
augroup END

augroup term_settings
  autocmd!
  " do not use number and relative number for terminal inside nvim
  autocmd TermOpen * setlocal norelativenumber nonumber
  " go to insert mode by default to start typing command
  autocmd TermOpen * startinsert
augroup END

" more accurate syntax highlighting
augroup accurate_syn_highlight
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END

" return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" display a message when the current file is not in utf-8 format
augroup non_utf8_file_warn
  autocmd!
  autocmd BufRead * if &fileencoding != 'utf-8'
    \ | unsilent echomsg 'File not in UTF-8 format!' | endif
augroup END

" automatically reload the file if it is changed outside of vim
" see https://unix.stackexchange.com/a/383044/221410
augroup auto_read
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() == 'n' && getcmdwintype() == '' | checktime | endif
  autocmd FileChangedShellPost * echohl WarningMsg
    \ | echo "File changed on disk. Buffer reloaded!" | echohl None
augroup END
