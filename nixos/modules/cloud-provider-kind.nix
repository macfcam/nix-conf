{ pkgs, ... }:

{
  systemd.services.cloud-provider-kind = {
    description = "Cloud provider for kind clusters (LoadBalancer support)";
    after = [
      "network.target"
      "docker.service"
    ];
    requires = [ "docker.service" ];

    serviceConfig = {
      ExecStart = "${pkgs.cloud-provider-kind}/bin/cloud-provider-kind --gateway-channel disabled";
      Restart = "on-failure";
      RestartSec = 5;
    };
  };
}
