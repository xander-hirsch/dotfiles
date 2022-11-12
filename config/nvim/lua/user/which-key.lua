local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = { prefix = "<leader>" }

local mappings = {
  e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },

  f = { "<cmd>Telescope find_files<cr>", "Find File" },

  g = { name = "Git" },

  l = { name = "LSP" },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  s = {
    name = "Search",
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
  },
}

which_key.setup {}
which_key.register(mappings, opts)
