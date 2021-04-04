" ============================================================================
" => Plugin configuration
" ============================================================================

" ----------------------------------------------------------------------------
"  - easymotion
" ----------------------------------------------------------------------------

" This setting makes EasyMotion work similarly to Vim's smartcase option for global searches.
let g:EasyMotion_smartcase = 1

" Don't map easymotion defaults
let g:EasyMotion_do_mapping = 0

" Don't interfere with Coc
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

" Easymotion keys
let g:EasyMotion_keys = 'asdfjklghqweruiopzxcvmtybn;'

" keep cursor column when JK motion
let g:EasyMotion_startofline = 0 



" ----------------------------------------------------------------------------
"  - Vimade
" ----------------------------------------------------------------------------

let g:vimade = { "fadelevel": 0.4 }

au! FocusLost * VimadeFadeActive
au! FocusGained * VimadeUnfadeActive




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - vim-asterisk
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keep cursor position across matches
let g:asterisk#keeppos = 1 



" ----------------------------------------------------------------------------
"  - nerdcommenter             
" ----------------------------------------------------------------------------

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indenta  tion
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1



" ----------------------------------------------------------------------------
"  - Git gutter
" ----------------------------------------------------------------------------

let g:gitgutter_enabled=1
let g:gitgutter_max_signs=2000
let g:gitgutter_preview_win_floating=1

let g:gitgutter_override_sign_column_highlight = 0
call gitgutter#highlight#define_highlights()

" highlight clear SignColumn

" Flatten all gutter icons
let g:gitgutter_sign_added = '│' " █▓▒░║
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '▔'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▔'

function! GitGutterNextHunkCycle()
    let line = line('.')
    silent! GitGutterNextHunk
    if line('.') == line
        1
        GitGutterNextHunk
    endif
endfunction


" ----------------------------------------------------------------------------
"  - VimWiki
" ----------------------------------------------------------------------------

let g:vimwiki_global_ext = 0 
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_links_space_char = '-'
let g:vimwiki_autowriteall = 1
let g:vimwiki_syntax = 'markdown'
let g:vimwiki_ext = '.md'
let g:vimwiki_main = 'README'

let personal = {}
let personal.path = '~/vimwiki'

let guides = {}
let guides.path = '~/guides'

let g:vimwiki_list = [personal,guides]
let g:vimwiki_ext2syntax = {
            \ '.md': 'markdown',
            \ '.markdown': 'markdown',
            \ '.mdown': 'markdown'
            \ }



" ----------------------------------------------------------------------------
"  - lf
" ----------------------------------------------------------------------------

" Open lf when vim opens a directory
let g:lf_replace_netrw = 1
let g:lf_command_override = 'lf -command "map <enter> open" -command "map <esc> quit"' 
