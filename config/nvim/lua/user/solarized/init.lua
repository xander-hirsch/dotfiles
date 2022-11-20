local M = {}
local theme = require "user.solarized.theme"

M.setup = function()
  vim.cmd "hi clear"

  if vim.fn.exists "syntax_on" then
    vim.cmd "syntax reset"
  end

  vim.opt.termguicolors = true
  vim.g.colors_name = "solarized"

  theme.set_highlights()
end

return M
