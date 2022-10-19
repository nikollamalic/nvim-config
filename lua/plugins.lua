local status, packer = pcall(require, 'packer')
if (not status) then
  print('Packer is not installed')
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'nvim-lualine/lualine.nvim' -- Status line
  use 'windwp/nvim-autopairs' -- Autoclosing HTML tags
  use 'windwp/nvim-ts-autotag' -- Auto-update of HTML tags
  use 'folke/tokyonight.nvim' -- Color scheme Purplish
  use 'sainnhe/gruvbox-material' -- Color scheme
  use {
    'nvim-treesitter/nvim-treesitter', -- File explorer
    run = ":TSUpdate"
  }
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'nvim-telescope/telescope.nvim' -- File finder
  use 'nvim-telescope/telescope-file-browser.nvim' -- File finder and grep util
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'lewis6991/gitsigns.nvim' -- Git helper

  use 'sainnhe/everforest'
  use 'andreasvc/vim-256noir'
  use 'doums/darcula'
  use 'yorickpeterse/vim-paper'
  use 'jsit/toast.vim'
  use 'crusoexia/vim-monokai'

  -- LSP related config
  use 'neovim/nvim-lspconfig' -- LSP
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip' -- Snippet
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'ray-x/lsp_signature.nvim'

  -- LSP UI
  use 'glepnir/lspsaga.nvim'

  -- Helpers and linters
  use 'jose-elias-alvarez/null-ls.nvim'
  use('MunifTanjim/prettier.nvim')
end)
