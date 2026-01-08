{ lib, ... }:

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

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      document-font-name = "IBM Plex Serif 11";
      font-antialiasing = "rgba";
      font-hinting = "full";
      font-name = "IBM Plex Sans 11";
      gtk-theme = "adw-gtk3-dark";
      icon-theme = "Papirus-Dark";
      monospace-font-name = "IBM Plex Mono 11";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [
        (mkTuple [
          "xkb"
          "us+alt-intl"
        ])
      ];
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

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-from = "18.0";
      night-light-schedule-to = "06.0";
      night-light-temperature = lib.hm.gvariant.mkUint32 4700;
    };
  };
}
