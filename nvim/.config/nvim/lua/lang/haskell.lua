local nvim_lsp = require('lspconfig')

nvim_lsp['hls'].setup {
  on_attach = require('settings/lsp').on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('settings/cmp').capabilities
}

-- Auto-format haskel files prior to saving them
vim.cmd([[
autocmd BufWritePre *.hs lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.lhs lua vim.lsp.buf.formatting_sync(nil, 1000)
]])

