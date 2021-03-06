set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree.git'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

Plugin 'StanAngeloff/php.vim'
Plugin 'tpope/vim-ragtag'
Plugin 'joonty/vdebug'
Plugin 'shawncplus/phpcomplete.vim'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
" Plugin 'joonty/vim-phpqa.git'
Plugin 'tobyS/Vmustache'
Plugin 'tobyS/pdv'
Plugin 'thiagoalessio/rainbow_levels.vim'
Plugin 'w0rp/ale'
call vundle#end()            " required
filetype plugin indent on    " required

" Use the Solarized Dark theme
set background=dark
colorscheme colorsbox-material
let g:solarized_termtrans=1

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as four spaces
" Use spaces for tabs
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Show hidden files in NERDTree
let NERDTreeShowHidden=1
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
        " Auto-enter nerdtree
        " autocmd vimenter * NERDTree
        let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates"
        autocmd FileType php noremap <C-d> <ESC>:call pdv#DocumentCurrentLine()<CR>i
        autocmd FileType php nnoremap <C-d> :call pdv#DocumentCurrentLine()<CR>
        autocmd FileType php vnoremap <C-d> :call pdv#DocumentCurrentLine()<CR>
endif


