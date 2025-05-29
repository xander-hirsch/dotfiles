vim.g.vimtex_view_method = "skim"
vim.g.vimtex_compiler_progname = "nvr"
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_quickfix_ignore_filters = { "Underfull \\\\hbox (badness 10000)" }
vim.g.tex_flavor = "latex"

local status_ok, which_key = pcall(require, "which-key")
if status_ok then
  which_key.register({ name = "LaTeX" }, { prefix = "<localleader>l" })
end

local function write_server_name()
  local f = io.open("/tmp/nvimserver", "w")
  if f == nil then
    return
  end
  f:write(vim.v.servername)
  f:close()
end

local start_vimtex_ag = vim.api.nvim_create_augroup("vimtex_common", {})
vim.api.nvim_create_autocmd(
  "User",
  { group = start_vimtex_ag, pattern = "VimtexEventInitPost", callback = write_server_name }
)
vim.api.nvim_create_autocmd(
  "User",
  { group = start_vimtex_ag, pattern = "VimtexEventInitPost", command = "VimtexCompile" }
)
