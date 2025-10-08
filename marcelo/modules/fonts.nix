{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    dejavu_fonts
    liberation_ttf
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  fonts.fontconfig.enable = true;
}
