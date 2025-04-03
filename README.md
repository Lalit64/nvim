# TinyVim + nixCats
- Minimal neovim config using TinyVim as the base and nixCats for nix and home-manager integration
- This also contains some of my personal tweaks

![screenshot](https://files.catbox.moe/og74qg.png)

# Install
- This is not meant to be used without nix, but I am pretty sure it works ok.

1. In your `flake.nix`
```nix
{
    inputs = {
        neovim.url = "git+ssh://git@github.com/lalit64/nvim.git";
        neovim.inputs.nixpkgs.follows = "nixpkgs";
    }
}
```
2. Use the home-manager module by including it in the imports like this:
```nix
imports = [
    inputs.neovim.homeModules.default
    { neovim.enable = true }
];
```
Make sure you don't have neovim or vim installed
