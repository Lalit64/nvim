local M = {}

M.base46 = {
  theme = "catppuccin",
  transparency = true,
}

M.ui = {
  cmp = {
    icons_left = true,
  },

  tabufline = {
    enabled = true,
    lazyload = false,
  },

  statusline = {
    enabled = true,
    theme = "default",
    separator_style = "arrow",
  },

  term = {
    float = {
      width = 0.75,
      height = 0.5,
    },
  },

  lsp = {
    signature = false,
  },
}

return M
