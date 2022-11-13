local function neovim_init(client)
  local path = client.workspace_folders[1].name

  -- Find the physical config path
  local config_path = vim.fn.stdpath "config"
  local realpath_prog = io.popen("realpath '" .. config_path .. "'")
  if realpath_prog == nil then
    return true
  end
  local physical_config_path = realpath_prog:read "*a"
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
      },
    }
  end

  client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  return true
end

local servers = {
  pyright = {},
  sumneko_lua = { on_init = neovim_init },
}

local lspconfig = require "lspconfig"
local handlers = require "user.lsp.handlers"

for server, options in pairs(servers) do
  local opts = options
  opts.on_attach = handlers.on_attach
  opts.capabilities = handlers.capabilities
  lspconfig[server].setup(opts)
end
