" Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'

let g:goyo_width = 90
let g:goyo_height = '100%'

function! s:goyo_enter()
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
    if executable('tmux') && strlen($TMUX) && &filetype !=# 'man' && &filetype !=# 'help'
        silent !tmux set status off
        silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    endif
    " :Limelight
endfunction

function! s:goyo_leave()
    " :Limelight!
    if executable('tmux') && strlen($TMUX) 
        silent !tmux set status on
        silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    endif
    " Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        if b:quitting_bang
            qa!
        else
            qa
        endif
    endif
endfunction

augroup Goyo
    autocmd!  
    autocmd! User GoyoEnter call <SID>goyo_enter()
    autocmd! User GoyoLeave call <SID>goyo_leave()
augroup END
