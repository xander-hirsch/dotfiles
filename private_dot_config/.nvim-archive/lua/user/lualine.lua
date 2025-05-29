local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local colors = {
  base3 = "#002b36",
  base2 = "#073642",
  base1 = "#586e75",
  base0 = "#657b83",
  base00 = "#839496",
  base01 = "#93a1a1",
  base02 = "#eee8d5",
  base03 = "#fdf6e3",
  yellow = "#b58900",
  orange = "#cb4b16",
  red = "#dc322f",
  magenta = "#d33682",
  violet = "#6c71c4",
  blue = "#268bd2",
  cyan = "#2aa198",
  green = "#859900",
}

local solarized = {
  normal = {
    a = { fg = colors.base03, bg = colors.blue, gui = "bold" },
    b = { fg = colors.base03, bg = colors.base2 },
    c = { fg = colors.base1, bg = colors.base02 },
  },
  insert = { a = { fg = colors.base03, bg = colors.green, gui = "bold" } },
  visual = { a = { fg = colors.base03, bg = colors.magenta, gui = "bold" } },
  replace = { a = { fg = colors.base03, bg = colors.red, gui = "bold" } },
  inactive = {
    a = { fg = colors.base0, bg = colors.base02, gui = "bold" },
    b = { fg = colors.base03, bg = colors.base00 },
    c = { fg = colors.base01, bg = colors.base02 },
  },
}

lualine.setup {
  options = {
    theme = solarized,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { "diff", "diagnostics" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
}
