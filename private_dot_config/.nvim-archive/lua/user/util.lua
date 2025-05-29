M = {}

M.keymap = function (mode, lhs, rhs, desc, bufnr)
  local opts = {
    desc = desc,
    silent = true,
  }
  if bufnr ~= nil then
    opts.buffer = bufnr
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
