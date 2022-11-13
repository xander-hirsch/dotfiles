local lsp_status_ok, _ = pcall(require, "lspconfig")
if not lsp_status_ok then
  return
end

local settings_status_ok, nlsp_settings = pcall(require, "nlspsettings")
if settings_status_ok then
  nlsp_settings.setup {}
end

require "user.lsp.setup"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
