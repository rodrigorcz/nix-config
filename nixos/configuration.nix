# General configurations of NixOS

{inputs, lib, config, pkgs, ... }:{
  # Imports
  imports = [
    ./hardware-configuration.nix
  ];

  # Boot
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # Networking
  networking = {
    hostName = "nixos";
    networkmanager.enable = true; # nmcli device wifi connect <SSID> password <PASS>
  };

  # Time Zone
  time.timeZone = "America/Sao_Paulo";

  # Internationalisation properties
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };
  };

  # Console keymap
  console.keyMap = "br-abnt2";

  # Enable the X11 windowing system and KDE Plasma Desktop Environment
  services = {
    xserver = {
      enable = true;
      desktopManager.plasma5.enable = true;
      displayManager.sddm.enable = true;
      xkb = {
        layout = "br";
        variant = "";
      };
    };

    # Enable Bluetooth
    blueman.enable = true;

    # Enable CUPS to print documents
    printing.enable = true;

    # Enable sound with PipeWire
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };

    # Touchpad support
    libinput.enable = true;

    # OpenSSH daemon
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };
  };

  # Hardware settings
  hardware = {
    bluetooth.enable = true;
    opengl.enable = true;
    nvidia.modesetting.enable = true;
    pulseaudio.enable = false;
  };

  # Security settings
  security.rtkit.enable = true;

  # User account
  users.users.rodrigo = {
    isNormalUser = true;
    home = "/home/rodrigo";
    description = "rodrigo";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable experimental features (Flakes)
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Basic packages
  programs = {
    firefox.enable = true;
    hyprland.enable = true;
    git.enable = true;
    steam.enable = true;
  };

  # Additional system packages
  environment.systemPackages = with pkgs; [
    zsh
    neovim
    home-manager
  ];

  # Environment variables
  environment.variables.EDITOR = "nvim";

  # XDG portal settings
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
