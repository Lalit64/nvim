return {
  {
    "plenary.nvim",
  },
  {
    "tabout.nvim",
    event = { "DeferredUIEnter" },
    after = function(_)
      require("tabout").setup {}
    end,
  },
  {
    "auto-indent.nvim",
    event = { "DeferredUIEnter" },
    after = function(_)
      require("auto-indent").setup {}
    end,
  },
  {
    "blink.pairs",
    event = { "DeferredUIEnter" },
    after = function(_)
      require("blink.pairs").setup {}
    end,
  },
  {
    "mini.surround",
    event = { "DeferredUIEnter" },
    after = function(_)
      require("mini.surround").setup {}
    end,
  },
  {
    "which-key.nvim",
    lazy = false,
    priority = 100,
    after = function()
      require("which-key").setup {
        preset = "helix",
        spec = wk_specs,
      }
    end,
  },
  {
    "mini.icons",
    lazy = false,
    after = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
}
