local status, nvim_lsp = pcall(require, "lspconfig")

if (not status) then return end

local on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
    return
  end

  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format()<CR>")

    -- format on save
    vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format()")
  end

  if client.server_capabilities.documentRangeFormattingProvider then
    vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
  end
end

nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "html" },
  cmd = { "typescript-language-server", "--stdio" },
})


nvim_lsp.pyright.setup({
  on_attach = on_attach,
})

nvim_lsp.solang.setup({
  on_attach = on_attach,
})

nvim_lsp.solidity.setup({
  on_attach = on_attach,
  settings = {
    -- example of global remapping
    solidity = { includePath = '', remapping = { ["@OpenZeppelin/"] = 'OpenZeppelin/openzeppelin-contracts@4.6.0/' } }
  },
})

nvim_lsp.lua_ls.setup {
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
