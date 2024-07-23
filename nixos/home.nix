# Home Manager configuration

{ inputs, lib, config, pkgs, ... }:{

  imports = [ 
    ../modules/home-manager
  ];
  
  
  home = {
    username = "rodrigo";
    homeDirectory = "/home/rodrigo";
  };

  # Packages
  home.packages = with pkgs; [ 
    firefox
    steam
    git
    vim 
    lf
    spotify
    wget
    zip
    unzip
    kitty
    feh
    google-chrome
    vscode   
    lua
    stellarium
    just
    gimp
    libreoffice
    waybar
    dunst
    swww
    rofi-wayland
    playerctl
    gobject-introspection
    gtk3
    pavucontrol
    pamixer
    brightnessctl
    alsa-utils
    discord
    discord-ptb
    discord-canary

    # Rust
    rustc
    cargo
    cargo-watch
    rustfmt

    # Python
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.pandas
      python-pkgs.numpy
      python-pkgs.matplotlib
      python-pkgs.seaborn
      python-pkgs.pyside6
      python-pkgs.pygobject3
    ]))

    # Web Develop
    nodejs
    nodePackages.npm
    nodePackages.yarn
    nodePackages.typescript
    nodePackages.eslint

    # Fonts
    cantarell-fonts
    font-awesome
    fira-code
    nerdfonts
  ];

  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11"; 
}
