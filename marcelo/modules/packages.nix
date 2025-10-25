{ pkgs, lib, inputs, ... }:

let
  teams-for-linux-2_6_0 = pkgs.teams-for-linux.override {
    buildNpmPackage = args: pkgs.buildNpmPackage (args // rec {
      pname = "teams-for-linux";
      version = "2.6.0";

      src = pkgs.fetchFromGitHub {
        owner = "IsmaelMartinez";
        repo = "teams-for-linux";
        tag = "v${version}";
        hash = "sha256-J7BrJelckGQxbQ1o4WrF9Kdv9nr+N8LWlv4FvDsEu5E=";
      };

      npmDepsHash = "sha256-WdQbUkOXPOAgk8rr88NpCdX+2z6l0wJRqIK+O8IkqYE=";
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
    nixd
    oci-cli
    pciutils
    pyenv
    quickemu
    remmina
    resources
    spotify
    telegram-desktop
    terraform
    terragrunt
    velero
    virt-manager
    wget
    wl-clipboard
  ] ++ [
    teams-for-linux-2_6_0
  ];
}
