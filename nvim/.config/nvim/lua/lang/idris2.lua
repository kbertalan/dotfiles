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
      require('settings/lsp').on_attach(...)
    end,
    init_options = {
      logFile = "~/.cache/idris2-lsp/server.log",
      longActionTimeout = 2000, -- 2 second
    },
    capabilities = require('settings/cmp').capabilities
  }
})
