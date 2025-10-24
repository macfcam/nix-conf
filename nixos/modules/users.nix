{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marcelo = {
    isNormalUser = true;
    description = "Marcelo Alves";
    extraGroups = [ 
      "networkmanager"
      "wheel"
      "docker"
      "libvirtd"
      "kvm"
      "video"
      "input"
      "render"
    ];
  };
}