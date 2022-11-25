local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = "all",
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "tex", "latex" },
  },
  indent = { enable = true, disable = { "" } },
  playground = { enable = true },
}
