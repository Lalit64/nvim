local M = {
  disable_netrw = true,
  hijack_netrw = false,
  hijack_cursor = true,
  view = {
    centralize_selection = true,
    adaptive_size = false,
    side = "left",
    preserve_window_proportions = true,
    float = {
      enable = true,
      open_win_config = function()
        return {
          row = 0,
          width = 42,
          border = "rounded",
          relative = "editor",
          col = vim.o.columns,
          height = vim.o.lines,
        }
      end,
    },
  },
  actions = {
    open_file = {
      resize_window = false,
    },
  },
}

return M
