" ============================================================================
" => Helper Functions
" ============================================================================

" ----------------------------------------------------------------------------
"  - Restore cursor, window, and last search after running a command.
" ----------------------------------------------------------------------------

function! Preserve(command)
    " Save the last search.
    let search = @/

    " Save the current cursor position.
    let cursor_position = getpos('.')

    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)

    " Execute the command.
    execute a:command

    " Restore the last search.
    let @/ = search

    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt                  

    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction


" ----------------------------------------------------------------------------
"  - Re-indent the whole buffer.
" ----------------------------------------------------------------------------

function! Indent()
    call Preserve('normal gg=G')
endfunction


" ----------------------------------------------------------------------------
"  - Fill the command line with..
" ----------------------------------------------------------------------------

function! CmdLine(str)
  call feedkeys(":" . a:str)
endfunction



" ----------------------------------------------------------------------------
"  - Return the open file's parent directory
" ----------------------------------------------------------------------------

function! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunction
