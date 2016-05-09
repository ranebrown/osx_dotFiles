" Vundle - install plugins {{{
" ---------------------------------------------------------------------------------------------------

filetype off                                " required
set rtp+=~/.vim/bundle/Vundle.vim           " set the runtime path to include Vundle and initialize
call vundle#begin()                         " required
Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle, required
Plugin 'kchmck/vim-coffee-script'           " Coffee script syntax highighting
Plugin 'vim-airline/vim-airline-themes'     " airline themes
Plugin 'flazz/vim-colorschemes'             " Colorschemes
Plugin 'LaTeX-Box-Team/LaTeX-Box'           " latex
Plugin 'justinmk/vim-sneak'                 " movement help - jump to letters
Plugin 'abudden/taghighlight-automirror'    " ctags highlighter
Plugin 'Valloric/YouCompleteMe'             " Code completion
Plugin 'vim-airline/vim-airline'            " Status bar
Plugin 'bling/vim-bufferline'               " display buffers in status bar
Plugin 'ctrlpvim/ctrlp.vim'                 " fuzzy search
Plugin 'xolox/vim-misc'                     " extras required for note taking
Plugin 'xolox/vim-notes'                    " note taking
Plugin 'xolox/vim-easytags'                 " auto update ctags
Plugin 'tpope/vim-fugitive'                 " git wrapper
Plugin 'tpope/vim-commentary'               " quick code comment out
Plugin 'tpope/vim-vinegar'                  " netrw enhancments
Plugin 'godlygeek/tabular'                  " auto alignment helper
Plugin 'plasticboy/vim-markdown'            " markdown syntax (requires tabular)
Plugin 'Raimondi/delimitMate'               " Auto close braces
call vundle#end()                           " required
filetype plugin indent on                   " required

" }}}

" Colorscheme {{{
" ---------------------------------------------------------------------------------------------------

syntax enable                               " enable syntax highlighting
let g:enable_bold_font = 1                  " allow use of bold fonts for syntax highlighting
let &t_Co=256                               " use 256 color pallete
set background=dark                         " prefer dark background
colorscheme hybrid_material                 " default colorscheme

" }}}

" Basic settings {{{
" ---------------------------------------------------------------------------------------------------

set nocompatible                            " Prefer Vim defaults over Vi-compatible defaults.
set hidden                                  " allows switching betwen buffers without writing first
set laststatus=2                            " show status line all the time
set number                                  " show line numbers
set autoindent                              " Copy indent from current line when starting a new line
set backspace=indent,eol,start              " control how backspace/del works in insert mode
set history=1000                            " number of lines in history
set autoread                                " automatically reload a file when it has changed
set completeopt-=preview                    " don't show the preview window - affects YCM
set ruler                                   " show cursor position i.e. line and column
set breakindent                             " keep indentation level when wrapping text
set linebreak                               " don't split a word when wrapping
set display+=lastline                       " display as much of a long line on screen as possible - no @ symbols
set incsearch                               " start searching before pressing enter
set ignorecase                              " ignore case when searching
set smartcase                               " override ignorecase if search pattern contains uppercase
set mouse=a                                 " Enable use of the mouse in all modes.
set title                                   " Set window title to 'filename [+=-] (path) - VIM'.
set smarttab                                " control what is inserted when pressing tab i.e. shiftwidth or tabstop
set tags=./.tags;                           " save tags file in project dir not as a global file
set scrolloff=2                             " always show at x lines past cursor when scrolling
set sidescrolloff=5                         " number of characters to show when scrolling left/right - only with nowrap
set spelllang=en_us                         " use US english for spellcheck
set encoding=utf-8                          " use utf-8 encoding
set foldmethod=syntax                       " fold code based on syntax
let c_no_comment_fold = 1                   " don't fold C comment blocks

" hide dot files in netrw
let g:netrw_list_hide= '\(^\|\s\s\)\zs\.\S\+'

" use bash like tab autocompletion
set wildmode=longest:full,full
set wildmenu

" use spaces instead of tabs, set all tabs and indentations to a width of 4
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" open splits below and right
set splitbelow
set splitright

if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j " Delete comment character when joining commented lines
endif

" used to show tabs and spaces using :set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" the timeout when waiting for part of a mapped key sequence
set ttimeout
set ttimeoutlen=100

"kill netrw buffers when hidden
autocmd FileType netrw setl bufhidden=delete

" }}}

" GUI settings {{{
" ---------------------------------------------------------------------------------------------------

if has('gui_running')
  set guifont=Anonymous\ Pro:h13            " Set the font to use.
  set guicursor+=a:block-blinkon0           " Use non-blinking block cursor.
endif

" }}}

" Key mappings {{{
" ---------------------------------------------------------------------------------------------------

"  NOTE: don't place comments at the end of line for keymappings or things get screwy

" change leader key
let mapleader=","

" use jj to exit insert mode
inoremap jj <esc>

" creating and moving between buffers
nnoremap <silent> <leader>t :enew<CR>
nnoremap <silent> <leader>n :bnext<CR>
nnoremap <silent> <leader>p :bprevious<CR>

" creating and moving between tabs
nnoremap <silent> <leader>T :tabnew<CR>
nnoremap <silent> <leader>N :tabnext<CR>
nnoremap <silent> <leader>P :tabprevious<CR>

"move between splits
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>k <C-w>k
nnoremap <leader>j <C-w>j

" spell check
nnoremap <silent> <leader>s :setlocal spell<CR>

" toggle background light/dark
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" YCM goto definition, fixit, recompile shortcuts
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>
nnoremap <leader>rr :YcmForceCompileAndDiagnostics<CR>

" YCM syntax error log
nnoremap <leader>o :lopen<CR>
nnoremap <leader>c :lclose<CR>

" copy and paste to global clipboard
vnoremap <C-c> "+y
nnoremap <silent> <leader>v "+p

" highlight search matches
nnoremap <localleader>h :set hlsearch!<CR>

" omni complete shortcut
inoremap <C-x> <C-x><C-o>

" }}}

" Custom commands {{{
" ---------------------------------------------------------------------------------------------------

" :silent can cause screen to need redrawn -> using this fixes the issue
command! -nargs=1 Silent
\ | execute ':silent!'.<q-args>
\ | execute ':redraw!'

" save and close a buffer
:command! Wd write|bdelete

" }}}

" Project specific settings {{{
" ---------------------------------------------------------------------------------------------------

"project specific settings -> tabsize 2 for pyxis
au BufRead,BufEnter /Users/Rane/Documents/Classes_Spring16/Independent\ Study/pyxis/* setlocal ts=2 sts=2 sw=2 expandtab

" }}}

" Settings - airline {{{
" ---------------------------------------------------------------------------------------------------

" don't let airline overwrite bufferline settings
let g:airline#extensions#bufferline#overwrite_variables = 0

" YCM integration with airline
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'Errors:'
let g:airline#extensions#ycm#warning_symbol = 'Warnings:'

" theme - must copy theme to ~/.vim/bundle/vim-airline/autoload/airline/themes/
let g:airline_theme='hybrid'

" display buffers at top when only one open tab
let g:airline#extensions#tabline#enabled = 1

"}}}

" Settings - bufferline {{{
" ---------------------------------------------------------------------------------------------------

" Symbols to use when a file is modified
let g:bufferline_modified = '++'

" don't show the buffer number
let g:bufferline_show_bufnr = 0

" don't echo open buffers to command line
let g:bufferline_echo = 0

" show available highlight groups -> :so $VIMRUNTIME/syntax/hitest.vim
" change the highlight color of active buffer
let g:bufferline_active_highlight = 'DiffText'

" }}}

" Settings - vim notes {{{
" ---------------------------------------------------------------------------------------------------

" notes directory
:let g:notes_directories = ['~/Documents/Notes']

" }}}

" Settings - you complete me {{{
" ---------------------------------------------------------------------------------------------------

" default autocomplete file
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" set key to navigate backwards through autocomplete list
let g:ycm_key_list_previous_completion = ['<leader><Tab>', '<Up>']

" don't ask to load .ycm config files
let g:ycm_confirm_extra_conf = 0

" use ycm's syntax checker
let g:ycm_show_diagnostics_ui = 1

" number of characters required to start ycm
let g:ycm_min_num_of_chars_for_completion = 2

" populate errors to list -> :lopen and :lclose to view
let g:ycm_always_populate_location_list = 1

" completion in comments
let g:ycm_complete_in_comments = 1

" shorter text for command
command! Gd YcmCompleter GetDoc

" }}}

" Settings - delimitMate {{{
" ---------------------------------------------------------------------------------------------------

" on carriage return auto expand braces
let delimitMate_expand_cr = 1

" }}}

" Settings - ctrl-p {{{
" ---------------------------------------------------------------------------------------------------

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>m :CtrlPTag<cr>
nnoremap <leader>b :CtrlPBuffer<CR>

" }}}

" Settings - easytags {{{
" ---------------------------------------------------------------------------------------------------

" easytags update option
let g:easytags_async = 1

let g:easytags_dynamic_files = 1

" the ctags commands to use for easytags
let g:easytags_languages = {
\'c': {
\   'cmd': '/usr/bin/ctags',
\       'args': ['--fields=+l', '--c-kinds=+defgmpst'],
\       'fileoutput_opt': '-f',
\       'stdout_opt': '-f-',
\       'recurse_flag': '-R'
\   }
\}

" don't use easytags highlighting -> slows vim
let g:easytags_auto_highlight = 0

" update tags file after save
let g:easytags_events = ['BufWritePost']

" }}}

" Settings - taghighlight {{{
" ---------------------------------------------------------------------------------------------------

" set tags filename for taghighlight
if ! exists('g:TagHighlightSettings')
    let g:TagHighlightSettings = {}
endif
let g:TagHighlightSettings['TagFileName'] = '.tags'
let g:TagHighlightSettings['TypesFilePrefix'] = '.types'

" }}}

" Settings - latexbox {{{
" ---------------------------------------------------------------------------------------------------

" use skim to display latex pdf
let g:LatexBox_viewer = 'open -a Skim'

" forward search tex file to pdf
let g:LatexBox_latexmk_options
                \ = "-pdflatex='pdflatex -synctex=1 \%O \%S'"

" jump to the current line in a tex file in the pdf version
map <silent> <LocalLeader>lp :Silent
        \ !/Applications/Skim.app/Contents/SharedSupport/displayline
        \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>"
        \ "%:p"<CR>

" latex folding
let g:LatexBox_Folding=1

" don't close folds after exiting insert mode
let g:LatexBox_fold_automatic = 0

" latex-box shortcuts in text mode
imap ]] <Plug>LatexCloseCurEnv
imap <buffer> [[     \begin{

" don't use latex-box indentation
let g:LatexBox_custom_indent=0

let g:LatexBox_open_pats = []
let g:LatexBox_close_pats = []

" automatically enable spell check for latex files
autocmd FileType tex :setlocal spell

" }}}

" modeline for file specific settings
" vim: set fdm=marker :
