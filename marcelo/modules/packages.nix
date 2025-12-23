{
  pkgs,
  pkgs-terragrunt,
  ...
}:

{
  home.packages = with pkgs; [
    age
    ansible
    arch-install-scripts
    aria2
    bisq2
    chromium
    cdrtools
    docker-compose
    eza
    git
    htop
    jq
    libxslt
    mcfly
    neofetch
    nil
    nixd
    pciutils
    pyenv
    remmina
    resources
    sops
    ssh-to-age
    teams-for-linux
    telegram-desktop
    terraform
    virt-manager
    wget
    wl-clipboard
  ] ++ [
    # Use terragrunt 0.94.0 from specific nixpkgs commit
    pkgs-terragrunt.terragrunt
  ];
}
