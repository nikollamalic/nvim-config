local status, telescope = pcall(require, 'telescope')
if not (status) then return end

local actions = require('telescope.actions')

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

telescope.setup {
  defaults = {
    -- file_ignore_patterns = { "node_modules", ".git" },
    mappings = {
      n = {
        ['q'] = actions.close
      }
    }
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      -- disables netrw add use telescope-file-browser
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          ['<C-w>'] = function() vim.cmd('normal vbd') end,
          ['n'] = {
            ['N'] = fb_actions.create,
            ['h'] = fb_actions.goto_parent_dir,
            ['/'] = function() vim.cmd('startinsert') end,
          }
        }
      }
    }
  }
}

telescope.load_extension('file_browser')

local opts = { noremap = true, silent = true }
local telescope_module = 'lua require("telescope.builtin")'

vim.keymap.set('n', ';f', '<cmd>' .. telescope_module .. '.find_files({ no_ignore = false, hidden = true })<cr>', opts)

vim.keymap.set('n', ';r', '<cmd>' .. telescope_module .. '.live_grep()<cr>', opts)

vim.keymap.set('n', '\\\\', '<cmd>' .. telescope_module .. '.buffers()<cr>', opts)

vim.keymap.set('n', ';t', '<cmd>' .. telescope_module .. '.help_tags()<cr>', opts)

vim.keymap.set('n', ';;', '<cmd>' .. telescope_module .. '.resume()<cr>', opts)

vim.keymap.set('n', ';e', '<cmd>' .. telescope_module .. '.diagnostics()<cr>', opts)

local file_browser_options = '{ path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode = "normal", layout_config = { height = 40 }}'

vim.keymap.set('n', 'sf',
  '<cmd>lua require("telescope").extensions.file_browser.file_browser(' .. file_browser_options .. ')<cr>', opts)
