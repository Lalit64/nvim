local o = vim.o
local g = vim.g

g.mapleader = " "

o.laststatus = 3 -- global statusline
o.showmode = false

o.clipboard = "unnamedplus"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

vim.opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

o.number = true
o.relativenumber = true

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.timeoutlen = 400
o.undofile = true
o.cursorline = true
o.scrolloff = 4

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end
-- g:neovide_opacity should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_opacity = 0.0
vim.g.transparency = 0.8
vim.g.neovide_background_color = "#191724" .. alpha()
vim.g.neovide_window_blurred = true
