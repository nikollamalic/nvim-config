local status, packer = pcall(require, 'packer')
if (not status) then
  print('Packer is not installed')
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'nvim-lualine/lualine.nvim' -- Status line
  use 'onsails/lspkind-nvim' -- LSP Hints
  use 'windwp/nvim-autopairs' -- Autoclosing HTML tags
  use 'windwp/nvim-ts-autotag' -- Auto-update of HTML tags
  use 'glepnir/lspsaga.nvim' -- LSP UI
  use 'folke/tokyonight.nvim' -- Color scheme Purplish
  use 'sainnhe/gruvbox-material' -- Color scheme
  use {
    'nvim-treesitter/nvim-treesitter', -- File explorer
    run = ":TSUpdate"
  }
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'nvim-telescope/telescope.nvim' -- File finder
  use 'nvim-telescope/telescope-file-browser.nvim' -- File finder and grep util
  use 'kyazdani42/nvim-web-devicons'  -- File icons
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim LSP
  use 'lewis6991/gitsigns.nvim' -- Git helper
  use 'sainnhe/everforest'
  use {
  'VonHeikemen/lsp-zero.nvim', -- Autocomplete and linting
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  }
}
end)
