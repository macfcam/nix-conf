{
  pkgs,
  ...
}:

let
  spotify-x11 = pkgs.symlinkJoin {
    name = "spotify-x11";
    paths = [ pkgs.spotify ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/spotify \
        --unset WAYLAND_DISPLAY \
        --set NIXOS_OZONE_WL "0"
    '';
  };
in

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
    nixfmt
    nvd
    pciutils
    pyenv
    remmina
    resources
    sops
    ssh-to-age
    teams-for-linux
    telegram-desktop
    terraform
    terragrunt
    virt-manager
    vlc
    wget
    wl-clipboard

    spotify-x11
  ];
}
