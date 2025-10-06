{ config, pkgs, lib, ... }:

{
  home.username = "marcelo";
  home.homeDirectory = "/home/marcelo";
  home.stateVersion = "25.05";

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
    TG_DOWNLOAD_DIR = "$HOME/.terragrunt-cache";
    MOZ_ENABLE_WAYLAND = "1";
  };

  # Imports (split config here)
  imports = [
    ./modules/fish.nix
    ./modules/gnome.nix
    ./modules/neovim.nix
    ./modules/packages.nix
    ./modules/vscodium.nix
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
