# nixos/modules/fonts.nix
{ config, pkgs, ... }:

let
  nf = pkgs.nerd-fonts;
in

{
  # Install fonts system-wide
  fonts.packages = with pkgs; with nf; [
    dejavu_fonts
    liberation_ttf
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji

    # nerd fonts
    code-new-roman
    commit-mono
    fantasque-sans-mono
    jetbrains-mono
  ];

  # Set default font families for the entire system
  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Noto Serif" "DejaVu Serif" ];
        sansSerif = [ "Noto Sans" "DejaVu Sans" ];
        monospace = [ "Noto Sans Mono" "DejaVu Sans Mono" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}