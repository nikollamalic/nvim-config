local null_ls = require('null-ls')

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ timeout_ms = 2000, async = true })
        end
      })
    end
  end,
  sources = {
    require("null-ls.builtins.formatting.eslint_d"),
    require("null-ls.builtins.diagnostics.eslint_d"),
  }
})
