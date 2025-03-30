require("nvim-treesitter.configs").setup {
  ensure_installed = require('nixCatsUtils').lazyAdd({
    "lua",
    "vim",
    "vimdoc",
    "html",
    "css",
    "typescript",
    "javascript",
    "svelte",
    "rust",
    "astro",
    "nix",
  }),

  auto_install = not require('nixCatsUtils').isNixCats,

  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
}
