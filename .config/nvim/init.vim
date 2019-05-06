let mapleader = ","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
	\ 'branch': 'next',
	\ 'do': 'bash install.sh',
	\ }

" auto complete
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2', { 'do': ':UpdateRemotePlugins' }
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'Shougo/echodoc.vim'

" navigation/search file
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'mcchrish/nnn.vim'

call plug#end()

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

autocmd BufEnter * call ncm2#enable_for_buffer() " Enable ncm2 for all buffers.
let g:echodoc#enable_at_startup = 1

" Register LPSs.
let g:LanguageClient_serverCommands = {
	\ 'python': ['pyls'],
	\ 'cpp': ['clangd'],
	\ 'go' : ['~/go/bin/gopls'],
	\ }

" Run gofmt and goimports on save.
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

function SetLSPShortcuts()
	nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
	nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
	nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
	nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
	nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
	nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
	nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
	nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
	nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
	nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

augroup LSP
	autocmd!
	autocmd FileType python,cpp,c,go call SetLSPShortcuts()
augroup END
