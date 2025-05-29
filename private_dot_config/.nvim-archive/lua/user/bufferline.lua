local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    indicator = { icon = "▌" },
    show_buffer_close_icons = false,
    show_close_icon = false,
    close_command = nil,
    right_mouse_command = nil,
    left_mouse_command = nil,
    middle_mouse_command = nil,
  },
  highlights = {
    buffer_selected = { italic = false },
  },
}
