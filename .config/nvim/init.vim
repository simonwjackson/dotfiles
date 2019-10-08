" vim:fdm=marker

" Plugins: {{{ 
call plug#begin('~/.local/share/nvim/plugged')

" Plugins: Themes {{{
Plug 'Rigellute/shades-of-purple.vim'
Plug 'flrnprz/plastic.vim'
" }}}

" Plugins: Syntax {{{
Plug 'jxnblk/vim-mdx-js'
Plug 'mboughaba/i3config.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" }}}

" Plugins: Extras {{{ 
  
Plug 'janko/vim-test'
Plug 'tpope/vim-fugitive' 
Plug 'scrooloose/nerdcommenter'

" Gist:
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

" GraphQL:
Plug 'jparise/vim-graphql'

" Ctrlp:
Plug 'ctrlpvim/ctrlp.vim'

" Ale:
Plug 'w0rp/ale'

" Nerdtree:
Plug 'scrooloose/nerdtree'

" Easymotion:
Plug 'easymotion/vim-easymotion'

" Surround:
Plug 'tpope/vim-surround'

" GitGutter:
Plug 'airblade/vim-gitgutter'
" }}}
call plug#end()
" }}}

" Theme {{{
"""" enable 24bit true color
set termguicolors
syntax enable

" Theme: Dark {{{
set background=dark
silent! colorscheme plastic
hi VertSplit guibg=bg guifg=black
hi StatusLine guibg=bg guifg=#888888
hi StatusLineNC guibg=bg guifg=#555555
hi foldColumn guibg=bg
""" Hide tildas
silent! hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
" }}}

" Share clipboard
set clipboard+=unnamedplus

" Custom UI {{{
set ignorecase
set tabstop=2
set shiftwidth=2
let mapleader=" " 
set nonumber 

" Folding {{{
" syntax highlighting items specify folds
set foldmethod=syntax

" defines 0 col at window left, to indicate folding
set foldcolumn=0

" activate folding by JS syntax
" let javaScript_fold=1

" start file with all folds opened
set foldlevelstart=999
" }}}

" GitGutter {{{
" Floating previews
let g:gitgutter_preview_win_floating = 1

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

" Close NERDTree on file open

let NERDTreeQuitOnOpen=1

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
let g:ale_enabled = 1
let g:ale_fix_on_save = 1
" }}}

" CtrlP: {{{

"" main command
let g:ctrlp_map = '<leader>t'

"" ignored paths
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" }}}

" Gist: {{{
let g:gist_use_password_in_gitconfig = 1 
" }}}

" NERDCommenter: {{{
let g:task_rc_override = 'rc.defaultwidth=0 rc.report.next.sort=project-,tags- rc.report.next.columns=id,priority,tags,project,description,url,jiraurl rc.report.next.labels=ID,P,Tags,Proj,Desc,URL,URL'
" }}}
" Add spaces after comment delimiters by default

" NERDCommenter: {{{
" Add spaces after comment delimiters by default 
let g:NERDSpaceDelims = 1 

" Use compact syntax for prettified multi-line comments 
let g:NERDCompactSexyComs = 1 

" Align line-wise comment delimiters flush left instead of following code indentation 
let g:NERDDefaultAlign = 'left' 

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1 

" Enable trimming of trailing whitespace when uncommenting 
let g:NERDTrimTrailingWhitespace = 1 

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
" }}}

" Splits: {{{
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" }}}

" Tests: {{{
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" }}}

" Write to file even when it does not exist
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

" Update term title but restore old title after leaving Vim 
set title 
set titleold=

