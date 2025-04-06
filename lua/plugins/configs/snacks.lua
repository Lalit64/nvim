local M = {
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  lazygit = { enabled = true },
  statuscolumn = { enabled = true }, -- we set this in options.lua
  words = { enabled = true },
  dashboard = require "plugins.configs.snacks-dash",
}

return M
