local status_mason, mason = pcall(require, "mason")

if (not status_mason) then return end

local status_lsp_config, lspconfig = pcall(require, "mason-lspconfig")

if (not status_lsp_config) then return end

mason.setup {}

lspconfig.setup {
  ensure_installed = { "tsserver", "solidity" }
}
