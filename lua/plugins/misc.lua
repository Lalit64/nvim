local conf_path = vim.fn.stdpath "config" --[[@as string]]

return {
  { "nvim-lua/plenary.nvim", lazy = true },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "VimEnter",
    build = require("nixCatsUtils").lazyAdd ":TSUpdate",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = require("nixCatsUtils").lazyAdd {
          "lua",
          "vim",
          "vimdoc",
          "html",
          "css",
          "typescript",
          "javascript",
          "svelte",
          "rust",
          "astro",
          "nix",
        },
        auto_install = not require("nixCatsUtils").isNixCats,
        highlight = {
          enable = true,
          use_languagetree = true,
        },
        indent = { enable = true },
      }
    end,
  },

  {
    "tpope/vim-sleuth",
    event = "BufReadPre",
  },

  {
    "numToStr/Comment.nvim",
    event = "BufReadPre",
  },

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
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true,
      },
    },
  },

  {
    "folke/flash.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        "z",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "Z",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "options",
    event = "VeryLazy",
    dir = conf_path,
    config = function()
      require("opts").final()
      require("mappings").general()
      require("mappings").misc()
    end,
  },
}
