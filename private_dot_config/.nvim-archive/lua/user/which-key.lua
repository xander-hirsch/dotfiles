local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

which_key.setup {
  window = { border = "single" },
}

which_key.register({
  f = { name = "Find"},
  g = { name = "Git" },
  l = { name = "LSP" },
  p = { name = "Packer" },
  t = { name = "Find" },
  w = { name = "LSP Workspace" },
}, { prefix = "<leader>" })
