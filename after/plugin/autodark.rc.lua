local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
  set_dark_mode = function()
    vim.api.nvim_set_option('background', 'dark')
    --  catppuccin-latte, 
    --  catppuccin-frappe,
    --  catppuccin-macchiato,
    --  catppuccin-mocha
    --  dracula | dracula-soft
    vim.cmd('colorscheme dracula')
  end,
  set_light_mode = function()
    vim.api.nvim_set_option('background', 'light')
    vim.cmd('colorscheme catppuccin-latte')
  end,
})

auto_dark_mode.init()
