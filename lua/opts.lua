local opt = vim.opt
local g = vim.g
local opts = {}

opts.initial = function()
  g.mapleader = " "

  opt.laststatus = 3 -- global statusline
  opt.showmode = false

  opt.clipboard = "unnamedplus"

  opt.expandtab = true
  opt.shiftwidth = 2
  opt.smartindent = true
  opt.tabstop = 2
  opt.softtabstop = 2

  vim.opt.fillchars = { eob = " " }
  opt.ignorecase = true
  opt.smartcase = true
  opt.mouse = "a"

  opt.number = true
  opt.relativenumber = true

  opt.signcolumn = "yes"
  opt.splitbelow = true
  opt.splitright = true
  opt.termguicolors = true
  opt.timeoutlen = 400
  opt.undofile = true
  opt.cursorline = true
  opt.scrolloff = 4

  g.loaded_netrw = 1
  g.loaded_netrwPlugin = 1
end

opts.final = function()
  -- mason, write correct names only
  vim.api.nvim_create_user_command("MasonInstallAll", function()
    vim.cmd "MasonInstall css-lsp html-lsp lua-language-server typescript-language-server stylua prettier"
  end, {})

  -- format on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
      require("conform").format { bufnr = args.buf }
    end,
  })

  -- hide diagnostics in insert mode
  vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    callback = function()
      vim.diagnostic.config {
        virtual_text = false,
      }
    end,
  })
  vim.diagnostic.config {
    virtual_text = {
      prefix = "",
      suffix = "",
      format = function(diagnostic)
        return " " .. diagnostic.message .. " "
      end,
    },
    underline = {
      severity = { min = vim.diagnostic.severity.WARN },
    },
    signs = {
      text = {
        [vim.diagnostic.severity.HINT] = "",
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.WARN] = "",
      },
    },
  }

  -- add binaries installed by mason.nvim to path
  local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
  vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"
end

return opts
