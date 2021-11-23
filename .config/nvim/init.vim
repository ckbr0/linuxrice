let mapleader = ","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')

" Auto complete
Plug 'neovim/nvim-lspconfig'
Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-lsp'

" Color
Plug 'bluz71/vim-moonfly-colors'

" Status bar
Plug 'bluz71/vim-moonfly-statusline'

" Highlight
"Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'lervag/vimtex'
Plug 'tikhomirov/vim-glsl'
Plug 'kevinoid/vim-jsonc'

" navigation/search file
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Plug 'Shougo/echodoc.vim'

call plug#end()

packadd termdebug

set nopaste
set clipboard+=unnamedplus

" Tabs and spaces
set expandtab
set tabstop=8		" Tab size..
set softtabstop=4	" Tab size when editing.
set shiftwidth=4	" Tab size for autoindent.
"set noexpandtab		" Tabs are not spaces.
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
set cmdheight=2
" Affects the visual representation of what happens after you hit <C-x><C-o>
" https://neovim.io/doc/user/insert.html#i_CTRL-X_CTRL-O
" https://neovim.io/doc/user/options.html#'completeopt'
"
" This will show the popup menu even if there's only one match (menuone),
" prevent automatic selection (noselect) and prevent automatic text injection
" into the current line (noinsert).
set completeopt+=noinsert,menuone,noselect
"set completeopt-=preview
" <TAB>: completion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
"inoremap <expr><C-g> deoplete#undo_completion()

"nnoremap <silent> <leader>b :Break<CR>
"nnoremap <silent> <leader>bc :Clear<CR>
"nnoremap <silent> <leader>c :Continue<CR>

" Search
set incsearch		" Search as characters are entered.
set hlsearch		" Highlight matche.
set ignorecase		" Ignore case when searching.
set smartcase		" Ignore case if search pattern is lower case case-sensitive otherwise.

let g:netrw_liststyle=3

" Colors
syntax enable
set termguicolors
colorscheme moonfly

let g:moonflyWithNvimLspIndicator = 1
let g:moonflyWithGitBranchCharacter = 1

lua << EOF
    local lspconfig = require('lspconfig')
    lspconfig.ccls.setup {
        init_options = {
            cache = {
                directory = ".ccls-cache";
                };
            highlight = {
                lsRanges = true;
                };
        }
    }
EOF

let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option('num_processes', 4)
"call deoplete#custom#option('refresh_always', v:false)

"let g:echodoc#enable_at_startup = 1

"function SetLSPShortcuts()
"    nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
"    nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
"    nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
"    nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
"    nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
"    nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
"    nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
"    nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
"    nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
"    nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
"endfunction()

"augroup LSP
"    autocmd!
"    autocmd FileType cpp,c call SetLSPShortcuts()
"augroup END

" Run python3
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" vimtex
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'
autocmd FileType tex map <buffer> <F5> :w<CR>:call vimtex#compiler#compile_ss()<CR>
autocmd FileType tex imap <buffer> <F5> <esc>:w<CR>:call vimtex#compiler#compile_ss()<CR>
