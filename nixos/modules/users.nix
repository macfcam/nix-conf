{ ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marcelo = {
    isNormalUser = true;
    description = "Marcelo Alves";
    openssh = {
      authorizedKeys = {
        keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHhDDEDtMZlS6WijXJ4Fd9fH7i7e6Gd0IZGzIztC5cTE alvesmarcelocf@proton.me"
        ];
      };
    };
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
