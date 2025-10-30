{ pkgs, ... }:

{
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
}
