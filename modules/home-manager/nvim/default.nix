{ config, pkgs, lib, ... }: {

  imports = [
    ./options.nix
    ./syntaxes.nix
  ];

  home.sessionVariables.EDITOR = "nvim";

  programs.neovim.enable = true;
}