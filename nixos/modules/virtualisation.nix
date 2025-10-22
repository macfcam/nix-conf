{ config, pkgs, ... }:
{
  virtualisation = {
    docker = { 
      enable = true;
    };
    libvirtd = {
      enable = true;
      qemu = {
        package = (pkgs.qemu_full.override {
          enableDocs = false;
          cephSupport = false;
        });
        runAsRoot = true;
        swtpm.enable = true;
      };
    };
  };
}