local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup {
  signs = {
    add = { text = "▌" },
    change = { text = "▌" },
    delete = { text = "▃" },
    topdelete = { text = "" },
    changedelete = { text = "~" },
  },

  current_line_blame_opts = { delay = 500 },

  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, desc)
      local opts = {
        silent = true,
        desc = desc,
        buffer = bufnr,
      }
      vim.keymap.set(mode, "<leader>g" .. lhs, rhs, opts)
    end

    map("n", "g", gitsigns.preview_hunk, "Preview Hunk")
    map("n", "l", gitsigns.blame_line, "Blame line")
    map("n", "L", gitsigns.toggle_current_line_blame, "Toggle blame")
    map("n", "j", gitsigns.next_hunk, "Next Hunk")
    map("n", "k", gitsigns.prev_hunk, "Previous Hunk")
    map("n", "s", gitsigns.stage_hunk, "Stage Hunk")
    map("n", "u", gitsigns.undo_stage_hunk, "Undo Stage Hunk")
    map("n", "r", gitsigns.reset_hunk, "Reset Hunk")
    map("n", "R", gitsigns.reset_buffer, "Reset Buffer")

    local t_status_ok, telescope = pcall(require, "telescope.builtin")
    if t_status_ok then
      map("n", "t", telescope.git_status, "Status")
      map("n", "b", telescope.git_branches, "Branches")
      map("n", "c", telescope.git_commits, "Commits")
    end
  end,
}
