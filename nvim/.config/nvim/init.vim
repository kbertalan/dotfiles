call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'michaeljsmith/vim-indent-object'
Plug 'neovim/nvim-lspconfig'
Plug 'MunifTanjim/nui.nvim'
Plug 'ShinKage/idris2-nvim'

call plug#end()

" Plug 'edwinb/idris2-vim'

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

lua <<EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'hls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

local idris2 = require('idris2')
idris2.setup({
  server = {
    on_attach = function(...)
      vim.cmd [[nnoremap <LocalLeader>ics <Cmd>lua require('idris2.code_action').case_split()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>imc <Cmd>lua require('idris2.code_action').make_case()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>imw <Cmd>lua require('idris2.code_action').make_with()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>iml <Cmd>lua require('idris2.code_action').make_lemma()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>iac <Cmd>lua require('idris2.code_action').add_clause()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>ies <Cmd>lua require('idris2.code_action').expr_search()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>igd <Cmd>lua require('idris2.code_action').generate_def()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>irh <Cmd>lua require('idris2.code_action').refine_hole()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>isp <Cmd>lua require('idris2').open_response_panel()<CR>]]
      vim.cmd [[nnoremap <LocalLeader>icp <Cmd>lua require('idris2').close_response_panel()<CR>]]
      on_attach(...)
    end,
    init_options = {
      logFile = "~/.cache/idris2-lsp/server.log",
      longActionTimeout = 2000, -- 2 second
    },
  }
})
EOF

" Auto-format haskel files prior to saving them
autocmd BufWritePre *.hs lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.lhs lua vim.lsp.buf.formatting_sync(nil, 1000)

