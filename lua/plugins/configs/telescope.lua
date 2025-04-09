require("telescope").load_extension "ui-select"

local M = {
  defaults = {
    prompt_prefix = "  ",
    selection_caret = " ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = { prompt_position = "top" },
    },
  },
}

return M
