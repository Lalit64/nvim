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
local lspsigns = { Error = "", Warn = "", Hint = "", Info = "" }
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.diagnostic.config {
      virtual_text = {
        prefix = function(diagnostic)
          if diagnostic.severity == vim.diagnostic.severity.ERROR then
            return lspsigns.Error .. " "
          elseif diagnostic.severity == vim.diagnostic.severity.WARN then
            return lspsigns.Warn .. " "
          elseif diagnostic.severity == vim.diagnostic.severity.INFO then
            return lspsigns.Info .. " "
          else
            return lspsigns.Hint .. " "
          end
        end,
      },
    }
  end,
})

local lualine_setup = function()
  vim.g.lualine_laststatus = vim.o.laststatus
  if vim.fn.argc(-1) > 0 then
    vim.o.statusline = " "
  else
    vim.o.laststatus = 0
  end
end

return { lualine_setup = lualine_setup() }
