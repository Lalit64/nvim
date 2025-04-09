local M = {
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
  scope = { enabled = true },
  lazygit = { enabled = true },
  statuscolumn = { enabled = true }, -- we set this in options.lua
  words = { enabled = true },
  scroll = {
    enabled = false,
  },
  terminal = {
    enabled = true,
    win = {
      style = "float",
      border = "rounded",
      width = math.floor(vim.o.columns * 0.8),
      height = math.floor(vim.o.lines * 0.8),
    },
  },
  dashboard = require "plugins.configs.snacks-dash",
}

return M
