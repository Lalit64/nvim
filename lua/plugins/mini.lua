return {
  "echasnovski/mini.nvim",
  version = false,
  init = function()
    package.preload["nvim-web-devicons"] = function()
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  event = "VimEnter",
  config = function()
    require("ts_context_commentstring").setup {
      enable_autocmd = false,
    }
    require("mini.comment").setup {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring { key = "commentstring" }
            or vim.bo.commentstring
        end,
      },
    }

    require("mini.icons").setup {}
    require("mini.surround").setup {
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`

        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },
    }
  end,
}
