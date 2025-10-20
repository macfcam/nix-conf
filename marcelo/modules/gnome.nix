{ config, pkgs, lib, ... }:
  with lib.hm.gvariant;
{
  home.packages = with pkgs; [
    adw-gtk3
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
      cursor-blink-mode = "system";
      cursor-colors-set = false;
      cursor-shape = "block";
      custom-command = "fish";
      default-size-columns = 130;
      default-size-rows = 40;
      delete-binding = "delete-sequence";
      font = "FantasqueSansM Nerd Font Mono 12";
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

    # Dash to Dock settings - not working at this moment
    # "org/gnome/shell/extensions/dash-to-dock" = {
    #   activate-single-window = true;
    #   always-center-icons = false;
    #   animation-time = 0.2;
    #   app-ctrl-hotkey-1 = [ "<Ctrl><Super>1" ];
    #   app-ctrl-hotkey-2 = [ "<Ctrl><Super>2" ];
    #   app-hotkey-1 = [ "<Super>1" ];
    #   app-hotkey-2 = [ "<Super>2" ];
    #   app-shift-hotkey-1 = [ "<Shift><Super>1" ];
    #   app-shift-hotkey-2 = [ "<Shift><Super>2" ];
    #   application-counter-overrides-notifications = true;
    #   autohide = true;
    #   autohide-in-fullscreen = false;
    #   background-color = "#ffffff";
    #   background-opacity = 0.8;
    #   click-action = "cycle-windows";
    #   dash-max-icon-size = 48;
    #   dock-fixed = false;
    #   dock-position = "BOTTOM";
    #   intellihide = true;
    #   intellihide-mode = "ALL_WINDOWS";
    #   isolate-locations = true;
    #   show-favorites = true;
    #   show-trash = true;
    #   show-running = true;
    #   transparency-mode = "DEFAULT";
    #   workspace-agnostic-urgent-windows = true;
    # };
    
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      document-font-name = "Noto Sans 10";
      font-antialiasing = "rgba";
      font-hinting = "full";
      font-name = "Noto Sans 10";
      gtk-theme = "adw-gtk3-dark";
      icon-theme = "Tela-dark";
      monospace-font-name = "Noto Sans Mono 10";
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