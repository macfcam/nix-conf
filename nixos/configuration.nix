# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Font config
      ./modules/fonts.nix

      # Network config
      ./modules/networking.nix

      # Virtualization config
      ./modules/virtualisation.nix
    ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Boot related settings
  boot = {
    kernelParams = [ "quiet" ];
    # Using linux-zen kernel
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      # Use systemd-boot EFI boot loader
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    # Load kernel modules on boot.
    initrd.kernelModules = [
      "amdgpu"
    ];
    # Blacklist kernel modules at boot
    blacklistedKernelModules = [
      "asus_wmi"
      "eeepc_wmi"
    ];
    tmp.useTmpfs = true;
  };

  # Hardware related settings
  hardware = {
    enableAllFirmware = true;
    cpu.amd.updateMicrocode = true;       # Enable AMD microcode updates

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    graphics = {
      enable = true;
      extraPackages = with pkgs; [ mesa libglvnd ];
    };
  };

  # Nixpkgs related settings
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
 
  # System services related settings
  services = {
    # Enable OpenSSH daemon
    openssh.enable = true;

    # Enable power-profiles-daemon service
    power-profiles-daemon.enable = true;

    # Disable X11
    xserver.enable = false;

    # Install GNOME
    desktopManager.gnome.enable = true;
    displayManager.gdm = {
      enable = true;
      autoSuspend = false;
    };

    # Disable CUPS
    printing.enable = false;

    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;

      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };

  # Exclude unnecessary GNOME packages
  environment.gnome.excludePackages = with pkgs; [ 
    decibels
    epiphany
    geary
    gnome-console
    gnome-contacts
    gnome-logs
    gnome-maps
    gnome-music
    gnome-terminal
    gnome-tour
    gnome-user-docs
    gnome-user-share
    simple-scan
    totem
    yelp
  ];

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Locale related settings
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # Configure console keymap
  console.keyMap = "us";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marcelo = {
    isNormalUser = true;
    description = "Marcelo Alves";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" "kvm" "video" "input" "render" ];
  };

  # Install some packages
  programs = {
    firefox.enable = true;
    virt-manager.enable = true;

    # Run unpatched dynamic binaries
    nix-ld.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [    
    dnsmasq
    power-profiles-daemon
    spice-gtk
    spice-protocol
    virglrenderer
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

}
