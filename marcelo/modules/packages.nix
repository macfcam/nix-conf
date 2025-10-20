{ pkgs, lib, inputs, ... }:

let
  # Import stable packages
  pkgsStable = import inputs.nixpkgs-stable {
    system = pkgs.system;
  };

  teams-for-linux-2_2_1 = pkgsStable.teams-for-linux.override {
    buildNpmPackage = args: pkgsStable.buildNpmPackage (args // rec {
      pname = "teams-for-linux";
      version = "2.2.1";

      src = pkgs.fetchFromGitHub {
        owner = "IsmaelMartinez";
        repo = "teams-for-linux";
        tag = "v${version}";
        hash = "sha256-iyfBmJ+AFAeM+1x8n8/lnmpoWTwP58f+WVDUfLbvHbE=";
      };

      npmDepsHash = "sha256-XZ/TLGMfF0r+NkjdLrJzeCdlX9glJAE19q8O2zXJuZQ=";
    });
  };

in {
  home.packages = with pkgs; [
    ansible
    arch-install-scripts
    aria2
    azure-cli
    chromium
    cdrtools
    docker-compose
    eza
    git
    htop
    jq
    kind
    kitty
    kubectl
    kubectx
    kubernetes-helm
    libxslt
    mcfly
    neofetch
    oci-cli
    pciutils
    pyenv
    quickemu
    resources
    spotify
    telegram-desktop
    terraform
    terragrunt
    virt-manager
    wget
    wl-clipboard
  ] ++ [
    teams-for-linux-2_2_1
  ];
}
