local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
if status_cmp_ok then
  M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
end

M.setup = function()
  local signs = {

    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = false, -- disable virtual text
    signs = {
      active = signs, -- show signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local keymap = require("user.util").keymap

local function list_workspace_folders()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

local function lsp_keymaps(bufnr)
  local t_status_ok, telescope = pcall(require, "telescope.builtin")
  local references_action
  if t_status_ok then
    keymap("n", "<leader>ld", telescope.diagnostics, "Diagnostics", bufnr)
    keymap("n", "<leader>s", telescope.lsp_document_symbols, "Document symbols", bufnr)
    keymap("n", "<leader>S", telescope.lsp_workspace_symbols, "Workspace symbols", bufnr)
    references_action = telescope.lsp_references
  else
    references_action = vim.lsp.buf.references
  end

  local symbols_status_ok, _ = pcall(require, "symbols-outline")
  if symbols_status_ok then
    keymap("n", "<leader>ly", "<cmd>SymbolsOutline<cr>", "Symbols outline", bufnr)
  end

  keymap("n", "gD", vim.lsp.buf.declaration, "Go to declaration", bufnr)
  keymap("n", "gd", vim.lsp.buf.definition, "Go to definition", bufnr)
  keymap("n", "K", vim.lsp.buf.hover, "Hover", bufnr)
  keymap("n", "<leader>k", "K", "Open man page", bufnr)
  keymap("n", "gI", vim.lsp.buf.implementation, "Go to implementation", bufnr)
  keymap("n", "gr", references_action, "Find references", bufnr)
  keymap("n", "gl", vim.diagnostic.open_float, "Open diagnostic float", bufnr)
  keymap("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic", bufnr)
  keymap("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic", bufnr)
  keymap("n", "<leader>li", "<cmd>LspInfo<cr>", "LSP info", bufnr)
  keymap("n", "<leader>lI", "<cmd>NullLsInfo<cr>", "null-ls info", bufnr)
  keymap("n", "<leader>lf", vim.lsp.buf.format, "Format buffer", bufnr)
  keymap("n", "<leader>la", vim.lsp.buf.code_action, "Code action", bufnr)
  keymap("n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol", bufnr)
  keymap("n", "<leader>ls", vim.lsp.buf.signature_help, "Signature help", bufnr)
  keymap("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help", bufnr)
  keymap("n", "<leader>lq", vim.diagnostic.setloclist, "Add diagnostics to location list", bufnr)
  keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder", bufnr)
  keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder", bufnr)
  keymap("n", "<leader>wl", list_workspace_folders, "List workspace folders", bufnr)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
end

return M
