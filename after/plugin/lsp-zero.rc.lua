local lsp = require('lsp-zero')

local kind_icons = {
  Text = "",
  Method = "☭",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

lsp.preset('recommended')

lsp.setup_nvim_cmp({
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },

    format = function(entry, item)
      item.kind = string.format("%s", kind_icons[item.kind])

      item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          path = "[Path]",
        })[entry.source.name]

      return item
    end,
}})

lsp.setup()
