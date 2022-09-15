require('base');
require('highlights')
require('maps')
require('macos')
require('plugins')
require('themes')

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})

local has = function (x)
  return vim.fn.has(x) == 1
end
