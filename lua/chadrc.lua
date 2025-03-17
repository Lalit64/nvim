local M = {}

M.base46 = {
  theme = "catppuccin",
  transparency = true,
}

M.ui = {
  cmp = {
    icons_left = true,
  },

  statusline = {
    enabled = true,
    theme = "default",
    separator_style = "arrow",
  },

  nvdash = {
    load_on_startup = true,
  },
}

return M
