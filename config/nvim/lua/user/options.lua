local options = {
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = false,

  number = true,
  scrolloff = 8,
  sidescrolloff = 8,

  ignorecase = true,

  termguicolors = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
