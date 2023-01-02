local function run_command(command)
	local prog = io.popen(command)
	if prog == nil then
		return nil
	end

	local raw_output = prog:read("*a")
	if raw_output == nil then
		return nil
	end

	return string.sub(raw_output, 1, -2)
end

local function is_prefix(prefix, test_str)
	local prefix_len = string.len(prefix)
	return (string.len(test_str) >= prefix_len) and (prefix == string.sub(test_str, 1, prefix_len))
end

local function is_neovim_dir(workspace_dir)
	local chezmoi_nvim = run_command("chezmoi source-path")
	if (chezmoi_nvim ~= nil) and (is_prefix(chezmoi_nvim .. "/private_dot_config/nvim", workspace_dir)) then
		return true
	end

	local data_dir = vim.fn.stdpath("data")
	if is_prefix(data_dir, workspace_dir) then
		return true
	end

	return false
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

local lspconfig = require("lspconfig")
local handlers = require("user.lsp.handlers")

for server, options in pairs(servers) do
	if vim.fn.executable(lspconfig[server].document_config.default_config.cmd[1]) == 1 then
		local opts = options
		opts.on_attach = handlers.on_attach
		opts.capabilities = handlers.capabilities
		lspconfig[server].setup(opts)
	end
end
