return {
  { lazy = true, "nvim-lua/plenary.nvim" },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    lazy = false,
    config = function()
      require("nvim-tree").setup {
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        view = {
          width = {
            min = 36,
            max = 36,
          },
        },
        actions = {
          open_file = {
            resize_window = false,
          },
        },
      }
    end,
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    },
    opts = require "plugins.configs.bufferline",
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        vim.o.statusline = " "
      else
        vim.o.laststatus = 0
      end
    end,
    opts = require "plugins.configs.lualine",
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = require("nixCatsUtils").lazyAdd ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
  },

  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup {
        flavour = "mocha",
        transparent_background = true,
        integrations = {
          blink_cmp = true,
          noice = true,
          nvimtree = true,
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

      vim.cmd [[ colorscheme catppuccin ]]
    end,
  },

  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = require "plugins.configs.cmp",
  },

  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- autopairs , autocompletes ()[] etc
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  {
    "echasnovski/mini.surround",
    version = false,
    config = function()
      require("mini.surround").setup {
        mappings = {
          add = "za", -- Add surrounding in Normal and Visual modes
          delete = "zd", -- Delete surrounding
          find = "zf", -- Find surrounding (to the right)
          find_left = "zF", -- Find surrounding (to the left)
          highlight = "zh", -- Highlight surrounding
          replace = "zr", -- Replace surrounding
          update_n_lines = "zn", -- Update `n_lines`

          suffix_last = "l", -- Suffix to search with "prev" method
          suffix_next = "n", -- Suffix to search with "next" method
        },
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall" },
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            -- adds type hints for nixCats global
            { path = (nixCats.nixCatsPath or "") .. "/lua", words = { "nixCats" } },
          },
        },
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
    end,
  },

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

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = require "plugins.configs.toggleterm",
  },

  {
    "folke/flash.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
    },
  },

  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup {}
    end,
  },
}
