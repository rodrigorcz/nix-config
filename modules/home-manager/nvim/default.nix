{ config, pkgs, lib, ... }: {

  imports = [
    ./options.nix
    ./syntaxes.nix
  ];

  home.sessionVariables.EDITOR = "nvim";

  programs.neovim.extraConfig = ''source /nix/store/s51phsqs2cl6x6kqichg37gww2xfmhyy-nvim-init-home-manager.vim'';
  programs.neovim.enable = true;
}