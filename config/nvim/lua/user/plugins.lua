return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'shaunsingh/solarized.nvim'
  use 'LnL7/vim-nix'
  use {
    'lewis6991/gitsigns.nvim',
	config = function()
      require('gitsigns').setup()
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
end)
