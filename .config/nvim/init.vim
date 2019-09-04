" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Rigellute/shades-of-purple.vim'

" Initialize plugin system
call plug#end()

"""" enable 24bit true color
set termguicolors

"""" enable the theme
syntax enable
colorscheme shades_of_purple

let mapleader=" "
