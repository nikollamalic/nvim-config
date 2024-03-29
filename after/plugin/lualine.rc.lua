local status, lualine = pcall(require, "lualine")

if (not status) then return end

local function pomodoro()
  local status_line = require('pomodoro').statusline()

  if (status_line == 'inactive') then return '' end

  return status_line
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    section_separators = { left = ' 󱢇 ', right = ' § ' },
    component_separators = { left = '<-', right = '->' },
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = {
      {
        'diagnostics',
        sources = { "nvim_diagnostic" },
        symbols = { error = '󱢇 ', warn = ' ', info = ' ', hint = '󱅧 ' }
      },
    },
    lualine_x = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path

        color = { fg = '#ffffff', bg = '#40a7b3', gui = 'bold' },
        symbols = {
          modified = '[+]', -- Text to show when the file is modified.
          readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
          unnamed = '[No Name]', -- Text to show for unnamed buffers.
          newfile = '[New]', -- Text to show for newly created file before first write
        }
      },
      { pomodoro }

    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = { 'location' },
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'fugitive' }
}
