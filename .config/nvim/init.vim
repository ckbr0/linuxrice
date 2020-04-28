let mapleader = ","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')

" auto complete
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --go-completer --clangd-completer' }
Plug 'lervag/vimtex'

" navigation/search file
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'

call plug#end()

set nopaste
set clipboard+=unnamedplus

" Tabs and spaces
set tabstop=4		" Tab size..
set softtabstop=4	" Tab size when editing.
set shiftwidth=4	" Tab size for autoindent.
set noexpandtab		" Tabs are not spaces.
set autoindent
set copyindent		" copy indent from the previous line.

" UI Config
set mouse=a
set showcmd			" Show command in bottom bar.
set hidden
set encoding=utf-8
set number			" Show line number.
set cursorline		" Highlight current line.
set laststatus=2	" Window will always have a status line.
set signcolumn=yes	" Always draw the signcolumn.
set cmdheight=3
" Affects the visual representation of what happens after you hit <C-x><C-o>
" https://neovim.io/doc/user/insert.html#i_CTRL-X_CTRL-O
" https://neovim.io/doc/user/options.html#'completeopt'
"
" This will show the popup menu even if there's only one match (menuone),
" prevent automatic selection (noselect) and prevent automatic text injection
" into the current line (noinsert).
set completeopt=noinsert,menuone,noselect

" Search
set incsearch		" Search as characters are entered.
set hlsearch		" Highlight matche.
set ignorecase		" Ignore case when searching.
set smartcase		" Ignore case if search pattern is lower case case-sensitive otherwise.

" Colors
syntax enable
set termguicolors
colorscheme apprentice

map <C-n> :NERDTreeToggle<CR>

" vimtex
let g:vimtex_view_general_viewer = 'zathura'
"let g:vimtex_view_method = 'mupdf'
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'
