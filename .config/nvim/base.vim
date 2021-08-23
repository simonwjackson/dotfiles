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
