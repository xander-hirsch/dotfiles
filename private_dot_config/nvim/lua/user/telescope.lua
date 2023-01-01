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
