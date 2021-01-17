syntax on
set noerrorbells
set termguicolors
set guicursor=
set relativenumber
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
set smartindent
set nu
" set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set background=dark
filetype off
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Plug plugins

call plug#begin('~/.vim/plugged')

Plug 'ayu-theme/ayu-vim'
Plug 'doums/darcula'
Plug 'morhetz/gruvbox'

Plug 'preservim/nerdtree'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()

colorscheme gruvbox 

autocmd VimEnter * NERDTree " Call on start
let NERDTreeShowHidden=1 " Show hidden files


let mapleader = " "


source $HOME/.config/nvim/plug-config/coc.vim
