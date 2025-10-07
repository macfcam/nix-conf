# Marcelo's NixOS config

This is my personal Nix config. You can copy from it, but it's not intended for wholesale use (unless you also want to be `marcelo@starscream`)

Structure:

```
├── marcelo
│   ├── modules
│   │   ├── fish.nix
│   │   ├── fonts.nix
│   │   ├── gnome.nix
│   │   ├── neovim.nix
│   │   ├── packages.nix
│   │   ├── proxychains.nix
│   │   ├── ssh.nix
│   │   └── vscodium.nix
│   └── home.nix
├── nixos
│   ├── configuration.nix
│   └── hardware-configuration.nix
├── pkgs
│   └── lens.nix
├── flake.lock
├── flake.nix
└── README.md
```

Rebuild:

```sh
sudo nixos-rebuild switch -L --flake .#starscream
```