{ config, pkgs, ... }:

let
  nf = pkgs.nerd-fonts;
in

{
  home.packages = with pkgs; with nf;[
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

  fonts.fontconfig.enable = true;
}
