{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      lua-language-server
      stylua
      ripgrep
      gcc
    ];
  };
}
