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
    gnome-tweaks
    gnome-shell-extensions
    gnome-extension-manager
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