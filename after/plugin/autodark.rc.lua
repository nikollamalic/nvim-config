local auto_dark_mode = require('auto-dark-mode')
local nightfox = require('nightfox')

nightfox.setup({
  options = {
    styles = {
      comments = "italic",
      constants = "italic,bold",
      operators = "bold"
    }
  },
  palettes = {
    carbonfox = {
      -- magenta =  { base = "#fcba03", bright = "#ffd461", dim = "#bfa347"}
      bg1 = "#11110C"
    }
  }
})

auto_dark_mode.setup({
  set_dark_mode = function()
    -- vim.api.nvim_set_option('background', 'dark')
    vim.cmd('colorscheme carbonfox')
  end,
  set_light_mode = function()
    -- vim.api.nvim_set_option('background', 'light')
    vim.cmd('colorscheme dayfox')
  end,
})

auto_dark_mode.init()
