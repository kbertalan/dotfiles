local nvim_lsp = require('lspconfig')
local ls = require('luasnip')

require("luasnip.loaders.from_vscode").load({ include = { "go" } })

nvim_lsp['gopls'].setup {
  on_attach = require('settings/lsp').on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('settings/cmp').capabilities
}

vim.cmd([[
autocmd BufWritePre *.go lua vim.lsp.buf.format({ async = false })
]])

