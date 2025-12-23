{
  description = "Starscream NixOS setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    # Specific nixpkgs commit for terragrunt 0.94.0
    nixpkgs-terragrunt.url = "github:nixos/nixpkgs/be91b74c827a7bff321456295cd1b5a6516f99a4";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-terragrunt,
      home-manager,
      sops-nix,
      ...
    }:
    {
      nixosConfigurations = {
        starscream = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./nixos/configuration.nix
            sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.marcelo = import ./marcelo/home.nix;
                extraSpecialArgs = {
                  inherit inputs;
                  pkgs-terragrunt = import nixpkgs-terragrunt {
                    system = "x86_64-linux";
                    config.allowUnfree = true;
                  };
                };
                sharedModules = [
                  sops-nix.homeManagerModules.sops
                ];
              };
            }
          ];
        };
      };
    };
}
