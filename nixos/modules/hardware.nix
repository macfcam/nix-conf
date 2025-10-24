{ config, pkgs, ... }:

{
  # Hardware related settings
  hardware = {
    enableAllFirmware = true;
    cpu.amd.updateMicrocode = true;       # Enable AMD microcode updates

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    graphics = {
      enable = true;
      extraPackages = with pkgs; [ mesa libglvnd ];
    };
  };

  # Nixpkgs related settings
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}