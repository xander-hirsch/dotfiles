local function is_neovim_dir(workspace_dir)
  local function check_dir(std_path_name)
    -- Find the physical config path
    local std_path = vim.fn.stdpath(std_path_name)
    local realpath_prog = io.popen("realpath '" .. std_path .. "'")
    if realpath_prog == nil then
      return false
    end
    local physical_std_path = realpath_prog:read "*a"
    if physical_std_path == nil then
      return false
    end
    return workspace_dir == string.sub(physical_std_path, 1, -2)
  end

  return check_dir "config" or check_dir "data"
end

local function neovim_init(client)
  if is_neovim_dir(client.workspace_folders[1].name) then
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
  clangd = {},
  pyright = {},
  sumneko_lua = { on_init = neovim_init },
  texlab = {},
}

local lspconfig = require "lspconfig"
local handlers = require "user.lsp.handlers"

for server, options in pairs(servers) do
  if vim.fn.executable(lspconfig[server].document_config.default_config.cmd[1]) == 1 then
    local opts = options
    opts.on_attach = handlers.on_attach
    opts.capabilities = handlers.capabilities
    lspconfig[server].setup(opts)
  end
end
