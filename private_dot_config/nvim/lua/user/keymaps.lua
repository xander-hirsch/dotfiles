local keymap = require("user.util").keymap

-- Remap leader and local leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-----  Normal  -----
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", "Go to left window")
keymap("n", "<C-j>", "<C-w>j", "Go to down window")
keymap("n", "<C-k>", "<C-w>k", "Go to up window")
keymap("n", "<C-l>", "<C-w>l", "Go to right window")

-- Resize with arrows
keymap("n", "<A-Up>", ":resize +2<CR>", "Expand window vertically")
keymap("n", "<A-Down>", ":resize -2<CR>", "Shrink window vertically")
keymap("n", "<A-Left>", ":vertical resize -2<CR>", "Shrink window horizontally")
keymap("n", "<A-Right>", ":vertical resize +2<CR>", "Expand window vertically")

-- Equal window sizes
keymap("n", "<A-\\>", "<cmd>vertical wincmd =<cr>", "Equal vertical window size")
keymap("n", "<A-|>", "<cmd>horizontal wincmd =<cr>", "Equal horizontal window size")

-- Navigate buffers
keymap("n", "<A-j>", "<cmd>bnext<cr>", "Next buffer")
keymap("n", "<A-k>", "<cmd>bprevious<cr>", "Previous buffer")

-- Highlighting
keymap("n", "<leader>h", "<cmd>nohlsearch<cr>", "Stop Highlighting")
keymap("n", "<leader>H", function()
  vim.opt.hlsearch = not vim.opt.hlsearch:get()
end, "Toggle Highlighting")

-- Line Numbering
keymap("n", "<leader>n", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, "Toggle Line Numbering")

-- Close Window
keymap("n", "<leader>c", "<cmd>close<cr>", "Close Window")

-- Delete buffer
local bd_status_ok, bufdelete = pcall(require, "bufdelete")
local close_buffer_action
if bd_status_ok then
  close_buffer_action = bufdelete.bufdelete
else
  close_buffer_action = "<cmd>bdelete<cr>"
end
keymap("n", "<leader>d", close_buffer_action, "Delete Buffer")

-----  Visual  -----
-- Stay in indent mode
keymap("v", "<", "<gv", "Dedent")
keymap("v", ">", ">gv", "Indent")
