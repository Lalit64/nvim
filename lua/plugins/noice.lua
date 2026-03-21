return {
  "noice.nvim",
  event = "DeferredUIEnter",
  before = function()
    require("notify").setup {
      render = "compact",
      background_colour = "#000000",
      timeout = 2000,
      top_down = false,
      fps = 60,
    }
  end,
  after = function()
    require("noice").setup {
      lsp = {
        progress = { enabled = true },
        hover = { enabled = true },
        signature = { enabled = true },
      },
      presets = {
        bottom_search = false,
        command_palette = false,
        long_message_to_split = false,
        lsp_doc_border = true,
      },
      notify = { enabled = true },
      messages = { enabled = true },

      views = {
        cmdline_popup = {
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            min_width = 60,
            width = "auto",
            height = "auto",
          },
          win_options = {
            winhighlight = { Normal = "NormalFloat" },
          },
        },
        cmdline_popupmenu = {
          relative = "editor",
          position = {
            row = 11,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
            max_height = 15,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
        },
      },
    }
  end,
}
