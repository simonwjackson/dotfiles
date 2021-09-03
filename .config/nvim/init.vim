" ==========================================================
"     Maintainer:
"     Simon W. Jackson    @simonwjackson
" ==========================================================

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

" ====================================================
"  => Plugins
" ====================================================

" Install vim-plug if needed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" ----------------------------------------------------
"  - Themes
" ----------------------------------------------------

Plug 'flrnprz/plastic.vim'



" ----------------------------------------------------
"  - Syntax
" ----------------------------------------------------

" Cucumber
Plug 'tpope/vim-cucumber'

" Elm
Plug 'andys8/vim-elm-syntax' 

" MDX
Plug 'jxnblk/vim-mdx-js'

" Docker
Plug 'ekalinin/dockerfile.vim'

" Git
Plug 'tpope/vim-git'

" A Vim syntax highlighting plugin for JavaScript and Flow.js
Plug 'yuezk/vim-js' 

" The React syntax highlighting and indenting plugin for vim.
" Also supports the typescript tsx file.
Plug 'maxmellon/vim-jsx-pretty'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Distinct highlighting of keywords vs values, 
" JSON-specific (non-JS) warnings, quote concealing.
Plug 'elzr/vim-json'

" JSONC (with comments)
Plug 'neoclide/jsonc.vim'

" A Vim plugin that provides GraphQL file detection, syntax highlighting, and indentation.
Plug 'jparise/vim-graphql'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks and partial hunks.
Plug 'airblade/vim-gitgutter'

" Improved * motions
Plug 'haya14busa/vim-asterisk'

" Briefly highlight which text was yanked.
Plug 'machakann/vim-highlightedyank'

" Modify * to also work with visual selections.
Plug 'nelstrom/vim-visual-star-search'

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'

" Vim sugar for the UNIX shell commands that need it the most
Plug 'tpope/vim-eunuch'



" ----------------------------------------------------------------------------
"  - Extras
" ----------------------------------------------------------------------------

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" The React syntax highlighting and indenting plugin for vim.
" Also supports the typescript tsx file.
Plug 'maxmellon/vim-jsx-pretty'

" A light and configurable statusline/tabline plugin for Vim http
Plug 'itchyny/lightline.vim'

" Adds file type icons to Vim plugins
Plug 'ryanoasis/vim-devicons'

" 🌷 Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'

" 🔦 Hyperfocus-writing in Vim.
Plug 'junegunn/limelight.vim'

" fzf for vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" COC for code completion
let g:coc_global_extensions = [
            \ 'coc-apollo',
            \ 'coc-coverage',
            \ 'coc-css',
            \ 'coc-eslint', 
            \ 'coc-explorer',
            \ 'coc-fzf-preview', 
            \ 'coc-html',
            \ 'coc-json', 
            \ 'coc-prettier', 
            \ 'coc-sh', 
            \ 'coc-snippets',
            \ 'coc-tsserver', 
            \ 'coc-vimlsp',
            \ 'coc-yaml',
            \ 'https://github.com/rodrigore/coc-tailwind-intellisense', 
            \ ]
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'npm install'}

" Use fzf instead of coc.nvim built-in fuzzy finder.  
Plug 'antoinemadec/coc-fzf' 

" Vim motions on speed!
Plug 'easymotion/vim-easymotion'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Vim plugin for intensely nerdy commenting powers
Plug 'scrooloose/nerdcommenter'

" Improved * motions
Plug 'haya14busa/vim-asterisk'

" Briefly highlight which text was yanked.
Plug 'machakann/vim-highlightedyank'

" Modify * to also work with visual selections.
Plug 'nelstrom/vim-visual-star-search'

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'

" FocusGained and FocusLost for vim inside Tmux
" This is a plugin for Vim to dim inactive windows.  
Plug 'tmux-plugins/vim-tmux-focus-events' 

" An eye friendly plugin that fades your inactive buffers and preserves your syntax highlighting!
Plug 'TaDaa/vimade'

" LF file browser
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'

" A personal wiki for Vim 
Plug 'vimwiki/vimwiki'

" Proper project management in vim.
Plug 'tools-life/taskwiki'

" Taskwarrior in VIM
Plug 'farseer90718/vim-taskwarrior'

" Zettelkasten for VIM
Plug 'michal-h21/vim-zettel'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Icons
Plug 'kyazdani42/nvim-web-devicons'

" Auto Sessions
Plug 'rmagatti/auto-session'
Plug 'rmagatti/session-lens'

" Todo Comments
Plug 'folke/todo-comments.nvim'

" Trouble
Plug 'folke/trouble.nvim'

" LazyGit
Plug 'kdheepak/lazygit.nvim'

call plug#end()




" ----------------------------------------------------------------------------
"  - Write to file even when it does not exist
" ----------------------------------------------------------------------------

function! s:WriteCreatingDirs()
    let l:file=expand("%")
    if empty(getbufvar(bufname("%"), '&buftype')) && l:file !~# '\v^\w+\:\/'
        let dir=fnamemodify(l:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
    write
endfunction

command! W call s:WriteCreatingDirs()


" ----------------------------------------------------------------------------
"  - Use K to show documentation in preview window
" ----------------------------------------------------------------------------
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocActionAsync('doHover')
    endif
endfunction


" ----------------------------------------------------------------------------
"  - Bspwm
" ----------------------------------------------------------------------------

function! s:VimNavigate(direction)
    try
        execute 'wincmd ' . a:direction
    catch
        echohl ErrorMsg | echo 'E11: Invalid in command-line window; <CR> executes, C  TRL-C quits: wincmd k' | echohl None
    endtry
endfunction

command! BspwmNavigateWest call s:BspwmAwareNavigate('h')
command! BspwmNavigateSouth call s:BspwmAwareNavigate('j')
command! BspwmNavigateNorth call s:BspwmAwareNavigate('k')
command! BspwmNavigateEast call s:BspwmAwareNavigate('l')

function! s:BspwmAwareNavigate(direction)
    let nr = winnr()
    call s:VimNavigate(a:direction)

    let at_tab_page_edge = (nr == winnr())
    if at_tab_page_edge
        if a:direction ==? 'h'
            let bspc_direction = 'west'
        elseif a:direction ==? 'j'
            let bspc_direction = 'south'
        elseif a:direction ==? 'k'
            let bspc_direction = 'north'
        elseif a:direction ==? 'l'
            let bspc_direction = 'east'
        endif

        let cmd = 'movement ' . bspc_direction . ' tmux'
        call system(cmd)
    endif
endfunction


" Explorer
let g:coc_explorer_global_presets = {
            \   '.vim': {
                \     'root-uri': '~/.vim',
                \   },
                \   'tab': {
                    \     'position': 'tab',
                    \     'quit-on-open': v:true,
                    \   },
                    \   'floating': {
                        \     'position': 'floating',
                        \     'open-action-strategy': 'sourceWindow',
                        \   },
                        \   'floatingTop': {
                            \     'position': 'floating',
                            \     'floating-position': 'center-top',
                            \     'open-action-strategy': 'sourceWindow',
                            \   },
                            \   'floatingLeftside': {
                                \     'position': 'floating',
                                \     'floating-position': 'left-center',
                                \     'floating-width': 50,
                                \     'open-action-strategy': 'sourceWindow',
                                \   },
                                \   'floatingRightside': {
                                    \     'position': 'floating',
                                    \     'floating-position': 'right-center',
                                    \     'floating-width': 50,
                                    \     'open-action-strategy': 'sourceWindow',
                                    \   },
                                    \   'simplify': {
                                        \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
                                        \   }
                                        \ }

nmap <space>e :CocCommand explorer<CR>
nmap <space>0 :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ...?
set hidden

" Default encoding
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Linebreak on 500 characters
set linebreak
set tw=500

set autoindent
set smartindent
set wrap

" Be smart when using tabs ;)
set smarttab

" Use spaces for tab key
set expandtab

" Default shell
set shell=/bin/sh

" Fix backspace indent
set backspace=indent,eol,start

" Enable filetype plugins
filetype plugin on
filetype indent on

" Load settings written in the file
set modeline

" Sets how many lines of history VIM has to remember
set history=1000

" How often the UI updates
set updatetime=300

" Share clipboard
set clipboard+=unnamedplus


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use RipGrep for grepping
set grepprg=rg\ --vimgrep 

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Makes search act like search in modern browsers
set incsearch 

" For regular expressions turn magic on
set magic


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set undolevels=1000                     
set undoreload=10000                    

" Persistent undo                       
if has("persistent_undo")               
    set undofile            
    set undodir=~/.local/share/nvim/undo
    set backupdir=~/.local/share/nvim/backup
    set directory=~/.local/share/nvim/backup
endif 



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Fast editing and reloading of vimrc configs
" Redraw after reload
" https://github.com/easymotion/vim-easymotion/issues/272#issuecomment-179505380

autocmd! BufWritePre $MYVIMRC :call Indent()
autocmd! BufWritePost $MYVIMRC nested source $MYVIMRC | redraw

" Required for markdown-folding plugin
set nocompatible
if has("autocmd")
    filetype plugin indent on
endif

" Autoindend files
augroup autoindent
    au!
    autocmd BufWritePre *.feature :normal migg=G`i
augroup End

" ============================================================================
"  => Colors and Fonts
" ============================================================================

if (has("termguicolors"))
    set termguicolors
endif

" Ensure 256 color support
set t_Co=256

" Enable syntax highlighting
syntax enable

" Scheme
colorscheme plastic

hi! Pmenu ctermbg=None ctermfg=None guibg=#111111 guifg=None
hi! SignColumn ctermfg=None ctermbg=None guibg=None
hi! NonText ctermfg=None ctermbg=None guibg=None guifg=None
silent! hi! EndOfBuffer ctermbg=None ctermfg=None guibg=None guifg=None
hi CursorColumn         guibg=None guifg=None

hi SpellBad cterm=underline
hi SpellLocal cterm=underline
hi SpellRare cterm=underline
hi SpellCap cterm=underline 

hi HighlightedYankRegion guifg=none guibg=#413C55 ctermbg=235 ctermfg=170

hi link diffAdded DiffAdd
hi link diffChanged DiffChange
hi link diffRemoved DiffDelete

hi UncoveredLine guifg=#d19a66 guibg=none

" Hide tildas
silent! hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

" Vertical Split
hi VertSplit guibg=bg guifg=#1d1b26

" hi StatusLineNC cterm=none ctermfg=none ctermbg=none guifg=#00ffff guibg=#00ffff

" ============================================================================
"  => VIM user interface
" ============================================================================ 

" split right, not left
set splitright            

" Show substitutions live
set inccommand=split      

" Keep lines above/below cursor
set scrolloff=5

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en

" Force vertical help
cabbrev help vert help

" Always show left column
set signcolumn=yes

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Disable line numbers
set nonumber

" Add a bit extra margin to the left
set foldcolumn=1

" Motion timeouts
set notimeout
set ttimeout

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Tab spaces
set tabstop=4
set shiftwidth=4
set softtabstop=0

" Auto format files on
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')


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
    layout_strategy = "vertical",
    sorting_strategy = "ascending",
    layout_config = {
        horizontal = {
            mirror = false,
            },
        vertical = {
            mirror = true,
            },
        },
    },
pickers = {
    -- Your special builtin config goes in here
    buffers = {
        sort_lastused = true,
        theme = "dropdown",
        previewer = false,
        mappings = {
            i = {
                ["<c-d>"] = require("telescope.actions").delete_buffer,
                -- Right hand side can also be the name of the action as a string
                ["<c-d>"] = "delete_buffer",
                },
            n = {
                ["<c-d>"] = require("telescope.actions").delete_buffer,
                }
            }
        },
    find_files = {
        theme = "dropdown"
        },
    },
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
nnoremap <silent> <F8>      <cmd>lua require('telescope.builtin').buffers()<cr>
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
