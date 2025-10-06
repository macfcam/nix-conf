{ config, pkgs, ... }:

let
  netskopePkgs = import pkgs.path {
    inherit (pkgs) system;
    config = {
      permittedInsecurePackages = [ "libsoup-2.74.3" ];
    };
  };
  
  netskope = pkgs.callPackage ../pkgs/netskope.nix { };
in
{
  environment.systemPackages = [ netskope ];

  systemd.services.stagentd = {
    description = "Netskope Agent Service (daemon)";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${netskope}/bin/nswrapper -e stAgentSvc";
      Restart = "always";
    };
  };

  systemd.user.services.stagentapp = {
    description = "Netskope Agent App (UI)";
    wantedBy = [ "default.target" ];
    serviceConfig = {
      ExecStart = "${netskope}/bin/nswrapper -e stAgentApp";
      Restart = "on-failure";
    };
  };
}
