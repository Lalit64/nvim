local M = {
  formatters_by_ft = {
    lua = { "stylua" },
    nix = { "nixfmt" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    svelte = { lsp_format = "prefer" },
    css = { "prettier" },
    html = { "prettier" },
  },
}

return M
