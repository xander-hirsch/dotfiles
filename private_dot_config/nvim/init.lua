require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.lualine"
require "user.nvim-tree"
require "user.bufferline"
require "user.telescope"
require "user.gitsigns"
require "user.which-key"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.illuminate"
require "user.cmp"
require "user.lsp"

vim.cmd [[
  augroup chezmoi_apply
    autocmd!
    autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"
  augroup end
]]
