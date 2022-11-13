local m_status_ok, mason = pcall(require, "mason")
if not m_status_ok then
  return
end

mason.setup {
  PATH = "append",
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}

local mlsp_status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mlsp_status_ok then
  return
end

mason_lsp.setup {}

local function neovim_init(client)
  local path = client.workspace_folders[1].name

  -- Find the physical config path
  local config_path = vim.fn.stdpath("config")
  local realpath_prog = io.popen("realpath '" .. config_path .. "'")
  if realpath_prog == nil then
    return true
  end
  local physical_config_path = realpath_prog:read("*a")
  if physical_config_path == nil then
    return true
  end

  if path == string.sub(physical_config_path, 1, -2) then
    client.config.settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = {
          globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
    }
  }
  end

  client.notify(
    "workspace/didChangeConfiguration",
    { settings = client.config.settings }
  )
  return true
end

local lspconfig = require "lspconfig"

for _, server in pairs(mason_lsp.get_installed_servers()) do
  local handlers = require "user.lsp.handlers"
	local opts = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities,
	}

  -- Neovim configuration
  if server == "sumneko_lua" then
    opts.on_init = neovim_init
  end
	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
