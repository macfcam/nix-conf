# Marcelo's NixOS config

This is my personal Nix config. You can copy from it, but it's not intended for wholesale use (unless you also want to be `marcelo@starscream`)

Structure:

```
.
├── marcelo
│   ├── modules
│   │   ├── alacritty.nix
│   │   ├── bash.nix
│   │   ├── dconf.nix
│   │   ├── fish.nix
│   │   ├── git.nix
│   │   ├── gnome.nix
│   │   ├── gtk.nix
│   │   ├── neovim.nix
│   │   ├── packages.nix
│   │   ├── secrets.nix
│   │   ├── ssh.nix
│   │   ├── starship.nix
│   │   ├── tmux.nix
│   │   ├── vscodium.nix
│   │   └── zeditor.nix
│   └── home.nix
├── nixos
│   ├── modules
│   │   ├── boot.nix
│   │   ├── fonts.nix
│   │   ├── hardware.nix
│   │   ├── networking.nix
│   │   ├── packages.nix
│   │   ├── secrets.nix
│   │   ├── services.nix
│   │   ├── system.nix
│   │   ├── users.nix
│   │   └── virtualisation.nix
│   ├── configuration.nix
│   └── hardware-configuration.nix
├── pkgs
│   └── lens.nix
├── secrets
│   └── marcelo.yaml
├── .gitignore
├── .sops.yaml
├── flake.lock
├── flake.nix
└── README.md
```

Rebuild:

```sh
sudo nixos-rebuild switch -L --flake .#starscream
```
