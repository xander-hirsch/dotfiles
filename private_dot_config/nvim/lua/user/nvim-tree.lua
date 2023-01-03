local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup {}

require("user.util").keymap("n", "<leader>e", require("nvim-tree.api").tree.toggle, "Explorer")
