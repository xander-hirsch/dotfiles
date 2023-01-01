local function keymap(mode, lhs, rhs, desc)
  local opts = {
    desc = desc,
    silent = true,
  }
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Remap leader and local leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- Normal --
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

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", "Dedent")
keymap("v", ">", ">gv", "Indent")
