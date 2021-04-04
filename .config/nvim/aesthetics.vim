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

highlight HighlightedYankRegion guifg=none guibg=#413C55 ctermbg=235 ctermfg=170

highlight link diffAdded DiffAdd
highlight link diffChanged DiffChange
highlight link diffRemoved DiffDelete

" Hide tildas
silent! hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

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
