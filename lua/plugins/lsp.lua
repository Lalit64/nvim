return {
  {
    "nvim-lspconfig",
    event = "DeferredUIEnter",
    before = function()
      require("lz.n").trigger_load { "which-key.nvim", "blink.cmp" }
    end,
    after = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),

        callback = function(event)
          local map = require("utils").map

          map("n", "<leader>lgD", vim.lsp.buf.declaration, "Go to Declaration")
          map("n", "<leader>lgd", vim.lsp.buf.definition, "Go to Definition")
          map("n", "<leader>lgt", vim.lsp.buf.type_definition, "Go to Type")
          map("n", "<leader>lgi", vim.lsp.buf.implementation, "List Implementations")
          map("n", "<leader>lgr", vim.lsp.buf.references, "List References")

          map("n", "<leader>lgp", vim.diagnostic.goto_prev, "Got to prev Diagnostic")
          map("n", "<leader>lgn", vim.diagnostic.goto_next, "Got to next Diagnostic")

          map("n", "<leader>lh", vim.lsp.buf.hover, "Trigger Hover")
          map("n", "<leader>lr", vim.lsp.buf.rename, "Rename Symbol")
          map("n", "<leader>la", vim.lsp.buf.code_action, "Code Action")
          map("n", "<leader>ld", vim.diagnostic.open_float, "Diagnostics At Cursor")

          require("which-key").add {
            { "<leader>l", group = "+LSP", icon = " " },
            { "<leader>lg", group = "+Go to", icon = " " },
          }

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          if client and client:supports_method "textDocument/inlayHint" then
            vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
          end

          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = "lsp-highlight", buffer = event2.buf }
              end,
            })
          end
        end,
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      local D = vim.diagnostic.severity
      vim.diagnostic.config {
        signs = {
          text = {
            [D.HINT] = " ",
            [D.ERROR] = " ",
            [D.INFO] = " ",
            [D.WARN] = " ",
          },
          numhl = {
            [D.ERROR] = "",
            [D.WARN] = "",
            [D.HINT] = "",
            [D.INFO] = "",
          },
        },
        virtual_text = false,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          header = "",
          prefix = "",
        },
      }

      local servers = require("utils").servers

      for server_name, cfg in pairs(servers) do
        vim.lsp.enable(server_name)
        vim.lsp.config(server_name, cfg or {})
      end
    end,
  },
  {
    "lazydev.nvim",
    cmd = { "LazyDev" },
    ft = "lua",
    after = function()
      require("lazydev").setup {
        enabled = true,
      }
    end,
  },
  {
    "nvim-lint",
    event = "DeferredUIEnter",
    after = function()
      local for_c = { "clangtidy" }
      require("lint").linters_by_ft = {
        text = {},
        markdown = {},
        nix = { "statix" },
        json = { "biomejs" },
        dockerfile = { "hadolint" },
        python = { "ruff" },
        javascript = { "biomejs" },
        typescript = { "biomejs" },
        javascriptreact = { "biomejs" },
        typescriptreact = { "biomejs" },
        css = { "biomejs" },
        svelte = { "eslint_d" },
      }

      -- Lint on read, write & insert leave
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
        callback = function()
          require("lint").try_lint(nil, { ignore_errors = true })
        end,
      })
    end,
  },
}
