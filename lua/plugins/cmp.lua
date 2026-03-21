return {
  "blink.cmp",
  event = "DeferredUIEnter",
  after = function()
    require("blink-cmp").setup {
      appearance = { nerd_font_variant = "mono", use_nvim_cmp_as_default = true },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200, window = { border = "rounded" } },
        menu = {
          border = "rounded",
          draw = {
            columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "source_name" } },
            components = {
              source_name = {
                text = function(ctx)
                  return string.format("[%s]", ctx.source_name)
                end,
              },
            },
          },
        },
      },
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

        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
      },
      cmdline = {
        enabled = false,
      },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
    }
  end,
}
