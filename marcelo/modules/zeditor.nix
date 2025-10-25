{ config, pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "catppuccin"
      "catppuccin-icons"
      "dockerfile"
      "docker-compose"
      "git-firefly"
      "nix"
      "python-snippets"
      "terraform"
      "toml"
    ];

    userSettings = {
      theme = {
        mode = "system";
        dark = "Catppuccin Mocha";
        light = "Catppuccin Latte";
      };

      auto_update = false;

      terminal = {
        alternate_scroll = "off";
        blinking = "off";
        copy_on_select = false;
        dock = "bottom";
        env = {
          TERM = "alacritty";
        };
        font_family = "JetBrainsMono Nerd Font Mono";
        font_size = 12;
        shell = {
          program = "fish";
        };
      };

      ui_font_size = 16;
      buffer_font_size = 12;
      buffer_font_family = "JetBrainsMono Nerd Font Mono";
    };
  };
}
