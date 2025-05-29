local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",

    mappings = {
      i = {
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,
      },
    },

    layout_strategy = "flex",
    layout_config = {
      horizontal = {
        preview_cutoff = 120,
      },
      vertical = {
        preview_cutoff = 40,
      },
      flex = {
        flip_columns = 120,
        flip_lines = 40,
      },
    },
  },
}

local keymap = require("user.util").keymap
local builtin = require "telescope.builtin"

keymap("n", "<leader>b", builtin.buffers, "Buffers")
keymap("n", "<leader>ff", builtin.find_files, "Files")
keymap("n", "<leader>fg", builtin.live_grep, "Live Grep")
keymap("n", "<leader>fh", builtin.help_tags, "Help Tags")
keymap("n", "<leader>fm", function()
  builtin.man_pages { sections = { "1", "2", "3" } }
end, "Man Pages")
