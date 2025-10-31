{
  pkgs,
  inputs,
  ...
}:

let
  # Import config
  cfg = import ./config.nix;

  # Import packages from flake root
  lens = import (inputs.self + "/pkgs/lens.nix") { inherit pkgs cfg; };
  teams-for-linux = import (inputs.self + "/pkgs/teams-for-linux.nix") { inherit pkgs; };
in
{
  home.username = "marcelo";
  home.homeDirectory = "/home/marcelo";
  home.stateVersion = "25.05";
  home.sessionVariables = {
    ANSIBLE_SSH_ARGS = "-o ControlMaster=no";
    EDITOR = "nvim";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    TG_DOWNLOAD_DIR = "$HOME/.terragrunt-cache";
  };

  imports = [
    ./modules/alacritty.nix
    ./modules/fish.nix
    ./modules/git.nix
    ./modules/gnome.nix
    ./modules/gtk.nix
    ./modules/neovim.nix
    ./modules/packages.nix
    ./modules/proxychains.nix
    ./modules/secrets.nix
    ./modules/ssh.nix
    ./modules/tmux.nix
    ./modules/vscodium.nix
    ./modules/zeditor.nix
  ];

  home.packages = [
    lens
    teams-for-linux
  ];

  programs.home-manager.enable = true;
}
