{ config, lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "Bluetooth-Battery-Meter@maniacx.github.com"
        "blur-my-shell@aunetx"
        "clipboard-indicator@tudmotu.com"
        "dash-to-dock@micxgx.gmail.com"
        "monitor@astraext.github.io"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };
    
    # Gnome Terminal
    "org/gnome/terminal/legacy" = {
      default-show-menubar = false;
      schema-version = 3;
      theme-variant = "default";
    };

    "org/gnome/terminal/legacy/profiles:" = {
      default = "95894cfd-82f7-430d-af6e-84d168bc34f5";
      list = [ "95894cfd-82f7-430d-af6e-84d168bc34f5" ];
    };

    "org/gnome/terminal/legacy/profiles:/:95894cfd-82f7-430d-af6e-84d168bc34f5" = {
      audible-bell = true;
      background-color = "#1e1e2e";
      backspace-binding = "ascii-delete";
      bold-color-same-as-fg = true;
      cursor-blink-mode = "off";
      cursor-colors-set = false;
      cursor-shape = "block";
      custom-command = "fish";
      default-size-columns = 130;
      default-size-rows = 40;
      delete-binding = "delete-sequence";
      font = "JetBrainsMono Nerd Font Mono 11";
      foreground-color = "#cdd6f4";
      highlight-colors-set = false;
      login-shell = false;
      palette = [ 
        "#45475a"
        "#f38ba8"
        "#a6e3a1"
        "#f9e2af"
        "#89b4fa"
        "#f5c2e7"
        "#94e2d5"
        "#a6adc8"
        "#585b70"
        "#f37799"
        "#89d88b"
        "#ebd391"
        "#74a8fc"
        "#f2aede"
        "#6bd7ca"
        "#bac2de" 
      ];
      scroll-on-output = true;
      scrollback-lines = 10000;
      scrollback-unlimited = true;
      scrollbar-policy = "never";
      use-custom-command = true;
      use-system-font = false;
      use-theme-colors = false;
      visible-name = "Catppuccin Mocha";
    };
    
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      document-font-name = "Sans 10";
      font-antialiasing = "rgba";
      font-hinting = "full";
      font-name = "Adwaita Sans 10";
      gtk-theme = "adw-gtk3-dark";
      icon-theme = "Tela-dark";
      monospace-font-name = "Adwaita Mono 10";
    };
    
    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us+alt-intl" ]) ];
      xkb-options = [ "lv3:switch" ]; # Make right ctrl alternate characters key
    };
    
    "org/gnome/desktop/peripherals/keyboard" = {
      delay = lib.hm.gvariant.mkUint32 300;
      repeat-interval = lib.hm.gvariant.mkUint32 20;
    };
    
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "default";
      speed = -0.5;
    };
    
    "org/gnome/desktop/wm/keybindings" = {
      move-to-workspace-up = [ "<Super><Shift>Page_Up" ];
      move-to-workspace-down = [ "<Super><Shift>Page_Down" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
      sleep-inactive-ac-timeout = 0;
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "nothing";
    };
    
    "org/gnome/mutter" = {
      experimental-features = [
        "scale-monitor-framebuffer"
        "variable-refresh-rate"
        "xwayland-native-scaling"
      ];
    };
  };
}
