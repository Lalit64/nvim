local M = {
  open_mapping = [[<C-t>]],
  direction = "float",
  highlights = {
    FloatBorder = {
      guifg = require("catppuccin.palettes").get_palette("mocha").blue,
    },
  },
  float_opts = {
    border = "curved",
    width = function()
      return math.floor(vim.o.columns * 0.7)
    end,
    height = function()
      return math.floor(vim.o.lines * 0.7)
    end,
    row = function()
      return math.floor((vim.o.lines - vim.o.lines * 0.7) / 2) - 1
    end,
    col = function()
      return math.floor((vim.o.columns - vim.o.columns * 0.7) / 2)
    end,
    title_pos = "left",
  },
}

return M
