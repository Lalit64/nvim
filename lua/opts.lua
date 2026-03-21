local defIndent = 2

local options = {
  cursorline = true, -- highlight current line
  cursorlineopt = "line", -- highlight only the line no. of current line

  termguicolors = true, -- required for colorschemes & other plugins

  -- line numbers
  relativenumber = true, -- show relative numbers
  number = true, -- show absolute line no. on cursorline (when relativenumber is on)

  -- hlsearch = true, -- set highlight on search
  breakindent = true,

  -- tabs & indentation
  tabstop = defIndent, -- spaces for tabs
  shiftwidth = defIndent, -- spaces for indent width when using '>>' or '<<' on existing line
  softtabstop = defIndent,
  expandtab = true, -- expand tabs to spaces
  autoindent = true, -- copy indent from current line when starting new one
  smartindent = true,

  -- Case-insensitive searching UNLESS \C or capital in search
  ignorecase = true,
  smartcase = true,

  signcolumn = "yes",

  -- Decrease update time
  -- updatetime = 250,
  -- timeoutlen = 300,

  undofile = true,
  swapfile = false,

  scrolloff = 10,

  list = true,
  listchars = { nbsp = "␣", tab = "» ", trail = "·" },

  inccommand = "split",

  -- Folds
  fillchars = { eob = " ", fold = " ", foldclose = "", foldopen = "", foldsep = "▕" },
  foldcolumn = "0",
  foldenable = true,
  foldlevel = 99,
  foldlevelstart = 99,

  winborder = "rounded",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

local g = vim.g

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

vim.opt.clipboard = "unnamedplus"
