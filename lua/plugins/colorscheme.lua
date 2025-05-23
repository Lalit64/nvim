return {
  {
    "catppuccin/nvim",
    event = "VimEnter",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup {
        flavour = "mocha",
        transparent_background = true,
        integrations = {
          blink_cmp = true,
          noice = true,
          nvimtree = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          snacks = {
            enabled = true,
            indent_scope_color = "blue",
          },
          telescope = {
            enabled = true,
            style = "nvchad",
          },
        },
      }

      vim.cmd.colorscheme "catppuccin"
    end,
  },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     require("rose-pine").setup {
  --       variant = "main",
  --       styles = {
  --         transparency = true,
  --       },
  --     }
  --
  --     vim.api.nvim_create_autocmd("ColorScheme", {
  --       command = [[highlight CursorLine guibg=#0A0A11]],
  --     })
  --
  --     vim.cmd.colorscheme "rose-pine"
  --   end,
  -- },
}
