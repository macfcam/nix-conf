{ pkgs, lib, ... }:

{
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
    kitty
    kubectl
    kubectx
    kubernetes-helm
    mcfly
    neofetch
    oci-cli
    pciutils
    pyenv
    resources
    spotify
    teams-for-linux
    tela-icon-theme
    telegram-desktop
    terraform
    terragrunt
    virt-manager
    wget
    wl-clipboard
  ];
}
