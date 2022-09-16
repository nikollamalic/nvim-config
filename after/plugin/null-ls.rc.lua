local null_ls = require('null-ls')

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
      -- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_sync()")
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.formatting()
        end
      })
    end
  end,
  sources = {
    require("null-ls.builtins.formatting.eslint_d"),
    require("null-ls.builtins.diagnostics.eslint_d"),
  }
})
