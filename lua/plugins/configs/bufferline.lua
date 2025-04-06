local M = {
  -- highlights = require("catppuccin.groups.integrations.bufferline").get {},
  options = {
    close_command = function(n)
      Snacks.bufdelete(n)
    end,
    right_mouse_command = function(n)
      Snacks.bufdelete(n)
    end,
    diagnostics = "nvim_lsp",
    always_show_bufferline = false,
    show_tab_indicators = false,
    separator_style = { " ", " " },
    indicator = {
      style = "icon",
      icon = " ",
    },
    buffer_close_icon = "",
    modified_icon = "•",
    left_trunc_marker = "<-",
    right_trunc_marker = "->",
    color_icons = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = " Files",
        highlight = "Directory",
        text_align = "left",
      },
    },
  },
}

return M
