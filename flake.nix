{
  description = "NixOS Configuration for QEMU Research";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = github:nix-community/home-manager/release-24.11;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      nixos-intel-research = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         inherit inputs;
         modules = [
          ./nixos/configuration.nix
          ./hosts/term/intel-research.nix
          ./modules/global/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              users.user = ./hosts/term/home-manager/research.nix;
            };
          }
        ];
      };
    };
  };
}
