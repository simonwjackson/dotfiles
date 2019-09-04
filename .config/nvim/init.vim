" vim:fdm=marker

" Plugin system {{{ 
call plug#begin('~/.local/share/nvim/plugged')

" Themes {{{
Plug 'Rigellute/shades-of-purple.vim'
" }}}

" Syntax {{{
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" }}}

" Extras {{{
" Ctrl-p
Plug 'ctrlpvim/ctrlp.vim'

" ale
Plug 'w0rp/ale'

" Nerd tree
Plug 'scrooloose/nerdtree'

" easy motion
Plug 'easymotion/vim-easymotion'

" surround
Plug 'tpope/vim-surround'

" git gutter
Plug 'airblade/vim-gitgutter'
" }}}
call plug#end()
" }}}

" Theme {{{
"""" enable 24bit true color
set termguicolors

syntax enable
colorscheme shades_of_purple
" }}}

" Custom UI {{{
let mapleader=" " 
set number

"""" Hide tildas
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
" }}}

" Folding {{{
"syntax highlighting items specify folds
set foldmethod=syntax

"defines 0 col at window left, to indicate folding
set foldcolumn=0

"activate folding by JS syntax
let javaScript_fold=1

"start file with all folds opened
set foldlevelstart=0
" }}}

" GitGutter {{{
let g:gitgutter_highlight_linenrs = 1
" }}}

" NerdTree {{{
"" keyboard
map <C-\> :NERDTreeToggle<CR>

"" Auto open (on dir)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"" Auto close if last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}

" Ale {{{
"" files
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

"" symbols
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '~'

"" lint on save
let g:ale_fix_on_save = 1 
" }}}

" Ctrl-P {{{

"" main command
let g:ctrlp_map = '<leader>t'

"" ignored paths
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" }}}
