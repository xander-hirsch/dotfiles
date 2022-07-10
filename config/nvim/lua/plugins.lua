return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'altercation/vim-colors-solarized'
  use 'LnL7/vim-nix'
  use {
    'lewis6991/gitsigns.nvim',
	config = function()
      require('gitsigns').setup()
    end
  }
end)
