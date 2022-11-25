local c = require "user.solarized.palette"

local hl = vim.api.nvim_set_hl
local theme = {}

theme.set_highlights = function()
  if vim.opt.background:get() == "light" then
    local temp00 = c.base00
    local temp01 = c.base01
    local temp02 = c.base02
    local temp03 = c.base03
    c.base00 = c.base0
    c.base01 = c.base1
    c.base02 = c.base2
    c.base03 = c.base3
    c.base0 = temp00
    c.base1 = temp01
    c.base2 = temp02
    c.base3 = temp03
  end

  -- highlights
  hl(0, "Normal", { fg = c.base0, bg = c.base03 })
  hl(0, "Comment", { fg = c.base01, bg = "NONE", italic = true })
  hl(0, "Constant", { fg = c.cyan, bg = "NONE" })
  hl(0, "Identifier", { fg = c.blue, bg = "NONE" })
  hl(0, "Statement", { fg = c.green, bg = "NONE" })
  hl(0, "PreProc", { fg = c.yellow, bg = "NONE" })
  hl(0, "Type", { fg = c.orange, bg = "NONE" })
  hl(0, "Special", { fg = c.yellow, bg = "NONE" })
  hl(0, "Underlined", { fg = c.violet, bg = "NONE" })
  hl(0, "Ignore", { fg = "NONE", bg = "NONE" })
  hl(0, "Error", { fg = c.red, bg = "NONE", bold = true })
  hl(0, "Todo", { fg = c.magenta, bg = "NONE", bold = true })
  hl(0, "SpecialKey", { fg = c.base00, bg = c.base02, bold = true })
  hl(0, "NonText", { fg = c.base00, bg = "NONE", bold = true })
  hl(0, "StatusLine", { fg = c.base1, bg = c.base02, reverse = true, bold = true })
  hl(0, "StatusLineNC", { fg = c.base00, bg = c.base02, reverse = true, bold = true })
  hl(0, "Visual", { fg = c.base1, bg = c.base02, bold = true })
  hl(0, "Directory", { fg = c.blue, bg = "NONE" })
  hl(0, "ErrorMsg", { fg = c.red, bg = "NONE", reverse = true })
  hl(0, "IncSearch", { fg = c.orange, bg = "NONE", standout = true })
  hl(0, "Search", { fg = c.yellow, bg = "NONE", reverse = true })
  hl(0, "MoreMsg", { fg = c.blue, bg = "NONE" })
  hl(0, "ModeMsg", { fg = c.blue, bg = "NONE" })
  hl(0, "LineNr", { fg = c.base01, bg = c.base02 })
  hl(0, "Question", { fg = c.cyan, bg = "NONE", bold = true })
  hl(0, "VertSplit", { fg = c.base00, bg = c.base02, reverse = true, bold = true })
  hl(0, "Title", { fg = c.orange, bg = "NONE", bold = true })
  hl(0, "VisualNOS", { fg = "NONE", bg = c.base02, standout = true, reverse = true, bold = true })
  hl(0, "WarningMsg", { fg = c.red, bg = "NONE", bold = true })
  hl(0, "WildMenu", { fg = c.base2, bg = c.base02, reverse = true, bold = true })
  hl(0, "Folded", { fg = c.base0, bg = c.base02, underline = true, bold = true })
  hl(0, "FoldColumn", { fg = c.base0, bg = c.base02 })
  hl(0, "DiffAdd", { fg = c.green, bg = c.base02 })
  hl(0, "DiffChange", { fg = c.blue, bg = c.base02 })
  hl(0, "DiffDelete", { fg = c.red, bg = c.base02 })
  hl(0, "DiffText", { fg = c.blue, bg = c.base02 })
  hl(0, "SignColumn", { fg = c.base0, bg = c.base02 })
  hl(0, "Conceal", { fg = c.blue, bg = "NONE" })
  hl(0, "SpellBad", { fg = "NONE", bg = "NONE", undercurl = true })
  hl(0, "SpellCap", { fg = "NONE", bg = "NONE", undercurl = true })
  hl(0, "SpellRare", { fg = "NONE", bg = "NONE", undercurl = true })
  hl(0, "SpellLocal", { fg = "NONE", bg = "NONE", undercurl = true })
  hl(0, "Pmenu", { fg = c.base01, bg = c.base02 })
  hl(0, "PmenuSel", { fg = c.base1, bg = c.base02, bold = true })
  hl(0, "PmenuSbar", { fg = c.base02, bg = c.base02 })
  hl(0, "PmenuThumb", { fg = c.base01, bg = c.base01 })
  hl(0, "TabLine", { fg = c.base0, bg = c.base02, underline = true })
  hl(0, "TabLineFill", { fg = c.base0, bg = c.base02, underline = true })
  hl(0, "TablLineSel", { fg = c.base01, bg = c.base2, underline = true })
  hl(0, "CursorColumn", { fg = "NONE", bg = c.base02 })
  hl(0, "CursorLine", { fg = "NONE", bg = c.base02, underline = true, standout = true })
  hl(0, "ColorColumn", { fg = "NONE", bg = c.base02 })
  hl(0, "Cursor", { fg = c.base03, bg = c.base0 })
  hl(0, "MatchParen", { fg = c.red, bg = c.base01, bold = true })

  hl(0, "NormalFloat", { fg = c.base0, bg = c.base03 })
  hl(0, "FloatBorder", { fg = c.base0, bg = c.base03 })
  hl(0, "Delimiter", { fg = c.base1 })
  hl(0, "Keyword", { fg = c.green })
  hl(0, "Number", { fg = c.magenta })
  hl(0, "String", { fg = c.cyan })
  hl(0, "SpecialChar", { fg = c.red })
  hl(0, "Structure", { fg = c.base1, bold = true })
  hl(0, "Typedef", { fg = c.base1, bold = true })
  hl(0, "Function", { fg = c.blue })
  hl(0, "Boolean", { fg = c.yellow })

  hl(0, "DiagnosticError", { fg = c.red, bg = c.base02 })
  hl(0, "DiagnosticWarn", { fg = c.orange, bg = c.base02 })
  hl(0, "DiagnosticInfo", { fg = c.green, bg = c.base02 })
  hl(0, "DiagnosticHint", { fg = c.cyan, bg = c.base02 })

  hl(0, "DiagnosticFloatingError", { fg = c.red, bg = c.base03 })
  hl(0, "DiagnosticFloatingWarn", { fg = c.orange, bg = c.base03 })
  hl(0, "DiagnosticFloatingInfo", { fg = c.green, bg = c.base03 })
  hl(0, "DiagnosticFloatingHint", { fg = c.cyan, bg = c.base03 })

  hl(0, "CmpItemAbbrMatch", { fg = c.red })
  hl(0, "CmpItemAbbrMatchFuzzy", { fg = c.orange })

  hl(0, "IlluminatedWordText", { bg = c.base02 })
  hl(0, "IlluminatedWordRead", { bg = c.base02 })
  hl(0, "IlluminatedWordWrite", { bg = c.base02 })
end

return theme
