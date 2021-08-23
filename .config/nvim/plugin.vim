" ====================================================
"  => Plugins
" ====================================================

" Install vim-plug if needed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" ----------------------------------------------------
"  - Themes
" ----------------------------------------------------

Plug 'flrnprz/plastic.vim'



" ----------------------------------------------------
"  - Syntax
" ----------------------------------------------------

" Cucumber
Plug 'tpope/vim-cucumber'

" Elm
Plug 'andys8/vim-elm-syntax' 

" MDX
Plug 'jxnblk/vim-mdx-js'

" Docker
Plug 'ekalinin/dockerfile.vim'

" Git
Plug 'tpope/vim-git'

" A Vim syntax highlighting plugin for JavaScript and Flow.js
Plug 'yuezk/vim-js' 

" The React syntax highlighting and indenting plugin for vim.
" Also supports the typescript tsx file.
Plug 'maxmellon/vim-jsx-pretty'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Distinct highlighting of keywords vs values, 
" JSON-specific (non-JS) warnings, quote concealing.
Plug 'elzr/vim-json'

" JSONC (with comments)
Plug 'neoclide/jsonc.vim'

" A Vim plugin that provides GraphQL file detection, syntax highlighting, and indentation.
Plug 'jparise/vim-graphql'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks and partial hunks.
Plug 'airblade/vim-gitgutter'

" Improved * motions
Plug 'haya14busa/vim-asterisk'

" Briefly highlight which text was yanked.
Plug 'machakann/vim-highlightedyank'

" Modify * to also work with visual selections.
Plug 'nelstrom/vim-visual-star-search'

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'

" Vim sugar for the UNIX shell commands that need it the most
Plug 'tpope/vim-eunuch'



" ----------------------------------------------------------------------------
"  - Extras
" ----------------------------------------------------------------------------

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" The React syntax highlighting and indenting plugin for vim.
" Also supports the typescript tsx file.
Plug 'maxmellon/vim-jsx-pretty'

" A light and configurable statusline/tabline plugin for Vim http
Plug 'itchyny/lightline.vim'

" Adds file type icons to Vim plugins
Plug 'ryanoasis/vim-devicons'

" 🌷 Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'

" 🔦 Hyperfocus-writing in Vim.
Plug 'junegunn/limelight.vim'

" fzf for vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" COC for code completion
let g:coc_global_extensions = [
            \ 'coc-apollo',
            \ 'coc-coverage',
            \ 'coc-css',
            \ 'coc-eslint', 
            \ 'coc-explorer',
            \ 'coc-fzf-preview', 
            \ 'coc-html',
            \ 'coc-json', 
            \ 'coc-prettier', 
            \ 'coc-sh', 
            \ 'coc-snippets',
            \ 'coc-tsserver', 
            \ 'coc-vimlsp',
            \ 'coc-yaml',
            \ 'https://github.com/rodrigore/coc-tailwind-intellisense', 
            \ ]
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'npm install'}

" Use fzf instead of coc.nvim built-in fuzzy finder.  
Plug 'antoinemadec/coc-fzf' 

" Vim motions on speed!
Plug 'easymotion/vim-easymotion'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Vim plugin for intensely nerdy commenting powers
Plug 'scrooloose/nerdcommenter'

" Improved * motions
Plug 'haya14busa/vim-asterisk'

" Briefly highlight which text was yanked.
Plug 'machakann/vim-highlightedyank'

" Modify * to also work with visual selections.
Plug 'nelstrom/vim-visual-star-search'

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'

" FocusGained and FocusLost for vim inside Tmux
" This is a plugin for Vim to dim inactive windows.  
Plug 'tmux-plugins/vim-tmux-focus-events' 

" An eye friendly plugin that fades your inactive buffers and preserves your syntax highlighting!
Plug 'TaDaa/vimade'

" LF file browser
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'

" A personal wiki for Vim 
Plug 'vimwiki/vimwiki'

" Proper project management in vim.
Plug 'tools-life/taskwiki'

" Taskwarrior in VIM
Plug 'farseer90718/vim-taskwarrior'

" Zettelkasten for VIM
Plug 'michal-h21/vim-zettel'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Icons
Plug 'kyazdani42/nvim-web-devicons'

" Auto Sessions
Plug 'rmagatti/auto-session'
Plug 'rmagatti/session-lens'

" Todo Comments
Plug 'folke/todo-comments.nvim'

" Trouble
Plug 'folke/trouble.nvim'

" LazyGit
Plug 'kdheepak/lazygit.nvim'

call plug#end()




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


" ----------------------------------------------------------------------------
"  - Use K to show documentation in preview window
" ----------------------------------------------------------------------------
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction


" ----------------------------------------------------------------------------
"  - Bspwm
" ----------------------------------------------------------------------------

function! s:VimNavigate(direction)
    try
        execute 'wincmd ' . a:direction
    catch
        echohl ErrorMsg | echo 'E11: Invalid in command-line window; <CR> executes, C  TRL-C quits: wincmd k' | echohl None
    endtry
endfunction

command! BspwmNavigateWest call s:BspwmAwareNavigate('h')
command! BspwmNavigateSouth call s:BspwmAwareNavigate('j')
command! BspwmNavigateNorth call s:BspwmAwareNavigate('k')
command! BspwmNavigateEast call s:BspwmAwareNavigate('l')

function! s:BspwmAwareNavigate(direction)
    let nr = winnr()
    call s:VimNavigate(a:direction)

    let at_tab_page_edge = (nr == winnr())
    if at_tab_page_edge
        if a:direction ==? 'h'
            let bspc_direction = 'west'
        elseif a:direction ==? 'j'
            let bspc_direction = 'south'
        elseif a:direction ==? 'k'
            let bspc_direction = 'north'
        elseif a:direction ==? 'l'
            let bspc_direction = 'east'
        endif

        let cmd = 'movement ' . bspc_direction . ' tmux'
        call system(cmd)
    endif
endfunction


" Explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

nmap <space>e :CocCommand explorer<CR>
nmap <space>0 :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
