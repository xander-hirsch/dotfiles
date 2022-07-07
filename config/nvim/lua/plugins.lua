return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'airblade/vim-gitgutter'
  use 'altercation/vim-colors-solarized'
  use 'LnL7/vim-nix'
end)
