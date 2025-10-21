{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    colorScheme = "dark";

    cursorTheme = {
      package = pkgs.whitesur-cursors;
      name = "WhiteSur-cursors";
    };
    
    font = {
      name = "Adwaita Sans";
      size = 10;
    };

    iconTheme = { 
      name = "Tela-dark";
      package = pkgs.tela-icon-theme;
    };

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=true
        gtk-decoration-layout=icon:minimize,maximize,close
        gtk-enable-animations=true
      '';
    };

    gtk3.extraCss = ''
      @import 'colors.css';
      VteTerminal, TerminalScreen, vte-terminal {
        padding: 20px 20px 20px 20px;
        -VteTerminal-inner-border: 20px 20px 20px 20px;
      }
    '';

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=true
        gtk-decoration-layout=icon:minimize,maximize,close
        gtk-enable-animations=true
      '';
    };
  };
}