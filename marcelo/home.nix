{ config, pkgs, lib, inputs, ... }:

let
  # Import Lens package from flake root (pkgs/lens.nix)
  lens = import (inputs.self + "/pkgs/lens.nix") { inherit pkgs; };
in
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

  imports = [
    ./modules/fish.nix
    ./modules/gnome.nix
    ./modules/kitty.nix
    ./modules/neovim.nix
    ./modules/packages.nix
    ./modules/proxychains.nix
    ./modules/ssh.nix
    ./modules/vscodium.nix
  ];

  home.packages = [
    lens
  ];

  programs.home-manager.enable = true;
}
