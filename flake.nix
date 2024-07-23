{
  description = "rodrigorcz's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager= {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =  inputs @ { 
    self, 
    nixpkgs, 
    home-manager,
    hyprland, 
    ... 
  }: 
  let 
    inherit (self) outputs; 
  in{
    # sudo nixos-rebuild switch --flake ~/nix-config/.#nixos
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem{
          specialArgs = {inherit inputs outputs;};

          modules = [

            ./nixos/configuration.nix

            /*# Home manager as a NixOS module
            home-manager.nixosModules.home-manager{
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = false;
                extraSpecialArgs = {inherit inputs outputs;};
                users.rodrigo = import ./nixos/home.nix;
              };
            }*/

          ];
      };
    };

    # home-manager switch --flake ~/nix-config/.#rodrigo
    homeConfigurations = {
      rodrigo = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {inherit inputs outputs;};
        
          modules = [
            ./nixos/home.nix
            hyprland.homeManagerModules.default
          ];
      };
    };
  };
}
