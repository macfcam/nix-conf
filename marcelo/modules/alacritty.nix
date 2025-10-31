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
          columns = 130;
          lines = 40;
        };
        padding = {
          x = 15;
          y = 15;
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
        size = 12;
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
    };
  };
}
