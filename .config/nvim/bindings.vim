" ============================================================================
"  - Bindings
" ============================================================================

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=' '


" ============================================================================
"  - Project navigation
" ============================================================================

" Finding Files
nnoremap <silent> <F6>      :<C-u>LazyGit<CR>
nnoremap <silent> <F7>      <cmd>lua require('telescope-config').project_files()<CR>
nnoremap <silent> <F8>      :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> <F9>      :Lf<CR>
nnoremap <silent> <F10>     :<C-u><CR>

" Finding code
nnoremap <silent> <F1>      :<C-u>SearchSession<CR>
nnoremap <silent> <F2>      :<C-u>Telescope live_grep<CR>
nnoremap          <F3>      :<C-u>TodoTelescope<CR>
nnoremap          <F4>      :<C-u>Telescope keymaps<CR>
nnoremap          <F11>     :<C-u>Telescope coc references<CR>
nnoremap          <F12>     :<C-u>Telescope coc line_code_actions<CR>


" ============================================================================
"  - Motions
" ============================================================================

" Movement
vmap j <Plug>(easymotion-j)
vmap k <Plug>(easymotion-k)

" Jumping
nmap <silent> s <Plug>(easymotion-s2)
xmap <silent> s <Plug>(easymotion-s2)
omap <silent> s <Plug>(easymotion-s2)
vmap <silent> s <Plug>(easymotion-s2)

" Misc
nmap <leader>r <Plug>(coc-rename)
nmap <silent> <leader>s <Plug>(coc-fix-current)
nmap <silent> <leader>S <Plug>(coc-codeaction)
nmap <silent> <leader>a <Plug>(coc-diagnostic-next)
nmap <silent> <leader>A <Plug>(coc-diagnostic-next-error)
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>g :call CocAction('doHover')<CR>
nmap <silent> <leader>u <Plug>(coc-references)

" inside function
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)

" around function
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)

" Show more like under cursor
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)    
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)

" Bspwm
noremap <silent> <A-h> :BspwmNavigateWest<cr>
noremap <silent> <A-j> :BspwmNavigateSouth<cr>
noremap <silent> <A-k> :BspwmNavigateNorth<cr>
noremap <silent> <A-l> :BspwmNavigateEast<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>  

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Change text without putting the text into register,
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc

" Don't yank whitespace at the beginning of a line
nnoremap Y ^y$

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Vertical movements should respect line wrapping
nnoremap j gj
nnoremap k gk

" Move a line of text using Ctrl-[jk]
nnoremap <silent> <C-j> :move+<cr>
nnoremap <silent> <C-k> :move-2<cr>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv

" Git
nnoremap <silent> <Leader>gla <cmd>lua require('telescope-config').my_git_commits()<CR>
nnoremap <silent> <Leader>gs <cmd>lua require('telescope-config').my_git_status()<CR>
