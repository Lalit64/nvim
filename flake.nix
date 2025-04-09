{
  description = "TinyVim + nixCats";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };
  };

  # see :help nixCats.flake.outputs
  outputs =
    {
      # self,
      nixpkgs,
      nixCats,
      ...
    }@inputs:
    let
      inherit (nixCats) utils;
      luaPath = "${./.}";
      forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;
      extra_pkg_config = {
        # allowUnfree = true;
      };
      dependencyOverlays = # (import ./overlays inputs) ++
        [
          (utils.standardPluginOverlay inputs)
        ];

      categoryDefinitions =
        {
          pkgs,
          # settings,
          # categories,
          # extra,
          # name,
          # mkNvimPlugin,
          ...
        }:
        {
          lspsAndRuntimeDeps = {
            general = with pkgs; [
              nixd
              nix-doc
              stdenv.cc.cc
              typescript-language-server
              vtsls
              lua-language-server
              svelte-language-server
              astro-language-server
              stylua
              ripgrep
              rust-analyzer
              vscode-langservers-extracted
              cmake-language-server
              emmet-language-server
              gopls
            ];
          };

          startupPlugins = {
            # gitPlugins = with pkgs.neovimPlugins; [ ];
            general = with pkgs.vimPlugins; [
              lazy-nvim
              which-key-nvim
              bufferline-nvim
              {
                name = "catppuccin";
                plugin = catppuccin-nvim;
              }
              (nvim-treesitter.withPlugins (_: nvim-treesitter.allGrammars))
              comment-nvim
              nvim-tree-lua
              conform-nvim
              friendly-snippets
              gitsigns-nvim
              lazydev-nvim
              lualine-nvim
              mini-surround
              mini-pairs
              mini-icons
              noice-nvim
              nui-nvim
              nvim-notify
              {
                name = "LuaSnip";
                plugin = luasnip;
              }
              mason-nvim
              blink-cmp
              nvim-lspconfig
              markdown-preview-nvim
              {
                name = "lspkind";
                plugin = lspkind-nvim;
              }
              flash-nvim
              plenary-nvim
              snacks-nvim
              telescope-nvim
              telescope-ui-select-nvim
            ];
          };

          # optionalPlugins = {
          #   gitPlugins = with pkgs.neovimPlugins; [ ];
          #   general = with pkgs.vimPlugins; [ ];
          # };
          #
          # sharedLibraries = {
          #   general = with pkgs; [
          #     # libgit2
          #   ];
          # };

          environmentVariables = {
            test = {
              CATTESTVAR = "It worked!";
            };
          };

          extraWrapperArgs = {
            test = [
              ''--set CATTESTVAR2 "It worked again!"''
            ];
          };

          extraPython3Packages = {
            test = (_: [ ]);
          };
          extraLuaPackages = {
            test = [ (_: [ ]) ];
          };
        };

      packageDefinitions = {
        nvim =
          { pkgs, ... }:
          {
            settings = {
              wrapRc = true;
              aliases = [ "vim" ];
              neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
            };
            categories = {
              general = true;
              gitPlugins = true;
              customPlugins = true;
              test = true;
              example = {
                youCan = "add more than just booleans";
                toThisSet = [
                  "and the contents of this categories set"
                  "will be accessible to your lua with"
                  "nixCats('path.to.value')"
                  "see :help nixCats"
                ];
              };
            };
          };
      };
      defaultPackageName = "nvim";
    in

    forEachSystem (
      system:
      let
        nixCatsBuilder = utils.baseBuilder luaPath {
          inherit
            nixpkgs
            system
            dependencyOverlays
            extra_pkg_config
            ;
        } categoryDefinitions packageDefinitions;
        defaultPackage = nixCatsBuilder defaultPackageName;
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages = utils.mkAllWithDefault defaultPackage;

        devShells = {
          default = pkgs.mkShell {
            name = defaultPackageName;
            packages = [ defaultPackage ];
            inputsFrom = [ ];
            shellHook = '''';
          };
        };

      }
    )
    // (
      let
        nixosModule = utils.mkNixosModules {
          moduleNamespace = [ defaultPackageName ];
          inherit
            defaultPackageName
            dependencyOverlays
            luaPath
            categoryDefinitions
            packageDefinitions
            extra_pkg_config
            nixpkgs
            ;
        };
        homeModule = utils.mkHomeModules {
          moduleNamespace = [ defaultPackageName ];
          inherit
            defaultPackageName
            dependencyOverlays
            luaPath
            categoryDefinitions
            packageDefinitions
            extra_pkg_config
            nixpkgs
            ;
        };
      in
      {
        overlays = utils.makeOverlays luaPath {
          inherit nixpkgs dependencyOverlays extra_pkg_config;
        } categoryDefinitions packageDefinitions defaultPackageName;

        nixosModules.default = nixosModule;
        homeModules.default = homeModule;

        inherit utils nixosModule homeModule;
        inherit (utils) templates;
      }
    );
}
