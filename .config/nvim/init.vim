" vim:fdm=marker

" Plugins: {{{ 
call plug#begin('~/.local/share/nvim/plugged')

" Plugins: Themes {{{
Plug 'flrnprz/plastic.vim'
" }}}

" Plugins: Syntax {{{
Plug 'jxnblk/vim-mdx-js'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' } 
Plug 'terminalnode/sway-vim-syntax'
Plug 'sngn/vim-i3blocks-syntax'
" }}}

" Plugins: Extras {{{ 
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'Zaptic/elm-vim'
Plug 'junegunn/fzf.vim'
Plug 'jreybert/vimagit'
Plug 'janko/vim-test'
Plug 'tpope/vim-fugitive' 
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'jparise/vim-graphql'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
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

" Quick File Managment: {{{
nmap <Leader>w :write<Enter>
nmap <Leader>a :wall<Enter>
nmap <Leader>x :exit<Enter>
nmap <Leader>X :xa<Enter>
nmap <Leader>q :q<Enter>
nmap <Leader>Q :qall!<Enter>
" }}}

" EasyMotion: {{{
let g:EasyMotion_do_mapping = 0

nmap f <Plug>(easymotion-f)
nmap F <Plug>(easymotion-F)
nmap t <Plug>(easymotion-t)
nmap T <Plug>(easymotion-T)
nmap w <Plug>(easymotion-w)
nmap W <Plug>(easymotion-W)
nmap b <Plug>(easymotion-b)
nmap B <Plug>(easymotion-B)
nmap e <Plug>(easymotion-e)
nmap E <Plug>(easymotion-E)
nmap ge <Plug>(easymotion-ge)
nmap gE <Plug>(easymotion-gE)
nmap s <Plug>(easymotion-s2)

vmap j <Plug>(easymotion-j)
vmap k <Plug>(easymotion-k)
vmap f <Plug>(easymotion-f)
vmap F <Plug>(easymotion-F)
vmap t <Plug>(easymotion-t)
vmap T <Plug>(easymotion-T)
vmap w <Plug>(easymotion-w)
vmap W <Plug>(easymotion-W)
vmap b <Plug>(easymotion-b)
vmap B <Plug>(easymotion-B)
vmap e <Plug>(easymotion-e)
vmap E <Plug>(easymotion-E)
vmap ge <Plug>(easymotion-ge)
vmap gE <Plug>(easymotion-gE)
vmap s <Plug>(easymotion-s2)
" }}}

nnoremap  \|\| :silent ! kitty & <Enter>
nnoremap <Bslash><Bslash> :silent ! kitty -- nvim & <Enter>
set timeoutlen=200

" Autocmd
autocmd! BufWritePost $MYVIMRC source % 

" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

nmap <Leader>l :Limelight!!<Enter>
" xmap <Leader>l <Plug>(Limelight)
