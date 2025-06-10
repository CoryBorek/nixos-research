{
  description = "Cory's Nix Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = github:nix-community/home-manager/release-24.11;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    x86_64 = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      nixos-intel-research = nixpkgs.lib.nixosSystem {
        inherit x86_64;
         modules = [
          ./nixos/configuration.nix
          ./hosts/desktop/intel-research.nix
          ./modules/global/desktop-plasma.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              users.user = ./hosts/desktop/home-manager/research.nix;
            };
          }
        ];
      };
    };
  };
}
