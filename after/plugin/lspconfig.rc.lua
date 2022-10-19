local status, nvim_lsp = pcall(require, "lspconfig")

if (not status) then return end

local on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
    return
  end

  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")

    -- format on save
    vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
  end

  if client.server_capabilities.documentRangeFormattingProvider then
    vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
  end
end

nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
})

nvim_lsp.pyright.setup({
  on_attach = on_attach,
})

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },

      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
}
