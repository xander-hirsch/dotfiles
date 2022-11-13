return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- General purpose
  use "lewis6991/gitsigns.nvim"
  use "folke/which-key.nvim"
  use "shaunsingh/solarized.nvim"
  use "famiu/bufdelete.nvim"
  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep" },
  }
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
  }
  use {
    "akinsho/bufferline.nvim",
    tag = "v3.1.0",
    requires = "nvim-tree/nvim-web-devicons",
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_install = require "nvim-treesitter.install"
      local ts_update = ts_install.update { with_sync = true }
      ts_update()
    end,
  }
  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "saadparwaiz1/cmp_luasnip"

  -- Snippets
  use { "L3MON4D3/LuaSnip", tag = "v1.1.0" }
  use "rafamadriz/friendly-snippets"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "tamago324/nlsp-settings.nvim"
  use "jose-elias-alvarez/null-ls.nvim"

  -- Filetype
  use { "LnL7/vim-nix", opt = true }
end)
