return {
  "nvim-tree.lua",
  event = { "DeferredUIEnter" },
  after = function(_)
    local map = require("utils").map

    map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", "Toggle File Tree")

    require("which-key").add {
      { "<leader>e", desc = "Toggle File Tree", icon = " " },
    }

    require("nvim-tree").setup {
      disable_netrw = true,
      hijack_netrw = false,
      hijack_cursor = true,
      view = {
        centralize_selection = true,
        adaptive_size = false,
        width = 42,
        side = "right",
        preserve_window_proportions = true,
      },
      git = {
        enable = false,
      },
      actions = {
        open_file = {
          resize_window = false,
          quit_on_open = true,
        },
      },
    }
  end,
}
