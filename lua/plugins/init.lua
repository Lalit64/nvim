return {
  { lazy = true, "nvim-lua/plenary.nvim" },

  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = require "plugins.configs.nvim-tree",
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = require "plugins.configs.bufferline",
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = require("commands").lualine_setup,
    opts = require "plugins.configs.lualine",
  },

  -- syntax highlighting and language features
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VimEnter",
    build = require("nixCatsUtils").lazyAdd ":TSUpdate",
    config = require "plugins.configs.treesitter",
  },

  {
    "tpope/vim-sleuth",
    event = "BufReadPre",
  },

  -- commenting plugin
  {
    "numToStr/Comment.nvim",
    event = "BufReadPre",
  },

  -- colorscheme
  {
    "rose-pine/nvim",
    event = "VimEnter",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup {
        variant = "base",
        styles = {
          transparency = true,
        },
      }

      vim.cmd "colorscheme rose-pine"
    end,
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
    event = "BufReadPre",
    config = require("luasnip.loaders.from_vscode").lazy_load(),
  },

  -- surround selection with ""() etc
  {
    "echasnovski/mini.surround",
    event = "BufReadPre",
    opts = require("plugins.configs.mini").surround,
  },

  -- autopairs , autocompletes ()[] etc
  {
    "windwp/nvim-autopairs",
    event = "BufReadPre",
    opts = {},
  },

  {
    "windwp/nvim-ts-autotag",
    event = "BufReadPre",
    opts = {
      opts = {
        -- Defaults
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = true, -- Auto close on trailing </
      },
    },
  },

  -- icons
  {
    "echasnovski/mini.icons",
    event = "VimEnter",
    init = require("commands").nvim_web_devicons,
    opts = require("plugins.configs.mini").icons,
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
    event = "BufReadPre",
    lazy = false,
    opts = require "plugins.configs.conform",
  },

  -- files finder etc
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    cmd = "Telescope",
    opts = require "plugins.configs.telescope",
  },

  -- git icons
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = require "plugins.configs.gitsigns",
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
    init = function()
      require("notify").setup {
        background_colour = "#000000",
      }
    end,
    opts = require "plugins.configs.noice",
  },

  -- utilities via snacks
  {
    "folke/snacks.nvim",
    event = "VimEnter",
    opts = require "plugins.configs.snacks",
  },

  -- flash navigation
  {
    "folke/flash.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = require "plugins.configs.flash",
  },

  -- markdown preview in the browser
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    ft = { "rust" },
    version = "^6",
  },
}
