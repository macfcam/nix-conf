{ pkgs, lib, inputs, ... }:

let
  # Import stable packages
  pkgsStable = import inputs.nixpkgs-stable {
    system = pkgs.system;
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
    resources
    spotify
    tela-icon-theme
    telegram-desktop
    terraform
    terragrunt
    virt-manager
    wget
    wl-clipboard
  ] ++ [
    # ✅ Pull this one from nixos-25.05 stable
    pkgsStable.teams-for-linux
  ];
}
