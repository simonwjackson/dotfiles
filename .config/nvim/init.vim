" ============================================================================
"
"     Maintainer:
"     Simon W. Jackson    @simonwjackson
"
" ============================================================================
" vim:fdm=marker

" TODO: Turn off all plugin mappings :let no_plugin_maps = 1
" TODO: Todo list for project
" TODO: Todos in file in lightline

" ============================================================================
"  => Plugins
" ============================================================================

call plug#begin('~/.local/share/nvim/plugged')


" ----------------------------------------------------------------------------
"  - Themes
" ----------------------------------------------------------------------------

Plug 'flrnprz/plastic.vim'
Plug 'victorze/foo'



" ----------------------------------------------------------------------------
"  - Syntax
" ----------------------------------------------------------------------------

" Plug 'jxnblk/vim-mdx-js'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'
" Plug 'sngn/vim-i3blocks-syntax'
Plug 'ekalinin/dockerfile.vim'
" Plug 'wgwoods/vim-systemd-syntax'
Plug 'tpope/vim-git'
" Plug 'stephpy/vim-yaml'
" Plug 'PotatoesMaster/i3-vim-syntax'



" ----------------------------------------------------------------------------
"  - Extras
" ----------------------------------------------------------------------------

" See Git Blame information in the status bar for the currently selected line.
" Plug 'zivyangll/git-blame.vim'

" ALE indicator for the lightline vim plugin
" Plug 'maximbaz/lightline-ale'

" True Sublime Text style multiple selections for Vim
" Plug 'terryma/vim-multiple-cursors'

" A light and configurable statusline/tabline plugin for Vim http
Plug 'itchyny/lightline.vim'

" Snippet support to Vim
" Plug 'Shougo/neosnippet.vim'

" The standard snippets repository for neosnippet
" Plug 'Shougo/neosnippet-snippets'

" Adds file type icons to Vim plugins
" Plug 'ryanoasis/vim-devicons'

" Code coverage vim plugin
" Plug 'ruanyl/coverage.vim'

" A Vim plugin that manages your tag files
" Plug 'ludovicchabant/vim-gutentags'

" 🌷 Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'

" 🔦 Hyperfocus-writing in Vim.
Plug 'junegunn/limelight.vim'

" fzf for vim
Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim' | Plug 'yuki-ycino/fzf-preview.vim'

" Ease your git workflow within Vim
" Plug 'jreybert/vimagit'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Vim plugin for intensely nerdy commenting powers
Plug 'scrooloose/nerdcommenter'

" Vim plugin for Gist
" Plug 'mattn/gist-vim'

" Vim interface to Web API
" Plug 'mattn/webapi-vim'

" A Vim plugin that provides GraphQL file detection, syntax highlighting, and indentation.
" Plug 'jparise/vim-graphql'

" Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
" Plug 'w0rp/ale'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" Vim motions on speed!
Plug 'easymotion/vim-easymotion'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks and partial hunks.
Plug 'airblade/vim-gitgutter'

" 📔 The interactive scratchpad for hackers
" Plug 'metakirby5/codi.vim'

" Visualizes undo history
" Plug 'mbbill/undotree'

" A simple, easy-to-use Vim alignment plugin.
" Plug 'junegunn/vim-easy-align'

" Add spelling errors to the quickfix list (vim-ingo-library is a dependency).
" Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-SpellCheck'

" Improved * motions
Plug 'haya14busa/vim-asterisk'

" Briefly highlight which text was yanked.
Plug 'machakann/vim-highlightedyank'

" Modify * to also work with visual selections.
Plug 'nelstrom/vim-visual-star-search'

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

" Run test suites for various languages.
" Plug 'janko/vim-test'

" GitHub extension for fugitive
" Plug 'tpope/vim-rhubarb'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'

" Fugitive extension to manage and merge Git branches
" Plug 'idanarye/vim-merginal'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'

" COC for code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Coc languages
Plug 'neoclide/coc-tsserver', {'do': 'npm install'}
Plug 'neoclide/coc-jest', {'do': 'npm install'}
Plug 'neoclide/coc-json', {'do': 'npm install'}
Plug 'neoclide/coc-html', {'do': 'npm install'}
Plug 'neoclide/coc-css', {'do': 'npm install'}

call plug#end()



" ============================================================================
"  => General
" ============================================================================

let g:terminal = 'kitty'
let g:crkbd = 1

" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

" " Set to auto read when a file is changed from the outside
" set autoread
" au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=" "

" How often the UI updates
set updatetime=0

" Dont show mode
autocmd BufEnter,BufWritePost * set noshowmode

" Share clipboard
set clipboard+=unnamedplus

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Vertical movements should respect line wrapping
nnoremap j gj
nnoremap k gk


" ============================================================================
"  => VIM user interface
" ============================================================================

" Highlight current line
" set cursorline

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Always show left column
set signcolumn=yes

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en

" Force vertical help
" TODO: change based on screen orientation
" cabbrev help vert help

" Configure wild menu
set wildmenu
set wildignorecase
set completeopt=menuone,preview
set wildmode=list:full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=.git\*,.hg\*,.svn\*
else
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
"set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
	autocmd GUIEnter * set vb t_vb=
endif

" Disable line numbers
set nonumber

" Add a bit extra margin to the left
set foldcolumn=1

" Update term title but restore old title after leaving Vim
set title
set titleold=

" Motion timeouts
set notimeout
set ttimeout



" ============================================================================
"  => Colors and Fonts
" ============================================================================

if (has("termguicolors"))
    set termguicolors
endif

" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac



" ----------------------------------------------------------------------------
"  - Theme
" ----------------------------------------------------------------------------

try
    colorscheme plastic
    " set background=light
    " colorscheme github

    " Vim
    hi CursorColumn         guibg=None guifg=None
    hi CursorLine           guibg=#25292f guifg=None

    hi SpellBad cterm=underline
    hi SpellLocal cterm=underline
    hi SpellRare cterm=underline
    hi SpellCap cterm=underline

    " Dim
    highlight def Dim guifg=#333c4a

    " Highlight Yanks
    highlight HighlightedyankRegion cterm=reverse guibg=#1d2025 guifg=#af98e6

    " Ale
    " autocmd VimEnter * :highlight! ALEErrorSign ctermbg=None guibg=None ctermfg=204 guifg='#e06c75'
    " autocmd VimEnter * :highlight! ALEWarningSign ctermbg=None guibg=None ctermfg=180 guifg='#e5c07b'
    " autocmd VimEnter * :highlight! ALEInfoSign ctermbg=None guibg=None ctermfg=173 guifg='#d19a66'
    "
    " autocmd VimEnter * :highlight! ALEError ctermbg=None guibg=None ctermfg=204 guifg='#e06c75' gui=underline
    " autocmd VimEnter * :highlight! ALEWarning ctermbg=None guibg=None ctermfg=180 guifg='#e5c07b'
    " autocmd VimEnter * :highlight! ALEInfo ctermbg=None guibg=None ctermfg=173 guifg='#d19a66'

    hi VertSplit            guibg=bg guifg=black
    hi StatusLine           guibg=bg guifg=#888888
    hi StatusLineNC         guibg=bg guifg=#555555
    hi foldColumn           guibg=bg

    " Coverage
    hi CoverageUncovered    guifg=#5A5242

    " GitGutter
    highlight GitGutterAdd ctermbg=None guibg=none ctermfg=114 guifg='#556c49'
    highlight GitGutterChange ctermbg=None guibg=none ctermfg=180 guifg='#56b6c2'
    highlight GitGutterDelete ctermbg=None guibg=none ctermfg=204 guifg='#e06c75'
    highlight GitGutterChangeDelete ctermbg=None guibg=none ctermfg=180 guifg='#e5c07b'

    " NERDTrees File highlighting only the glyph/icon
    autocmd filetype nerdtree highlight haskell_icon ctermbg=none ctermfg=Red guifg=#ffa500
    autocmd filetype nerdtree highlight html_icon ctermbg=none ctermfg=Red guifg=#ffa500
    autocmd filetype nerdtree highlight go_icon ctermbg=none ctermfg=Red guifg=#ffa500

    let g:fzf_colors =
                \ { 'fg':    ['fg', 'Normal'],
                \ 'bg':      ['bg', 'Normal'],
                \ 'hl':      ['fg', 'Comment'],
                \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
                \ 'hl+':     ['fg', 'Statement'],
                \ 'info':    ['fg', 'PreProc'],
                \ 'border':  ['fg', 'Ignore'],
                \ 'prompt':  ['fg', 'Conditional'],
                \ 'pointer': ['fg', 'Exception'],
                \ 'marker':  ['fg', 'Keyword'],
                \ 'spinner': ['fg', 'Label'],
                \ 'header':  ['fg', 'Comment'] }

catch
endtry

" Hide tildas
silent! hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg




" ============================================================================
"  => Basic autocommands
" ============================================================================

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =



" ============================================================================
"  => Folding
" ============================================================================

" Hide folding characters
set fillchars=fold:\

" syntax highlighting items specify folds
set foldmethod=syntax

" defines 0 col at window left, to indicate folding
set foldcolumn=0

" start file with all folds opened
set foldlevelstart=999



" ============================================================================
" => Files, backups and undo
" ============================================================================

set undolevels=1000
set undoreload=10000

" Persistent undo
if has("persistent_undo")
	set undofile
	set undodir=~/.local/share/nvim/undo
	set backupdir=~/.local/share/nvim/backup
	set directory=~/.local/share/nvim/backup
endif



" ============================================================================
" => Text, tab and indent related
" ============================================================================

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines



" ============================================================================
" => Moving around, tabs, windows and buffers
" ============================================================================

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



" ============================================================================
" => Custom keyboard mappings
" ============================================================================

if g:crkbd == 1
    nnoremap <S-PageDown> <C-f><CR>
    vnoremap <S-PageDown> <C-f><CR>
    inoremap <S-PageDown> <C-o><C-f><CR>

    nnoremap <S-PageUp> <C-b><CR>
    vnoremap <S-PageUp> <C-b><CR>
    inoremap <S-PageUp> <C-o><C-b><CR>

    nnoremap <PageDown> <C-d>
    inoremap <PageDown> <C-o><C-d><CR>
    vnoremap <PageDown> <C-d><CR>

    nnoremap <PageUp> <C-u>
    inoremap <PageUp> <C-o><C-u>
    vnoremap <PageUp> <C-u>

    nmap <A-Left> <Plug>(easymotion-ge)
    vmap <A-Left> <Plug>(easymotion-ge)
    imap <A-Left> <C-o><Plug>(easymotion-ge)

    nmap <C-Left> <Plug>(easymotion-b)
    vmap <C-Left> <Plug>(easymotion-b)
    imap <C-Left> <C-o><Plug>(easymotion-b)

    nmap <C-Right> <Plug>(easymotion-w)
    vmap <C-Right> <Plug>(easymotion-w)
    imap <C-Right> <C-o><Plug>(easymotion-w)

    nmap <A-Right> <Plug>(easymotion-e)
    vmap <A-Right> <Plug>(easymotion-e)
    imap <A-Right> <C-o><Plug>(easymotion-e)

    nmap <C-A-S-Left> <Plug>(easymotion-gE)
    vmap <C-A-S-Left> <Plug>(easymotion-gE)
    imap <C-A-S-Left> <C-o><Plug>(easymotion-gE)

    nmap <C-A-Left> <Plug>(easymotion-B)
    vmap <C-A-Left> <Plug>(easymotion-B)
    imap <C-A-Left> <C-o><Plug>(easymotion-B)

    nmap <C-A-Right> <Plug>(easymotion-W)
    vmap <C-A-Right> <Plug>(easymotion-W)
    imap <C-A-Right> <C-o><Plug>(easymotion-W)

    nmap <C-A-S-Right> <Plug>(easymotion-E)
    vmap <C-A-S-Right> <Plug>(easymotion-E)
    imap <C-A-S-Right> <C-o><Plug>(easymotion-E)

    " Disable keys
    noremap <Backspace> <Nop>

    " Save
    inoremap <C-s>     <C-O>:update<cr>
    nnoremap <C-s>     :update<cr>
    "nmap <C-w> :quit<CR>
    "inoremap <C-w> :quit<CR>
endif



" ----------------------------------------------------------------------------
" - Editing mappings
" ----------------------------------------------------------------------------

" Move a line of text using ALT+[jk] or Command+[jk] on mac
"nnoremap <silent> <C-j> :move+<cr>
"nnoremap <silent> <C-k> :move-2<cr>
" xnoremap <silent> <M-k> :move-2<cr>gv
" xnoremap <silent> <M-j> :move'>+<cr>gv
"
" if has("mac") || has("macunix")
"     nmap <D-j> <M-j>
"     nmap <D-k> <M-k>
"     vmap <D-j> <M-j>
"     vmap <D-k> <M-k>
" endif



" ============================================================================
"  => Spell checking
" ============================================================================

" Toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Automatically fix the last misspelled word and jump back to where you were.
nnoremap <leader>sp :normal! mz[s1z=`z<CR>



" ============================================================================
" => Misc
" ============================================================================

" set completeopt+=preview

" let g:task_rc_override = 'rc.defaultwidth=0 rc.report.next.sort=project-,tags- rc.report.next.columns=id,priority,tags,project,description,url,jiraurl rc.report.next.labels=ID,P,Tags,Proj,Desc,URL,URL'

" Quickly open a markdown buffer for scribble
" nnoremap <leader><leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Quick quit
nmap <Leader>q :q<Enter>

" Quick close buffer
nmap <Leader>x :Bclose<Enter>

" Quick marker
nnoremap <Leader>m `m

" Make Y behave like other capitals
nnoremap Y y$

" qq to record, Q to replay
nnoremap Q @q

" nnoremap <CR> o<Esc>
" nnoremap <S-CR> <S-o><Esc>

" autocmd CmdwinEnter * nnoremap <CR> <CR>
" autocmd BufReadPost quickfix nnoremap <CR> <CR>

" nnoremap <silent> <Tab> <<
" nnoremap <silent> <S-Tab> >>
" xnoremap <silent> <Tab> <gv
" xnoremap <silent> <S-Tab> >gv

" if has("nvim")
"     au TermOpen * tnoremap <Esc> <c-\><c-n>
" endif

" if has("nvim")
"     au FileType fzf tunmap <Esc>
" endif

" command! -nargs=* Help silent execute '!'. g:terminal . " --class floatingApp -- nvim -c 'tab help | -tabclose' &"



" ============================================================================
" => Helper functions
" ============================================================================

" ----------------------------------------------------------------------------
"  - Upgrade all plugins
" ----------------------------------------------------------------------------

function! UpgradePlugins()
	CocUpdateSync
	PlugInstall
endfunction

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



" " ----------------------------------------------------------------------------
" "  - Returns true if paste mode is enabled
" " ----------------------------------------------------------------------------
"
" function! HasPaste()
"     if &paste
"         return 'PASTE MODE  '
"     endif
"     return ''
" endfunction
"
" " Returns true if at least delay seconds have elapsed since the last time this function was called, based on the time
" " contained in the variable "timer". The first time it is called, the variable is defined and the function returns
" " true.
" "
" " True means not zero.
" "
" " For example, to execute something no more than once every two seconds using a variable named "b:myTimer", do this:
" "
" " if LongEnough( "b:myTimer", 2 )
" "   <do the thing>
" " endif
" "
" " The optional 3rd parameter is the number of times to suppress the operation within the specified time and then let it
" " happen even though the required delay hasn't happened. For example:
" "
" " if LongEnough( "b:myTimer", 2, 5 )
" "   <do the thing>
" " endif
" "
" " Means to execute either every 2 seconds or every 5 calls, whichever happens first.
" function! LongEnough( timer, delay, ... )
"     let result = 0
"     let suppressionCount = 0
"     if ( exists( 'a:1' ) )
"         let suppressionCount = a:1
"     endif
"
"     " This is the first time we're being called.
"     if ( !exists( a:timer ) )
"         let result = 1
"     else
"         let timeElapsed = localtime() - {a:timer}
"
"         " If it's been a while...
"         if ( timeElapsed >= a:delay )
"             let result = 1
"         elseif ( suppressionCount > 0 )
"             let {a:timer}_callCount += 1
"
"             " It hasn't been a while, but the number of times we have been called has hit the suppression limit, so we activate
"             " anyway.
"             if ( {a:timer}_callCount >= suppressionCount )
"                 let result = 1
"             endif
"         endif
"     endif
"
"     " Reset both the timer and the number of times we've been called since the last update.
"     if ( result )
"         let {a:timer} = localtime()
"         let {a:timer}_callCount = 0
"     endif
"     return result
" endfunction



" ----------------------------------------------------------------------------
"  - Check for installed plugin
" ----------------------------------------------------------------------------

function! PlugLoaded(name)
	return (
				\ has_key(g:plugs, a:name) &&
				\ isdirectory(g:plugs[a:name].dir) &&
				\ stridx(&rtp, g:plugs[a:name].dir) >= 0)
endfunction



" " ----------------------------------------------------------------------------
" "  - Return all buffers
" " ----------------------------------------------------------------------------
"
" function! s:buflist()
"     redir => ls
"     silent ls
"     redir END
"     return split(ls, '\n')
" endfunction
"
"
"
" " ============================================================================
" " => Custom Commands & Plugins
" " ============================================================================
"
" " ----------------------------------------------------------------------------
" "  - EX | chmod +x
" " ----------------------------------------------------------------------------
"
" command! EX if !empty(expand('%'))
"             \|   write
"             \|   call system('chmod +x '.expand('%'))
"             \|   silent e
"             \| else
"                 \|   echohl WarningMsg
"                 \|   echo 'Save the file first'
"                 \|   echohl None
"                 \| endif
"
"
"
" " ----------------------------------------------------------------------------
" "  - Profile
" " ----------------------------------------------------------------------------
"
" function! s:profile(bang)
"     if a:bang
"         profile pause
"         noautocmd qall
"     else
"         profile start /tmp/profile.log
"         profile func *
"         profile file *
"     endif
" endfunction
" command! -bang Profile call s:profile(<bang>0)
"
"
"
" " ----------------------------------------------------------------------------
" "  - Use K to show documentation in preview window
" " ----------------------------------------------------------------------------
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"     if (index(['vim','help'], &filetype) >= 0)
"         execute 'h '.expand('<cword>')
"     else
"         call CocAction('doHover')
"     endif
" endfunction
"
"
"
" " ----------------------------------------------------------------------------
" "  - #gi / #gpi | go to next/previous indentation level
" " ----------------------------------------------------------------------------
"
" function! s:indent_len(str)
"     return type(a:str) == 1 ? len(matchstr(a:str, '^\s*')) : 0
" endfunction
"
" function! s:go_indent(times, dir)
"     for _ in range(a:times)
"         let l = line('.')
"         let x = line('$')
"         let i = s:indent_len(getline(l))
"         let e = empty(getline(l))
"
"         while l >= 1 && l <= x
"             let line = getline(l + a:dir)
"             let l += a:dir
"             if s:indent_len(line) != i || empty(line) != e
"                 break
"             endif
"         endwhile
"         let l = min([max([1, l]), x])
"         execute 'normal! '. l .'G^'
"     endfor
" endfunction
"
" nnoremap <silent> gi :<c-u>call <SID>go_indent(v:count1, 1)<cr>
" nnoremap <silent> gpi :<c-u>call <SID>go_indent(v:count1, -1)<cr>
"
"
" " ----------------------------------------------------------------------------
" "  - ?ii / ?ai | indent-object
" "  - ?io       | strictly-indent-object
" " ----------------------------------------------------------------------------
" function! s:indent_len(str)
"     return type(a:str) == 1 ? len(matchstr(a:str, '^\s*')) : 0
" endfunction
"
" function! s:indent_object(op, skip_blank, b, e, bd, ed)
"     let i = min([s:indent_len(getline(a:b)), s:indent_len(getline(a:e))])
"     let x = line('$')
"     let d = [a:b, a:e]
"
"     if i == 0 && empty(getline(a:b)) && empty(getline(a:e))
"         let [b, e] = [a:b, a:e]
"         while b > 0 && e <= line('$')
"             let b -= 1
"             let e += 1
"             let i = min(filter(map([b, e], 's:indent_len(getline(v:val))'), 'v:val != 0'))
"             if i > 0
"                 break
"             endif
"         endwhile
"     endif
"
"     for triple in [[0, 'd[o] > 1', -1], [1, 'd[o] < x', +1]]
"         let [o, ev, df] = triple
"
"         while eval(ev)
"             let line = getline(d[o] + df)
"             let idt = s:indent_len(line)
"
"             if eval('idt '.a:op.' i') && (a:skip_blank || !empty(line)) || (a:skip_blank && empty(line))
"                 let d[o] += df
"             else | break | end
"         endwhile
"     endfor
"     execute printf('normal! %dGV%dG', max([1, d[0] + a:bd]), min([x, d[1] + a:ed]))
" endfunction
" xnoremap <silent> ii :<c-u>call <SID>indent_object('>=', 1, line("'<"), line("'>"), 0, 0)<cr>
" onoremap <silent> ii :<c-u>call <SID>indent_object('>=', 1, line('.'), line('.'), 0, 0)<cr>
" xnoremap <silent> ai :<c-u>call <SID>indent_object('>=', 1, line("'<"), line("'>"), -1, 1)<cr>
" onoremap <silent> ai :<c-u>call <SID>indent_object('>=', 1, line('.'), line('.'), -1, 1)<cr>
" xnoremap <silent> io :<c-u>call <SID>indent_object('==', 0, line("'<"), line("'>"), 0, 0)<cr>
" onoremap <silent> io :<c-u>call <SID>indent_object('==', 0, line('.'), line('.'), 0, 0)<cr>
"
"
"
" " ----------------------------------------------------------------------------
" "  - Todos in file
" " ----------------------------------------------------------------------------
"
" " function! FZFTodosHere()
" "     if PlugLoaded('fzf.vim')
" "         call fzf#vim#buffer_lines('\(TODO\|FIXME|HACK|REFACTOR|BUG\): ')
" "     else
" "         echom 'fzf.vim required'
" "     endif
" " endfunction
"
" " function! AdjustSize()
" "     if (winwidth('%')<50) && (&columns<=90)
" "         set columns = 2 * &columns
" "         "then make widths the same
" "         exe "normal! \<c-w>="
" "     else
" "         set columns=90
" "         " or adjust size only if window isnt' huge...
" "         " if columns >= 150
" "         "     set columns = 90
" "         " endif
" "     endif
" " endfunction
"
"
"
" " ----------------------------------------------------------------------------
" "  - Open terminal with cwd in new window
" " ----------------------------------------------------------------------------
"
" function! TermHere()
"     silent execute '!'. g:terminal . ' &'
" endfunction
"
" nnoremap <F4> :call TermHere()<CR>
"
"
"
" " ----------------------------------------------------------------------------
" "  - Start common npm commands in new terminal window
" " ----------------------------------------------------------------------------
"
" function! NpmHere()
"     silent execute '!'. g:terminal ' -- npm run start &'
"     silent execute '!'. g:terminal ' -- npm run api &'
"     silent execute '!'. g:terminal ' -- npm run test -u &'
" endfunction
"
" nnoremap <F6> :call NpmHere()<CR>
"
"
"
" " ----------------------------------------------------------------------------
" "  - Open a new instance of Vim in the cwd
" " ----------------------------------------------------------------------------
"
" function! VimHere(file)
"     silent execute '!'. g:terminal ' -- nvim ' . expand(a:file) . ' &'
" endfunction
"
" command! -nargs=* VimHere call VimHere('<args>')
" nnoremap <F3> :call VimHere('')<CR>
"
"
"
" " ----------------------------------------------------------------------------
" "  - Remove the Windows ^M - when the encodings gets messed up
" " ----------------------------------------------------------------------------
"
" fun! CleanPaste()
"     let save_cursor = getpos(".")
"     let old_query = getreg('/')
"
"     silent! %s/\r//ge
"
"     call setpos('.', save_cursor)
"     call setreg('/', old_query)
" endfun
"
" if has("autocmd")
"     autocmd BufWritePre * :call CleanPaste()
" endif
"
"
"
" " ----------------------------------------------------------------------------
" "  - Don't close window, when deleting a buffer
" " ----------------------------------------------------------------------------
"
" function! <SID>BufcloseCloseIt()
"     let l:currentBufNum = bufnr("%")
"     let l:alternateBufNum = bufnr("#")
"
"     if buflisted(l:alternateBufNum)
"         buffer #
"     else
"         bnext
"     endif
"
"     if bufnr("%") == l:currentBufNum
"         new
"     endif
"
"     if buflisted(l:currentBufNum)
"         execute("bdelete! ".l:currentBufNum)
"     endif
" endfunction
"
" command! Bclose call <SID>BufcloseCloseIt()
"
"
"
" " ============================================================================
" "  => Language Specific Options
" " ============================================================================
"
" " ----------------------------------------------------------------------------
" "  - Javascript
" " ----------------------------------------------------------------------------
"
" au FileType javascript call JavaScriptFold()
" au FileType javascript setl fen
" au FileType javascript setl nocindent
"
" au FileType javascript imap <C-t> $log();<esc>hi
" au FileType javascript imap <C-a> alert();<esc>hi
"
" au FileType javascript inoremap <buffer> $r return
" au FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi
" au FileType javascript nnoremap <leader><leader>d i/**<right>
"
" function! JavaScriptFold()
"     setl foldmethod=syntax
"     setl foldlevelstart=1
"     syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
"
"     function! FoldText()
"         return substitute(getline(v:foldstart), '{.*', '{...}', '')
"     endfunction
"     setl foldtext=FoldText()
" endfunction
"
"
" " ----------------------------------------------------------------------------
" "  - Shell
" " ----------------------------------------------------------------------------
"
" if exists('$TMUX')
"     if has('nvim')
"         set termguicolors
"     else
"         set term=screen-256color
"     endif
" endif
"
"
" " ----------------------------------------------------------------------------
" "  - Markdown
" " ----------------------------------------------------------------------------
"
" let vim_markdown_folding_disabled = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! BufWritePre $MYVIMRC :call Indent()
autocmd! BufWritePost $MYVIMRC source $MYVIMRC


" ============================================================================
" => Plugin configuration
" ============================================================================

" ----------------------------------------------------------------------------
"  - Coc
" ----------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" " ----------------------------------------------------------------------------
" "  - Todos here
" " ----------------------------------------------------------------------------
"
" " nnoremap <leader>a :call FZFTodosHere()<cr>

" ----------------------------------------------------------------------------
"  - Git gutter
" ----------------------------------------------------------------------------

let g:gitgutter_enabled=1
let g:gitgutter_max_signs=2000
let g:gitgutter_preview_win_floating=1

let g:gitgutter_override_sign_column_highlight = 0
call gitgutter#highlight#define_highlights()

highlight clear SignColumn

" Flatten all gutter icons
let g:gitgutter_sign_added = '│' " █▓▒░║
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '│'
let g:gitgutter_sign_removed_first_line = '│'
let g:gitgutter_sign_modified_removed = '│'

nnoremap <silent> <leader>d :GitGutterToggle<cr>


" " ----------------------------------------------------------------------------
" "  - zivyangll / git-blame.vim
" " ----------------------------------------------------------------------------
"
" function! GitBlameAuthor() abort
"     if LongEnough("b:myTimer", 2)
"         let l:blame = gitblame#commit_summary(expand('%'), line('.'))
"
"         if has_key(l:blame, 'author')
"             return l:blame['author']
"         else
"             return ''
"         endif
"     else
"         return ''
"     endif
" endif
" endfunction
"
"
" " ----------------------------------------------------------------------------
" "  - itchyny / lightline.vim
" " ----------------------------------------------------------------------------

" let g:lightline#bufferline#enable_devicons = 1
set laststatus=2

" \   'author': 'GitBlameAuthor'
" \   'gutentags': 'gutentags#statusline'
" \ [ 'linter_errors', 'linter_warnings', 'linter_infos' ]]
" \   'todos': 'tasklist#total',

let g:lightline = {
            \ 'colorscheme': 'plastic',
            \ 'active': {
            \   'left': [[ 'gitbranch', 'filename' ]],
            \   'right': [[ 'lineinfo' ]],
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head',
            \ },
            \ }

" " let g:lightline.component_expand = {
" "             \  'linter_checking': 'lightline#ale#checking',
" "             \  'linter_infos': 'lightline#ale#infos',
" "             \  'linter_warnings': 'lightline#ale#warnings',
" "             \  'linter_errors': 'lightline#ale#errors',
" "             \  'linter_ok': 'lightline#ale#ok',
" "             \ }
"
" " let g:lightline.component_type = {
" "             \     'linter_checking': 'right',
" "             \     'linter_infos': 'right',
" "             \     'linter_warnings': 'warning',
" "             \     'linter_errors': 'error',
" "             \     'linter_ok': 'right',
" "             \ }
"
" let g:lightline#ale#indicator_infos = "ﭦ "
" let g:lightline#ale#indicator_warnings = " "
" let g:lightline#ale#indicator_errors = " "
"
"
" " ----------------------------------------------------------------------------
" "  - junegunn/fzf.vim
" " ----------------------------------------------------------------------------

let g:fzf_command_prefix = "FZF"
let g:fzf_buffers_jump = 1

function! s:open_branch_fzf(line)
    let l:branch = a:line
    execute 'split | terminal git checkout ' . l:branch
    call feedkeys('i', 'n')
endfunction

function! s:show_branches_fzf(bang)
    let l:current = system('git symbolic-ref --short HEAD')
    let l:current = substitute(l:current, '\n', '', 'g')
    let l:current_scaped = substitute(l:current, '/', '\\/', 'g')
    call fzf#vim#grep(
                \ "git branch -r --no-color | sed -r -e 's/^[^/]*\\///' -e '/^" . l:current_scaped . "$/d' -e '/^HEAD/d' | sort -u", 0,
                \ { 'sink': function('s:open_branch_fzf'), 'options': ['--no-multi', '--header='.l:current] }, a:bang)
endfunction

command! -bang -nargs=0 FzGCheckout call <SID>show_branches_fzf(<bang>0)

" Open fzf in a floating window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" " nnoremap <leader>gb :FZFGitCheckout<CR>
" " nnoremap <silent> <Leader>f :FZFOmniFiles<CR>
" " nnoremap <Leader>b :FZFBuffers<CR>
" " nnoremap <Leader>t :FZFBTags<CR>
" " nnoremap <Leader><leader>t :FZFTags<CR>
"
" " Hide FZF status line
" " autocmd! FileType fzf
" " autocmd  FileType fzf set laststatus=0 noshowmode noruler
" " \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
"
"
" " Terminal buffer options for fzf
" autocmd! FileType fzf
" autocmd  FileType fzf set noshowmode noruler nonu
"
" " if has('nvim')
" "     function! FloatingFZF(width, height, border_highlight)
" "         function! s:create_float(hl, opts)
" "             let buf = nvim_create_buf(v:false, v:true)
" "             let opts = extend({'relative': 'editor', 'style': 'minimal'}, a:opts)
" "             let win = nvim_open_win(buf, v:true, opts)
" "             call setwinvar(win, '&winhighlight', 'NormalFloat:'.a:hl)
" "             call setwinvar(win, '&colorcolumn', '')
" "             return buf
" "         endfunction
" "
" "         " Size and position
" "         let s:padding = 5
" "         let s:maxRows = 10
" "         let s:maxCols = 80
" "
" "         let s:columnStart = 0
" "         let s:rowStart = 0
" "
" "         let s:width = float2nr(&columns)
" "         let s:height = float2nr(&lines)
" "
" "         if (s:width > s:maxCols)
" "             let s:columnStart = s:width / 2 - s:maxCols / 2
" "             let s:width = s:maxCols
" "         endif
" "
" "         if (s:height > s:maxRows)
" "             let s:rowStart = s:height / 2 - s:maxRows / 2
" "             let s:height = s:maxRows
" "         endif
" "
" "         " Border
" "         let top = '╭' . repeat('─', s:width - 2) . '╮'
" "         let mid = '│' . repeat(' ', s:width - 2) . '│'
" "         let bot = '╰' . repeat('─', s:width - 2) . '╯'
" "         let border = [top] + repeat([mid], s:height - 2) + [bot]
" "
" "         " Draw frame
" "         let s:frame = s:create_float(a:border_highlight, {'row': s:rowStart, 'col': s:columnStart, 'width': s:width, 'height': s:height})
" "         call nvim_buf_set_lines(s:frame, 0, -1, v:true, border)
" "
" "         " Draw viewport
" "         call s:create_float('Normal', {'row': s:rowStart + 1, 'col': s:columnStart + 2, 'width': s:width - 4, 'height': s:height - 2})
" "         autocmd BufWipeout <buffer> execute 'bwipeout' s:frame
" "     endfunction
" "
" "     let g:fzf_layout = { 'window': 'call FloatingFZF(0.9, 0.6, "Comment")' }
" " endif
"
"
"
" " ----------------------------------------------------------------------------
" "  - FZF / Omni files
" " ----------------------------------------------------------------------------
"
" " use git repo to filter out files, otherwise fallback to default
" " command! -nargs=* FZFOmniFiles :call FZFOmniFiles()
" "
" " function! FZFOmniFiles()
" "     let is_git = system('git status')
" "
" "     if v:shell_error
" "         :FZFFiles
" "     else
" "         :FZFGitFiles
" "     endif
" " endfun
"
"
"
" " ----------------------------------------------------------------------------
" "  - FZF / Files
" " ----------------------------------------------------------------------------
"
" " Show all files in cwd
" " uses devicons
" " function! FZFFiles()
" "     let l:fzf_files_options = ' -m'
" "
" "     function! s:files()
" "         let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
" "         return s:prepend_icon(l:files)
" "     endfunction
" "
" "     function! s:prepend_icon(candidates)
" "         let result = []
" "         for candidate in a:candidates
" "             let filename = fnamemodify(candidate, ':p:t')
" "             let icon = WebDevIconsGetFileTypeSymbol(filename, isdirectory(filename))
" "             call add(result, printf("%s %s", icon, candidate))
" "         endfor
" "
" "         return result
" "     endfunction
" "
" "     function! s:edit_file(items)
" "         let items = a:items
" "         let i = 1
" "         let ln = len(items)
" "         while i < ln
" "             let item = items[i]
" "             let parts = split(item, ' ')
" "             let file_path = get(parts, 1, '')
" "             let items[i] = file_path
" "             let i += 1
" "         endwhile
" "         call s:Sink(items)
" "     endfunction
" "
" "     let opts = fzf#wrap({})
" "     let opts.source = <sid>files()
" "     let s:Sink = opts['sink*']
" "     let opts['sink*'] = function('s:edit_file')
" "     let opts.options .= l:fzf_files_options
" "     call fzf#run(opts)
" "
" " endfunction
"
"
"
" " ----------------------------------------------------------------------------
" "  - FZF / Git files (Devicons)
" " ----------------------------------------------------------------------------
"
" " command! -nargs=* FZFGitFiles :call FZFGitFiles()
" "
" " " Show all files in git repo
" " " uses devicons
" " function! FZFGitFiles()
" "     let l:fzf_files_options = ' -m'
" "     let s:all_files = 'git ls-files --exclude-standard && git ls-files --others --exclude-standard'
" "
" "     function! s:files()
" "         " let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
" "         let l:files = split(system(s:all_files), '\n')
" "         return s:prepend_icon(l:files)
" "     endfunction
" "
" "     function! s:prepend_icon(candidates)
" "         let result = []
" "         for candidate in a:candidates
" "             let filename = fnamemodify(candidate, ':p:t')
" "             let icon = WebDevIconsGetFileTypeSymbol(filename, isdirectory(filename))
" "             call add(result, printf("%s %s", icon, candidate))
" "         endfor
" "
" "         return result
" "     endfunction
" "
" "     function! s:edit_file(items)
" "         let items = a:items
" "         let i = 1
" "         let ln = len(items)
" "         while i < ln
" "             let item = items[i]
" "             let parts = split(item, ' ')
" "             let file_path = get(parts, 1, '')
" "             let items[i] = file_path
" "             let i += 1
" "         endwhile
" "         call s:Sink(items)
" "     endfunction
" "
" "     let opts = fzf#wrap({})
" "     let opts.source = <sid>files()
" "     let s:Sink = opts['sink*']
" "     let opts['sink*'] = function('s:edit_file')
" "     let opts.options .= l:fzf_files_options
" "     call fzf#run(opts)
" "
" " endfunction
"
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => FZF / Git Branch
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" function FZFGitCheckout()
"     function! s:open_branch_fzf(line)
"         let l:parser = split(a:line)
"         let l:branch = l:parser[0]
"         if l:branch ==? '*'
"             let l:branch = l:parser[1]
"         endif
"
"         silent execute '!git checkout --track -b ' . l:branch . ' || git checkout -b ' . l:branch
"     endfunction
"
"     call fzf#vim#grep(
"                 \   'git branch -v --remote', 0,
"                 \   {
"                 \     'sink': function('s:open_branch_fzf')
"                 \   },
"                 \ )
" endfunction
"
" command! -nargs=* FZFGitCheckout :call FZFGitCheckout()
"
"
"
" " ----------------------------------------------------------------------------
" "  - FZF / Tags
" " ----------------------------------------------------------------------------
"
" " Command to generate tags file
" let g:fzf_tags_command = 'ctags -R .'



" ----------------------------------------------------------------------------
"  - scrooloose / nerdtree
" ----------------------------------------------------------------------------

function! NERDTreeHere()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    else
        NERDTreeFind
    endif
endfunction

" Mappings
nnoremap <F5> :call NERDTreeHere()<CR>
vnoremap <F5> :call NERDTreeHere()<CR>
inoremap <F5> <C-o>:call NERDTreeHere()<CR>

" Close NERDTree on file open
let g:NERDTreeHijackNetrw=0
let NERDTreeQuitOnOpen=1
let g:loaded_netrw= 1
let g:netrw_loaded_netrwPlugin= 1



" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => w0rp / ale
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" " filetypes
" let g:ale_fixers = {
"             \ 'javascript': ['eslint'],
"             \ }
"
" " Always show ale gutter
" let g:ale_sign_column_always = 1
"
" " Ale symbols
" let g:ale_sign_error = ''
" let g:ale_sign_warning = ''
" let g:ale_sign_inform = 'ﭦ'
"
" " lint on save
" let g:ale_enabled = 1
" let g:ale_fix_on_save = 1
" let g:ale_lint_delay = 1000
" nmap <leader><tab> <Plug>(ale_next_wrap)
" " nmap z/ <Plug>(ale_previous_wrap)
"
" " Toggle details
" nmap <Leader>j :ALEDetail<Enter>
"
" " Better 'go to def'
" nnoremap gd :ALEGoToDefinition<cr>
"
"
"
" " ----------------------------------------------------------------------------
" "  - mattn / gist-vim
" " ----------------------------------------------------------------------------
"
" let g:gist_use_password_in_gitconfig = 1
"
"
"
" " ----------------------------------------------------------------------------
" "  - Shougo / deoplete.nvim
" " ----------------------------------------------------------------------------
"
" " Use deoplete at startup
" let g:deoplete#enable_at_startup = 1



" ----------------------------------------------------------------------------
"  - scrooloose / nerdcommenter
" ----------------------------------------------------------------------------

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => easymotion/vim-easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't map easymotion defaults
let g:EasyMotion_do_mapping = 0

" Easymotion keys
let g:EasyMotion_keys = 'asdfjklghqweruiopzxcvmtybn:'

" Finding
nmap f <Plug>(easymotion-f)
nmap F <Plug>(easymotion-F)
nmap t <Plug>(easymotion-t)
nmap T <Plug>(easymotion-T)
nmap s <Plug>(easymotion-s2)

" Visual mode
vmap j <Plug>(easymotion-j)
vmap k <Plug>(easymotion-k)
vmap f <Plug>(easymotion-f)
vmap F <Plug>(easymotion-F)
vmap t <Plug>(easymotion-t)
vmap T <Plug>(easymotion-T)
vmap s <Plug>(easymotion-s2)



" " ----------------------------------------------------------------------------
" "  - metakirby5/codi.vim
" " ----------------------------------------------------------------------------
"
" " Toggle Codi
" nnoremap <F2> :Codi!!<CR>
"
"
"
" ----------------------------------------------------------------------------
"  - goyo.vim + limelight.vim
" ----------------------------------------------------------------------------

let g:goyo_height = '100%'
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1

" On window resize, if goyo is active, do <c-w>= to resize the window
autocmd VimResized * if exists('#goyo') | exe "normal \<c-w>=" | endif

function! s:goyo_enter()
    if executable('tmux') && strlen($TMUX)
        silent !tmux set status off
        silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    endif
    set noshowmode
    set noshowcmd
    set scrolloff=999
    Limelight
endfunction

function! s:goyo_leave()
    if executable('tmux') && strlen($TMUX)
        silent !tmux set status on
        silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    endif
    set showmode
    set showcmd
    set scrolloff=5
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <Leader>G :Goyo<CR>

nmap <Leader>l :Limelight!!<Enter>
nmap <Leader>l :Limelight!!<Enter>



" " ----------------------------------------------------------------------------
" "  - Shougo/neosnippet.vim
" " ----------------------------------------------------------------------------
"
" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <Right>     <Plug>(neosnippet_expand_or_jump)
" smap <Right>     <Plug>(neosnippet_expand_or_jump)
" xmap <Right>     <Plug>(neosnippet_expand_target)
"
" " Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
"
" " Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.config/nvim/bundle/vim-snippets/snippets'
"
"
"
" " ----------------------------------------------------------------------------
" "  - Conceal
" " ----------------------------------------------------------------------------
"
" " For conceal markers.
" if has('conceal')
"     set conceallevel=2 concealcursor=niv
" endif
"
"
" function! ToggleConcealLevel()
"     if &conceallevel == 0
"         setlocal conceallevel=2
"     else
"         setlocal conceallevel=0
"     endif
" endfunction
"
" nnoremap <silent> <C-c><C-y> :call ToggleConcealLevel()<CR>
"
" " autocmd BufEnter,BufWritePost *.js syntax match equals '=' conceal cchar=
" "
" " autocmd BufEnter,BufWritePost * syntax match fatArrow '=>' conceal cchar=ﰲ
" " autocmd BufEnter,BufWritePost * syntax match skinnyArrow '->' conceal cchar=
" " autocmd BufEnter,BufWritePost * syntax match pipe '|>' conceal cchar=ﲖ
" " autocmd BufEnter,BufWritePost * syntax match pipeDown '|>$' conceal cchar=ﲔ
" " autocmd BufEnter,BufWritePost * syntax match composeUp '<|' conceal cchar=ﲗ
" " autocmd BufEnter,BufWritePost * syntax match compose '\( \{2}\)\@<!<|' conceal cchar=ﲕ
" "
" " " autocmd BufEnter,BufWritePost *.js syntax match compose 'compose' conceal cchar=
" " " autocmd BufEnter,BufWritePost *.js syntax match pipe 'pipe' conceal cchar=ﳤ
" "
" " " autocmd BufEnter,BufWritePost *.js syntax match semi '\;' conceal cchar=
" " " autocmd BufEnter,BufWritePost *.js syntax keyword jsReturn return conceal cchar=
" " autocmd BufEnter,BufWritePost *.js syntax match parens '(' conceal cchar=(
" " autocmd BufEnter,BufWritePost *.js syntax match parens ')' conceal cchar=)
" " " autocmd BufEnter,BufWritePost *.js syntax keyword export export conceal cchar=丹
" "
" " autocmd BufEnter,BufWritePost *.js syntax match notEquals '\v\!\=' conceal cchar=≠
" " autocmd BufEnter,BufWritePost *.js syntax match lte '\v\<\=' conceal cchar=≤
" " autocmd BufEnter,BufWritePost *.js syntax match gte '\v\>\=' conceal cchar=≥
" " autocmd BufEnter,BufWritePost *.js syntax match not '\v\!' conceal cchar=¬
" "
" " " autocmd BufEnter,BufWritePost *.js syntax match undefined '\vundefined' conceal cchar=
" " " autocmd BufEnter,BufWritePost *.js syntax match null '\vnull' conceal cchar=ﳠ
" " " autocmd BufEnter,BufWritePost *.js syntax match function '\vfunction' conceal cchar=
" "
" " autocmd BufEnter,BufWritePost *.js,*.elm syntax match true 'true' conceal cchar=⊤
" " autocmd BufEnter,BufWritePost *.js,*.elm syntax match false 'false' conceal cchar=⊥
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => ruanyl/coverage.vim
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" " Specify the path to `coverage.json` file relative to your current working directory.
" let g:coverage_json_report_path = 'coverage/coverage-final.json'
"
" " Define the symbol display for covered lines
" let g:coverage_sign_uncovered = '▓'
"
" " Define the interval time of updating the coverage lines
" let g:coverage_interval = 500
"
" " Do not display signs on covered lines
" let g:coverage_show_covered = 0
"
" " Display signs on uncovered lines
" let g:coverage_show_uncovered = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => haya14busa/vim-asterisk
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keep cursor position across matches
let g:asterisk#keeppos = 1

map *   <Plug>(asterisk-z*)<Plug>(is-nohl-1)
map g*  <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
map #   <Plug>(asterisk-z#)<Plug>(is-nohl-1)
map g#  <Plug>(asterisk-gz#)<Plug>(is-nohl-1)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => machakann/vim-highlightedyank
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Assign a number of time in milliseconds.
let g:highlightedyank_highlight_duration = 2000



" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => janko/vim-test
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" " nmap <silent> <leader><leader>tn :TestNearest<CR>
" " nmap <silent> <leader><leader>tf :TestFile<CR>
" " nmap <silent> <leader><leader>ts :TestSuite<CR>
" " nmap <silent> <leader><leader>tl :TestLast<CR>
" " nmap <silent> <leader><leader>tv :TestVisit<CR>
"
" let test#neovim#term_position = "topleft"
"
" " augroup test
" "   autocmd!
" "   autocmd BufWrite * if test#exists() |
" "     \   TestFile |
" "     \ endif
" " augroup END
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => rbgrouleff/bclose.vim
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" " Don't use mappings
" let g:bclose_no_plugin_maps = 1
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Dimmer
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" function! s:DimInactiveWindow()
"     syntax region Dim start='' end='$$$end$$$'
" endfunction
"
" function! s:UndimActiveWindow()
"     ownsyntax
" endfunction
"
" autocmd WinEnter * call s:UndimActiveWindow()
" autocmd BufEnter * call s:UndimActiveWindow()
" autocmd WinLeave * call s:DimInactiveWindow()
"
"
"
" " ----------------------------------------------------------------------------
" "  - mbbill / undotree
" " ----------------------------------------------------------------------------
"
" nnoremap U :UndotreeToggle<cr>
"
"
"
" " ----------------------------------------------------------------------------
" "  - junegunn / vim-easy-align
" " ----------------------------------------------------------------------------
"
" " Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)
"
" " Replace the default dictionary completion with fzf-based fuzzy completion
" if PlugLoaded('fzf.vim')
"     inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/cracklib-small')
" endif
"
"
"
" ----------------------------------------------------------------------------
"  - Tmux / Vim
" ----------------------------------------------------------------------------

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>



" ----------------------------------------------------------------------------
"  - FZF Preview
" ----------------------------------------------------------------------------

nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p]f     :<C-u>FzfPreviewProjectFiles<CR>
"nnoremap <silent> [fzf-p]p     :<C-u>FzfPreviewFromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gg    :<C-u>FzGCheckout<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatus<CR>
nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>FzfPreviewAllBuffers<CR>
"nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewFromResources buffer project_mru<CR>
"nnoremap <silent> [fzf-p]<C-o> :<C-u>FzfPreviewJumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChanges<CR>
nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>FzfPreviewProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLocationList<CR>

" Add fzf quit mapping
let g:fzf_preview_quit_map = 1

" Use floating window (for neovim)
let g:fzf_preview_use_floating_window = 1

" floating window size ratio
let g:fzf_preview_floating_window_rate = 0.7

" floating window winblend value
let g:fzf_preview_floating_window_winblend = 0

" Commands used for fzf preview.
let g:fzf_preview_command = 'bat --color=always --style=grid {-1}' " Installed bat

" g:fzf_binary_preview_command is executed if this command succeeds, and g:fzf_preview_command is executed if it fails
let g:fzf_preview_if_binary_command = '[[ "$(file --mime {})" =~ binary ]]'

" Commands used for binary file
let g:fzf_binary_preview_command = 'echo "{} is a binary file"'

" Commands used to get the file list from project
let g:fzf_preview_filelist_command = 'rg --files --follow --no-messages' " Installed ripgrep

" Commands used to get the file list from git reposiroty
let g:fzf_preview_git_files_command = 'git ls-files --exclude-standard'

" Commands used to get the file list from current directory
let g:fzf_preview_directory_files_command = 'rg --files --follow --no-messages'

" Commands used to get the git status file list
let g:fzf_preview_git_status_command = "git status --short --untracked-files=all | awk '{if (substr($0,2,1) !~ / /) print $2}'"

" Commands used for git status preview.
let g:fzf_preview_git_status_preview_command =  "[[ $(git diff -- {-1}) != \"\" ]] && git diff --color=always -- {-1} || " .
            \ "[[ $(git diff --cached -- {-1}) != \"\" ]] && git diff --cached --color=always -- {-1} || " .
            \ g:fzf_preview_command

" Commands used for project grep
let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading'

" Commands used for current file lines
let g:fzf_preview_lines_command = 'bat --color=always --style=grid --theme=ansi-dark --plain'

" Commands used for preview of the grep result
let g:fzf_preview_grep_preview_cmd = expand('<sfile>:h:h') . '/bin/preview_fzf_grep'

" Keyboard shortcuts while fzf preview is active
" let g:fzf_preview_preview_key_bindings = 'ctrl-d:preview-page-down,ctrl-u:preview-page-up,?:toggle-preview'

" Specify the color of fzf
" let g:fzf_preview_fzf_color_option = ''

" Set the processors when selecting an element with fzf
" Do not use with g:fzf_preview_*_key_map
" let g:fzf_preview_custom_default_processors = {}
" For example, set split to ctrl-s
" let g:fzf_preview_custom_default_processors = fzf_preview#resource_processor#get_default_processors()
" call remove(g:fzf_preview_custom_default_processors, 'ctrl-x')
" let g:fzf_preview_custom_default_processors['ctrl-s'] = function('fzf_preview#resource_processor#split')

" Use as fzf preview-window option
let g:fzf_preview_fzf_preview_window_option = 'down:70%'

" Command to be executed after file list creation
"""let g:fzf_preview_filelist_postprocess_command = 'xargs -d "\n" exa --color=always'

" Use vim-devicons
let g:fzf_preview_use_dev_icons = 0

" devicons character width
let g:fzf_preview_dev_icon_prefix_length = 2
