" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Theme
Plug 'Rigellute/shades-of-purple.vim'

" React
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Nerd tree
Plug 'scrooloose/nerdtree'

" easy motion
Plug 'easymotion/vim-easymotion'

" surround
Plug 'tpope/vim-surround'

" git gutter
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()

"""" enable 24bit true color
set termguicolors

"""" enable the theme
syntax enable
colorscheme shades_of_purple

let mapleader=" "

set number

"""" Hide tildas
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

" GitGutter
let g:gitgutter_highlight_linenrs = 1

" NerdTree
"" keyboard
map <C-\> :NERDTreeToggle<CR>

"" Auto open (on dir)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"" Auto close if last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
