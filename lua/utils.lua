local M = {}

M.map = function(mode, key, action, desc, remap)
  vim.keymap.set(mode, key, action, { desc = desc, noremap = true, silent = true, remap = remap })
end

M.servers = {
  emmylua_ls = {
    filetypes = { "lua" },
  },
  basedpyright = {
    settings = {
      basedpyright = {
        analysis = { typeCheckingMode = "standard" },
      },
    },
  },
  nixd = {
    filetypes = { "nix" },
    settings = {
      nixd = {
        nixpkgs = { expr = "import <nixpkgs> {}" },
        options = {
          darwin = {
            expr = "(builtins.getFlake ./.).darwinConfigurations.lalits-mbp.options",
          },
          home_manager = {
            expr = '(builtins.getFlake ./.).homeConfigurations."lalit@lalits-mbp".options',
          },
        },
      },
    },
  },
  gopls = {},
  bashls = {},
  jsonls = {},
  vtsls = {},
  rust_analyzer = {},
  svelte = {},
  tailwindcss = {},
  cssls = {},
  html = {},
}

return M
