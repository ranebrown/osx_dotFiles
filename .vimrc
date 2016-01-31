set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" gcc comment current line
Plugin 'git://github.com/tpope/vim-commentary.git'

" Markdown syntax
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Airline - status bar mod
Plugin 'bling/vim-airline'

" Coding autofill
"Plugin 'https://github.com/Valloric/YouCompleteMe.git'

"Auto close braces
Plugin 'https://github.com/Raimondi/delimitMate.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" enable syntax highlighting
syntax enable

" show status line all the time
set laststatus=2

" background and syntax
set background=dark
"let g:molokai_original = 1
"let g:rehash256 = 1
"colorscheme molokai
let g:solarized_termcolors=256
colorscheme solarized

" show line numbers
set number

" set tab size
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

" set jj as key combo to exit insert mode
imap jj <esc>

" set default behaviour for split window 
set splitbelow
set splitright

" set default netrw (explore) view style
let g:netrw_liststyle=3
nnoremap :E :Vexplore
" don't show hidden file in netrw - gh shortcut
"let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'

" change leader key
let mapleader=","

" shortcuts for tabs 
nnoremap <silent> <leader>t :tabnew<CR>
"inoremap <leader>t <Esc>:tabnew<CR>
nnoremap <silent> <leader>n :tabnext<CR>
"inoremap <leader>n <esc>:tabnext<CR>
nnoremap <silent> <leader>p :tabprevious<CR>
"inoremap <leader>p <Esc>:tabprevious<CR>

" Visual block remapping
nnoremap <silent> <leader>v <C-V>
inoremap <leader>v <esc><C-V>

"switch between windows
nnoremap <C-r> <C-w><Right>
nnoremap <C-l> <C-w><Left>

" syntax checker
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" default path for autocomplet flags
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" expand auto braces
let delimitMate_expand_cr = 1

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<