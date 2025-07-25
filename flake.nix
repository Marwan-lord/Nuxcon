{
  description = "A simple flake for a simple use case";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      ...
    }@inputs:
    let
      inherit (self) outputs;
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/laptop/configuration.nix
          stylix.nixosModules.stylix
        ];
      };

      homeConfigurations.marwan = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          stylix.homeModules.stylix
          ./home.nix
          ./modules/home/stylix.nix
        ];
      };
    };
}
