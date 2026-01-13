{ pkgs, ... }:

{
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
