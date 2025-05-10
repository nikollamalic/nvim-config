local auto_dark_mode = require('auto-dark-mode')

-- vim.cmd('colorscheme everforest')

auto_dark_mode.setup({
  set_dark_mode = function()
    vim.api.nvim_set_option('background', 'dark')
    --  catppuccin-latte,
    --  catppuccin-frappe,
    --  catppuccin-macchiato,
    --  catppuccin-mocha
    --  dracula | dracula-soft
    --  everforest
    --  dracula
    vim.cmd('colorscheme zengarden')
    -- vim.cmd('colorscheme kanagawa')
  end,
  set_light_mode = function()
    vim.api.nvim_set_option('background', 'light')
    vim.cmd('colorscheme dayfox')
  end,
})

auto_dark_mode.init()
