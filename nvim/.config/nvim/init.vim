call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'michaeljsmith/vim-indent-object'
Plug 'edwinb/idris2-vim'

call plug#end()

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

" terraform plugin
let g:terraform_fmt_on_save=1

" idris2 file type, only if 'edwinb/idris2-vim' plugin is not installed
" au BufNewFile,BufRead *.idr setf idris2
" au BufNewFile,BufRead *.lidr setf lidris2
