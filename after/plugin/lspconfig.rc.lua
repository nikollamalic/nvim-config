local status, nvim_lsp = pcall(require, "lspconfig")
local configs = require 'lspconfig.configs'

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

nvim_lsp.tsserver.setup({ on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx",
    "html", "svelte" }, cmd = { "typescript-language-server", "--stdio" }, })

-- nvim_lsp.biome.setup { on_attach = on_attach, root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git") }

nvim_lsp.pyright.setup({
  on_attach = on_attach,
})

-- set lua
nvim_lsp.lua_ls.setup({
  on_attach = on_attach,
  cmd = { "lua-language-server" },
})

nvim_lsp.dartls.setup({ on_attach = on_attach, })

-- configures lsp for solidity and enables foundry libs
nvim_lsp.solidity.setup({ on_attach = on_attach, cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
  filetypes = { 'solidity' }, root_dir = require("lspconfig.util").root_pattern "foundry.toml",
  single_file_support = false, })

nvim_lsp.pyright.setup({
  on_attach = on_attach,
})

nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importMergeBehavior = "last",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
})
