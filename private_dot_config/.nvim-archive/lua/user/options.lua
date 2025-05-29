local options = {
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = false,

  number = true,
  relativenumber = true,
  cursorline = true,
  cursorlineopt = "number",
  scrolloff = 8,
  sidescrolloff = 8,

  splitbelow = true,
  splitright = true,

  hlsearch = true,
  ignorecase = true,

  background = "light",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "colorscheme solarized"
