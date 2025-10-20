{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.astra-monitor
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.dash-to-dock
    gnome-extension-manager
    gnome-shell-extensions
    gnome-terminal
    gnome-tweaks
    nautilus
    resources
  ];

  imports = [ 
    ./dconf.nix
  ];
}