local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = { prefix = "<leader>" }

local mappings = {
  g = { name = "Git" },
  l = { name = "LSP" },
  w = { name = "LSP Workspace" },
  h = { "<cmd>nohlsearch<cr>", "Stop Highlighting" },
  c = { "<cmd>close<cr>", "Close Window" },
}

-- Nvim Tree
local nt_status_ok, nvim_tree = pcall(require, "nvim-tree.api")
if nt_status_ok then
  mappings.e = { nvim_tree.tree.toggle, "Explorer" }
end

-- Delete buffer
local bd_status_ok, bufdelete = pcall(require, "bufdelete")
local close_buffer_action
if bd_status_ok then
  close_buffer_action = bufdelete.bufdelete
else
  close_buffer_action = "<cmd>bdelete<cr>"
end
mappings.d = { close_buffer_action, "Delete Buffer" }

-- Packer
local packer_status_ok, packer = pcall(require, "packer")
if packer_status_ok then
  mappings.p = {
    name = "Packer",
    c = { packer.compile, "Compile" },
    i = { packer.install, "Install" },
    S = { packer.status, "Status" },
    p = { packer.sync, "Sync" },
    u = { packer.update, "Update" },
  }
end

-- Telescope
local t_status_ok, telescope = pcall(require, "telescope.builtin")
if t_status_ok then
  mappings.f = {
    name = "Find",
    f = { telescope.find_files, "Files" },
    g = { telescope.live_grep, "Live Grep" },
    b = { telescope.buffers, "Buffers" },
    h = { telescope.help_tags, "Help Tags" },
    m = {
      function()
        telescope.man_pages { sections = { "1", "2", "3" } }
      end,
      "Man Pages",
    },
  }
end

which_key.setup {
  window = { border = "single" },
}
which_key.register(mappings, opts)
