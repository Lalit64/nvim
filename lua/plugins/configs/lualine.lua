local M = {
  options = {
    theme = "catppuccin",
    globalstatus = vim.o.laststatus == 3,
    disabled_filetypes = { statusline = { "NvimTree", "snacks_dashboard" } },
  },
}

return M
