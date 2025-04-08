return {
  { lazy = true, "nvim-lua/plenary.nvim" },

  -- file tree
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    lazy = false,
    opts = require "plugins.configs.nvim-tree",
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = { { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" } },
    opts = require "plugins.configs.bufferline",
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = require("commands").lualine_setup,
    opts = require "plugins.configs.lualine",
  },

  -- icons
  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
  },

  -- syntax highlighting and language features
  {
    "nvim-treesitter/nvim-treesitter",
    build = require("nixCatsUtils").lazyAdd ":TSUpdate",
    config = require "plugins.configs.treesitter",
  },

  -- colorscheme
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = require "plugins.configs.catppuccin",
  },

  -- completion
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = require "plugins.configs.cmp",
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    config = require("luasnip.loaders.from_vscode").lazy_load(),
  },

  -- autopairs , autocompletes ()[] etc
  {
    "echasnovski/mini.pairs",
    version = false,
    config = require "plugins.configs.mini",
  },

  -- surround selection with ""() etc
  {
    "echasnovski/mini.surround",
    version = false,
    config = require "plugins.configs.mini",
  },

  -- package manager for lsp when not using nix
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall" },
    opts = {},
  },

  -- lsp for completion and diagnostics
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = require "plugins.configs.lazydev",
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
    end,
  },

  -- formatting using lsp or dedicated formatter
  {
    "stevearc/conform.nvim",
    lazy = false,
    opts = require "plugins.configs.conform",
  },

  -- files finder etc
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = require "plugins.configs.telescope",
  },

  -- git icons
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- whichkey
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = require "plugins.configs.which-key",
  },

  -- better ui
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = require "plugins.configs.noice",
  },

  -- utilities via snacks
  {
    "folke/snacks.nvim",
    opts = require "plugins.configs.snacks",
  },

  -- toggleable terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = require "plugins.configs.toggleterm",
  },

  -- ⚡flash navigation
  {
    "folke/flash.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = require "plugins.configs.flash",
  },

  -- inceremental rename
  {
    "smjonas/inc-rename.nvim",
    config = require("inc_rename").setup {},
  },
}
