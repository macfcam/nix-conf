{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    arch-install-scripts
    aria2
    azure-cli
    cdrtools
    docker-compose
    eza
    git
    htop
    kitty
    kubectl
    kubectx
    mcfly
    neofetch
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
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "spotify" "terraform" ];
}
