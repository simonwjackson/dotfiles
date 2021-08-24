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
let g:EasyMotion_keys = 'fjdksla;ghrueiwoqpvmcnxbz''tyqp,.'

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
"  - Lightline
" ----------------------------------------------------------------------------

function! LightlineCocCoverageStatus() abort
  let status = str2nr(get(g:, 'coc_coverage_lines_pct', ''))
  if empty(status)
    return ''
  endif

  return '☂ ' . status . '%'
endfunction

let g:lightline = {
  \ 'colorscheme': 'plastic',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'readonly', 'filename' ]
  \   ],
  \   'right':[
  \     [ 'coccoverage', 'cocstatus' ],
  \     [ 'cocapollo' ]
  \   ],
  \ },
  \ 'component_function': {
  \   'coccoverage': 'LightlineCocCoverageStatus'
  \ }
\ }


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
"  - TaskWiki
" ----------------------------------------------------------------------------

" TODO: DRY - Load these from the config file. Or have ansible manage this
let g:taskwiki_taskrc_location = '~/.config/taskwarrior/taskrc'
let g:taskwiki_data_location = '~/.local/share/task'


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
let personal.path = '~/Documents/notes'

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

let g:lf_command_override = 'lf -command "map <enter> open" -command "map <esc> quit"' 



" ----------------------------------------------------------------------------
"  - Goyo
" ----------------------------------------------------------------------------

let g:goyo_width = 90
let g:goyo_height = '100%'

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
  :Limelight
endfunction

function! s:goyo_leave()
  :Limelight!
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


" ----------------------------------------------------------------------------
"  - Zettelkasten
" ----------------------------------------------------------------------------

let g:zettel_fzf_command = 'rg'



" ----------------------------------------------------------------------------
"  - Markdown
" ----------------------------------------------------------------------------

function! s:markdown_enter()
  " :Goyo
endfunction

autocmd FileType markdown,markdown.mdx call <SID>markdown_enter() 


" ----------------------------------------------------------------------------
"  - Telescope
" ----------------------------------------------------------------------------

lua << EOF
local actions = require('telescope.actions')

require('telescope').setup{
    defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close
          },
        },
    }
}

require('telescope').load_extension('coc')

require('auto-session').setup {
    --auto_session_enable_last_session=true,
}

require("todo-comments").setup {
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "FIX", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
  }
}

require("trouble").setup {}

EOF

