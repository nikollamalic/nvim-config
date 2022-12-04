local status, theme_switcher = pcall(require, "auto-dark-mode")

if (not status) then return end

local set_dark_mode = function()
  -- nightfox, duskfox, nordfox, terafox, carbonfox
  -- vim.cmd [[colorscheme dawnfox]]
end

local set_light_mode = function()
  -- dayfox, dawnfox, darcula
  -- vim.cmd [[colorscheme dawnfox]]
end

theme_switcher.setup({
  set_dark_mode = set_dark_mode,
  set_light_mode = set_light_mode
})

theme_switcher.init()
