" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Theme
Plug 'Rigellute/shades-of-purple.vim'

" React
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" easy motion
Plug 'easymotion/vim-easymotion'

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
