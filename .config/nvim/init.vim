" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Theme
Plug 'Rigellute/shades-of-purple.vim'

" React
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

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
