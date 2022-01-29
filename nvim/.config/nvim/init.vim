call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'michaeljsmith/vim-indent-object'
Plug 'neovim/nvim-lspconfig'
" Plug 'glepnir/lspsaga.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'ShinKage/idris2-nvim'
Plug 'airblade/vim-gitgutter'

" auto completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'

" cmp vsnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" fonts
Plug 'kyazdani42/nvim-web-devicons'

" status line
Plug 'nvim-lualine/lualine.nvim'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'numToStr/Comment.nvim'
call plug#end()

let mapleader = " "

" map esc key to jk keys to speed up exiting from insert mode 
inoremap jk <Esc>

" enable file type based settings
filetype plugin indent on

" set file encodings to utf-8 by default
set encoding=utf-8

" disable cursor keys in insert mode
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

" disable cursor keys in normal mode
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>

" map :W to :w
command W w

" enable highlighting search results
set hls
" enable relative and normal line numbering
set number relativenumber

" colorsheme
" set termguicolors
colorscheme gruvbox 
syntax on
set background=dark

" shortcuts to open and reload vim config
nnoremap <Leader>ce :e $MYVIMRC<CR>
nnoremap <Leader>cr :source $MYVIMRC<CR>

" keep some lines visible when scrolling
set scrolloff=3

set modeline
set modelines=3

set listchars=eol:¬,tab:▸\ ,trail:·
set list

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set signcolumn=yes

lua <<EOF
require('settings/lsp')
-- require('settings/lsp-saga')
require('settings/cmp')
require('settings/devicons')
require('settings/lualine')
require('settings/telescope')
require('settings/comment')

require('lang/haskell')
require('lang/idris2')
require('lang/go')
EOF

