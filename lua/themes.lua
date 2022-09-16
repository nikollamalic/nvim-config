local current_theme = "gruvbox-material";
local variant = "dark"

vim.o.background = variant
vim.o.termguicolors = true

if (current_theme == "everforest") then
  vim.g.everforest_background = "medium"
  vim.g.everforest_transparent_background = 0
  vim.g.everforest_diagnostic_text_highlight = 1

  vim.cmd[[colorscheme everforest]]
end

if (current_theme == "gruvbox-material") then
  vim.g.gruvbox_material_background = 'soft' -- hard, medium, soft
  vim.g.gruvbox_material_better_performance = 1

  vim.cmd[[colorscheme gruvbox-material]]
end
