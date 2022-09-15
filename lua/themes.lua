local current_theme = "everforest";
local variant = "light"

if (current_theme == "everforest") then
  vim.o.background = variant
  vim.o.termguicolors = true
  vim.g.everforest_background = "medium"
  vim.g.everforest_enable_italic = 1
  vim.g.everforest_transparent_background = 1
  vim.g.everforest_diagnostic_text_highlight = 1

  vim.cmd[[colorscheme everforest]]
end
