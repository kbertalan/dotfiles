local nvim_lsp = require('lspconfig')

nvim_lsp['gopls'].setup {
  on_attach = require('settings/lsp').on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('settings/cmp').capabilities
}

-- Auto-format haskel files prior to saving them
vim.cmd([[
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
]])

