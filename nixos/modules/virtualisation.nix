{ config, pkgs, ... }:
{
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
      autoPrune.enable = true;
      daemon = {
        settings = {
          "experimental" = true;
        };
      };
    };

    libvirtd = {
      enable = true;
      qemu = {
        package = (
          pkgs.qemu_kvm.override {
            enableDocs = false;
            cephSupport = false;
          }
        );
        runAsRoot = true;
        swtpm.enable = true;
      };
    };
  };
}
