{ ... }:

{
  programs.alacritty = {
    enable = true;
    theme = "catppuccin_mocha";
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      window = {
        dimensions = {
          columns = 150;
          lines = 50;
        };
        padding = {
          x = 20;
          y = 20;
        };
        dynamic_padding = true;
        startup_mode = "Windowed";
        resize_increments = true;
      };
      scrolling = {
        history = 0;
      };
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Bold Italic";
        };
        size = 10;
      };
      cursor = {
        style = {
          shape = "Block";
          blinking = "Off";
        };
      };
      terminal = {
        shell = "/etc/profiles/per-user/marcelo/bin/fish";
      };
      keyboard = {
        bindings = [
          {
            key = "N";
            mods = "Control|Shift";
            action = "CreateNewWindow";
          }
        ];
      };
    };
  };
}
