return {
  "conform.nvim",
  event = "BufWritePre",
  cmd = { "ConformInfo", "ConformFormat" },
  after = function(_)
    require("conform").setup {
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        _ = { "squeeze_blanks", "trim_whitespace" },
        lua = { "stylua" },
        nix = { "alejandra" },
        sh = { "shfmt" },
        go = { "gofumpt" },
        rust = { "rustfmt" },
        python = { "ruff_organize_imports", "ruff_format" },
        javascript = { "biome" },
        javascriptreact = { "biome" },
        typescript = { "biome" },
        typescriptreact = { "biome" },
        svelte = { "prettierd" },
        css = { "biome" },
        scss = { "prettierd" },
        less = { "prettierd" },
        html = { "prettierd" },
        json = { "biome" },
        yaml = { "yamlfix", "prettierd" },
        markdown = { "prettierd" },
      },
    }

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format { bufnr = args.buf }
      end,
    })
  end,
}
