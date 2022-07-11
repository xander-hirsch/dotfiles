vim.opt.number = true
vim.opt.ignorecase = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.background = 'light'
vim.api.nvim_command('colorscheme solarized')

require('plugins')
--require('lsp')
