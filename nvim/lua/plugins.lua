-- plugins.lua

-- packer.nvim package manager
return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client

  -- nvim-cmp autocomplete
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- For luasnip users.
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- catpuccin theme
  use({
	"catppuccin/nvim",
	as = "catppuccin"
  })

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  })

  -- nvim-tree file explorer
  use({
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  })

  -- barbar buffer tabs
  use({
    'romgrk/barbar.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  })

  -- lualine statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }

  -- Friendly Snippets
  use 'rafamadriz/friendly-snippets'
end)
