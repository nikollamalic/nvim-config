local current_theme = "everforest";
local variant = "dark"

if (current_theme == "everforest") then
  vim.o.background = variant
  vim.o.termguicolors = true
  vim.g.everforest_background = "medium"
  vim.g.everforest_transparent_background = 0
  vim.g.everforest_diagnostic_text_highlight = 1

  vim.cmd[[colorscheme everforest]]
end
