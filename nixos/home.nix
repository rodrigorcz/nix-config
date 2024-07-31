# Home Manager configuration

{ inputs, lib, config, pkgs, ... }:{

  imports = [ 
    ../modules/home-manager
  ];
  
  home = {
    username = "rodrigo";
    homeDirectory = "/home/rodrigo";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "xterm-kitty";
    BROWSER = "firefox";
  };
  
  # Packages
  home.packages = with pkgs; [ 

    # Softwares
    steam
    spotify  
    stellarium
    gimp

    # Utilities
    lua
    wget
    zip
    unzip
    kitty
    feh
    vscode 
    just
    git
    vim 
    lf
    nix-zsh-completions
    zsh-completions
    tmux
    htop
    wev

    # System Tools 
    libreoffice
    waybar
    hyprshot
    swww
    rofi-wayland
    playerctl
    gobject-introspection
    gtk3
    pavucontrol
    pamixer
    brightnessctl
    alsa-utils

    # Browsers
    firefox
    brave
    google-chrome

    discord
    discord-ptb
    discord-canary

    # Rust
    rustc
    rustfmt
    cargo
    cargo-watch

    # Python
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.pandas
      python-pkgs.numpy
      python-pkgs.matplotlib
      python-pkgs.pyside6
      python-pkgs.pygobject3
    ]))

    # C/C++
    gdb
    valgrind
    cmake

    # Web Develop
    nodejs
    nodePackages.npm
    nodePackages.yarn
    nodePackages.typescript
    nodePackages.eslint

    # Fonts
    cantarell-fonts
    font-awesome
    iosevka
    nerdfonts
  ];

  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11"; 
}
