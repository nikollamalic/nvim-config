local status, telescope = pcall(require, 'telescope')
if not (status) then return end

local actions = require('telescope.actions')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup {
  defaults = {
    file_ignore_patterns = { "node_modules", ".git" },
    mappings = {
      n = {
        ['q'] = actions.close
      }
    },
    preview = {
      treesitter = false,
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw add use telescope-file-browser
      hijack_netrw = true
    }
  }
}

telescope.load_extension('file_browser')

local builtin = require("telescope.builtin")

vim.keymap.set('n', ';f', function() builtin.find_files({ no_ignore = false, hidden = true }) end)

vim.keymap.set('n', ';r', function() builtin.live_grep() end)
vim.keymap.set('n', '\\\\', function() builtin.buffers() end)


vim.keymap.set('n', ';t', function() builtin.help_tags() end)
vim.keymap.set('n', ';;', function() builtin.resume() end)
vim.keymap.set('n', ';e', function() builtin.diagnostics() end)
vim.keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 },
  })
end)

require("telescope").load_extension("flutter")
