" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'junegunn/vim-easy-align'

Plug 'dylanaraps/wal.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi' | Plug 'Shougo/deoplete-clangx' | Plug 'Shougo/neoinclude.vim'

let g:deoplete#enable_at_startup = 1

" Initialize plugin system
call plug#end()

colorscheme wal
