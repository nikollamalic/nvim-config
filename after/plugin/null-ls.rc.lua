local null_ls = require('null-ls')

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    end
  end,
  sources = {
    require("null-ls.builtins.formatting.eslint"),
    require("null-ls.builtins.formatting.prettierd"),
    require("null-ls.builtins.diagnostics.eslint"),
    require("null-ls.builtins.completion.spell")
  }
})
