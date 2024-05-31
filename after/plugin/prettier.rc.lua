local prettier = require("prettier")

prettier.setup({
  bin = 'prettierd', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "svelte",
    "typescript",
    "typescriptreact",
    "yaml",
  },
  cli_options = {
    tab_width = 2,
    use_tabs = false,
  },
})
