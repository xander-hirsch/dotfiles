local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

local function cspell_filter(utils)
  return utils.root_has_file { ".cspell.json" }
end

null_ls.setup {
  log_level = "debug",
  sources = {
    code_actions.cspell.with {
      condition = cspell_filter,
    },
    formatting.black,
    formatting.stylua,
    diagnostics.cspell.with {
      condition = cspell_filter,
      diagnostics_postprocess = function(diagnostic)
        diagnostic.severity = vim.diagnostic.severity.INFO
      end,
    },
    diagnostics.pylint,
  },
}
