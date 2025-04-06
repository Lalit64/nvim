---@module 'blink.cmp'
---@type blink.cmp.Config
local M = {
  keymap = {
    preset = "none",
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide", "fallback" },
    ["<CR>"] = { "accept", "fallback" },

    ["<Tab>"] = { "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },

    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
    ["<C-n>"] = { "select_next", "fallback_to_mappings" },

    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
  },
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
        border = "solid",
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
