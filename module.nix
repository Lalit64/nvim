inputs: {
  wlib,
  pkgs,
  ...
}: let
  auto-indent-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "auto-indent.nvim";
    version = "2023-11-03";

    src = pkgs.fetchFromGitHub {
      owner = "VidocqH";
      repo = "auto-indent.nvim";
      rev = "main";
      hash = "sha256-dubpVupLfc81Jvb4woSQ63n2+VsJCRjnvDzkFTQE2MQ=";
    };
  };
in {
  imports = [wlib.wrapperModules.neovim];

  # startup plugins
  specs.general = with pkgs.vimPlugins; [
    lz-n
    vim-sleuth
    plenary-nvim
    nui-nvim
    snacks-nvim
    nvim-notify
    friendly-snippets
    which-key-nvim

    catppuccin-nvim
  ];
  # lazy loaded
  specs.lazy = {
    lazy = true;
    data = with pkgs.vimPlugins;
      [
        blink-cmp
        nvim-lspconfig
        nvim-lint
        lazydev-nvim
        conform-nvim

        nvim-treesitter.withAllGrammars

        lualine-nvim
        bufferline-nvim
        fidget-nvim
        noice-nvim
        nvim-tree-lua
        mini-icons

        tabout-nvim
        blink-pairs
        mini-surround

        telescope-nvim
        telescope-fzf-native-nvim

        nvim-colorizer-lua
        gitsigns-nvim
      ]
      ++ [auto-indent-nvim];
  };
  # lsps and runtime dependencies
  extraPackages = with pkgs; [
    tree-sitter
    git
    lazygit

    ripgrep
    fd
    findutils

    # nix
    nix-doc
    nixd
    nil
    alejandra
    statix

    # lua
    emmylua-ls
    stylua

    clang-tools

    bash-language-server
    dotenv-linter
    shfmt
    hadolint

    gopls
    gofumpt

    vscode-langservers-extracted
    vtsls
    svelte-language-server
    prettierd
    biome
    stylelint
    eslint_d

    rust-analyzer
    rustfmt

    ruff
    basedpyright
  ];
  settings.dont_link = true;
}
