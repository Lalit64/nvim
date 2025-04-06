---@module 'blink.cmp'
---@type blink.cmp.Config
local M = {
  keymap = { preset = "enter" },
  appearance = {
    kind_icons = {
      Text = "󰉿",
      Method = "",
      Function = "󰊕",
      Constructor = "󰒓",
      Field = "",
      Variable = "󰆦",
      Property = "󰖷",
      Class = "",
      Interface = "",
      Struct = "󱡠",
      Module = "󰅩",
      Unit = "󰪚",
      Value = "",
      Enum = "",
      EnumMember = "",
      Keyword = "",
      Constant = "󰏿",
      Snippet = "",
      Color = "󰏘",
      File = "󰈔",
      Reference = "󰬲",
      Folder = "󰉋",
      Event = "󱐋",
      Operator = "󰪚",
      TypeParameter = "󰬛",
      Error = "󰏭",
      Warning = "",
      Information = "󰋼",
      Hint = "",
    },
  },
  completion = {
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
    menu = {
      scrolloff = 0,
      scrollbar = false,
      draw = {
        columns = {
          { "label", gap = 10 },
          { "kind_icon", gap = 1 },
          { "kind" },
          { "label_description" },
        },

        gap = 1,
        treesitter = { "lsp" },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = {
        border = "single",
      },
    },
    ghost_text = {
      enabled = true,
    },
  },
  snippets = { preset = "luasnip" },
  signature = { enabled = true, window = { border = "rounded" } },
  cmdline = { enabled = false },
  sources = {
    default = {
      "lsp",
      "path",
      "snippets",
      "buffer",
    },
  },
}

return M
