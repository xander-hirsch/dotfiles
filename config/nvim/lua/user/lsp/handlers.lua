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

local function keymap(bufnr, mode, lhs, rhs, desc)
  local opts = {
    buffer = bufnr,
    desc = desc,
    silent = true,
  }
  vim.keymap.set(mode, lhs, rhs, opts)
end

local function list_workspace_folders()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

local function lsp_keymaps(bufnr)
  local t_status_ok, telescope = pcall(require, "telescope.builtin")
  local references_action
  if t_status_ok then
    keymap(bufnr, "n", "<leader>ld", telescope.diagnostics, "Diagnostics")
    keymap(bufnr, "n", "<leader>lu", telescope.lsp_document_symbols, "Document symbols")
    keymap(bufnr, "n", "<leader>ly", telescope.lsp_workspace_symbols, "Workspace symbols")
    references_action = telescope.lsp_references
  else
    references_action = vim.lsp.buf.references
  end
  keymap(bufnr, "n", "gD", vim.lsp.buf.declaration, "Go to declaration")
  keymap(bufnr, "n", "gd", vim.lsp.buf.definition, "Go to definition")
  keymap(bufnr, "n", "K", vim.lsp.buf.hover, "Hover")
  keymap(bufnr, "n", "gI", vim.lsp.buf.implementation, "Go to implementation")
  keymap(bufnr, "n", "gr", references_action, "Find references")
  keymap(bufnr, "n", "gl", vim.diagnostic.open_float, "Open diagnostic float")
  keymap(bufnr, "n", "gj", vim.diagnostic.goto_next, "Go to next diagnostic")
  keymap(bufnr, "n", "gk", vim.diagnostic.goto_prev, "Go to previous diagnostic")
  keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", "LSP Info")
  keymap(bufnr, "n", "<leader>lf", vim.lsp.buf.format, "Format buffer")
  keymap(bufnr, "n", "<leader>la", vim.lsp.buf.code_action, "Code action")
  keymap(bufnr, "n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol")
  keymap(bufnr, "n", "<leader>ls", vim.lsp.buf.signature_help, "Signature help")
  keymap(bufnr, "i", "<C-j>", vim.lsp.buf.signature_help, "Signature help")
  keymap(bufnr, "n", "<leader>lq", vim.diagnostic.setloclist, "Add diagnostics to location list")
  keymap(bufnr, "n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
  keymap(bufnr, "n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
  keymap(bufnr, "n", "<leader>wl", list_workspace_folders, "List workspace folders")
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
end

return M
