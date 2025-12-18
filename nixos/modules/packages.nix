{ pkgs, ... }:

{
  # Exclude unnecessary GNOME packages
  environment.gnome.excludePackages = with pkgs; [
    decibels
    epiphany
    geary
    gnome-connections
    gnome-console
    gnome-contacts
    gnome-logs
    gnome-maps
    gnome-music
    gnome-terminal
    gnome-tour
    gnome-user-docs
    gnome-user-share
    showtime
    simple-scan
    totem
    yelp
  ];

  # Packages installed at system level
  environment.systemPackages = with pkgs; [
    dnsmasq
    power-profiles-daemon
    spice-gtk
    spice-protocol
    virglrenderer
  ];

  # Install some packages
  programs = {
    firefox.enable = true;
    virt-manager.enable = true;

    # Run unpatched dynamic binaries
    nix-ld.enable = true;
  };
}
