local theme = "catppuccin"

require("catppuccin").setup {
  flavour = "mocha",
  transparent_background = true,

  term_colors = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  background = {
    dark = "mocha",
    light = "latte",
  },
  styles = {
    keywords = { "italic" },
    types = { "bold" },
    conditionals = { "italic" },
    loops = { "italic" },
    comments = { "italic" },
    functions = { "bold" },
  },
  custom_highlights = function(colors)
    local darken = require("catppuccin.utils.colors").darken
    return {
      ["@variable.builtin"] = { italic = true },
      FloatBorder = { bg = colors.none },
      NormalFloat = { bg = colors.none },
      FloatTitle = {
        fg = colors.crust,
        bg = colors.blue,
        bold = true,
        italic = true,
      },
      TreesitterContext = { bg = colors.base, blend = 0 },
      TreesitterContextLineNumber = { bg = colors.mantle },
      TreesitterContextBottom = { style = {} },
      TreesitterContextLineNumberBottom = { style = {} },
      Folded = { bg = colors.base },
      NoiceCmdlinePopup = { bg = colors.base, blend = 0 },
      NoicePopup = { bg = colors.base, blend = 0 },
      SnacksPickerTitle = {
        fg = colors.crust,
        bg = colors.mauve,
        bold = true,
        italic = true,
      },
      SnacksPickerListTitle = {
        fg = colors.crust,
        bg = colors.green,
        bold = true,
        italic = true,
      },
      SnacksPickerInputTitle = {
        fg = colors.crust,
        bg = colors.red,
        bold = true,
        italic = true,
      },
      SnacksPickerInputSearch = {
        fg = colors.crust,
        bg = colors.blue,
        bold = true,
        italic = true,
      },
      SnacksScratchKey = {
        fg = colors.crust,
        bg = colors.blue,
        bold = true,
        italic = true,
      },
      SnacksScratchDesc = {
        fg = colors.crust,
        bg = colors.blue,
        bold = true,
        italic = true,
      },
      SymbolUsageContent = { link = "Comment" },
      SymbolUsageRef = { link = "Function" },
      SymbolUsageDef = { link = "Type" },
      SymbolUsageImpl = { link = "@keyword" },
    }
  end,
  integrations = {
    blink_cmp = true,
    colorful_winsep = { enabled = true, color = "mauve" },
    copilot_vim = true,
    dap = true,
    dap_ui = true,
    diffview = true,
    flash = true,
    gitsigns = true,
    grug_far = true,
    indent_blankline = {
      enabled = true,
      scope_color = "mauve",
      colored_indent_levels = false,
    },
    illuminate = { enabled = true, lsp = true },
    lsp_saga = true,
    lsp_trouble = true,
    markdown = true,
    mini = { enabled = true, indentscope_color = "mauve" },
    native_lsp = { enabled = true, inlay_hints = { background = true } },
    neogit = true,
    neotest = true,
    noice = true,
    notify = true,
    nvim_surround = true,
    octo = true,
    overseer = true,
    rainbow_delimiters = true,
    render_markdown = true,
    semantic_tokens = true,
    snacks = { enabled = true },
    symbols_outline = true,
    telescope = { enabled = true },
    treesitter = true,
    treesitter_context = true,
    ufo = true,
    which_key = true,
  },
}

vim.cmd.colorscheme(theme)

return {}
