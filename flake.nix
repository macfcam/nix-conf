{
  description = "Starscream NixOS setup";

  inputs = {
    # fix virt-secret-init-encryption
    nixpkgs.url = "github:nixos/nixpkgs/1a0fccf8299acc1a36f7154efd13f6d005533d09";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    arion = {
      url = "github:hercules-ci/arion";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      arion,
      lanzaboote,
      nixpkgs,
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
            arion.nixosModules.arion
            lanzaboote.nixosModules.lanzaboote
            sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.marcelo = import ./marcelo/home.nix;
                extraSpecialArgs = {
                  inherit inputs;
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
