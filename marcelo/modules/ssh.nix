{ config, pkgs, ... }:

{ 
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        userKnownHostsFile = "~/.ssh/known_hosts";
        identitiesOnly = true;
      };
      "10.208.*.* 10.206.*.* 172.25.*.* 10.34.*.* 10.100.*.*" = {
        proxyCommand = "nc -X 5 -x 192.168.122.100:1080 %h %p";
      };
      "openwrt-r4s" = {
        user = "root";
        hostname = "192.168.100.1";
        identityFile = "~/.ssh/id_ed25519";
      };
      "ssh.dev.azure.com" = {
        identityFile = "~/.ssh/id_rsa_marcelo_filho";
        identitiesOnly = true;
        extraOptions = {
          HostkeyAlgorithms = "+ssh-rsa";
        };
      };
      "gitlab-corp-hml.lojasrenner.io" = {
        user = "git";
        hostname = "gitlab-corp-hml.lojasrenner.io";
        identityFile = "~/.ssh/id_ed25519_marcelo_filho";
        proxyCommand = "nc -X 5 -x 192.168.122.100:1080 %h %p";
        extraOptions = {
          PreferredAuthentications = "publickey";
        };
      };
      "gitlab-corp.lojasrenner.io" = {
        user = "git";
        hostname = "gitlab-corp.lojasrenner.io";
        identityFile = "~/.ssh/id_ed25519_marcelo_filho";
        proxyCommand = "nc -X 5 -x 192.168.122.100:1080 %h %p";
        extraOptions = {
          PreferredAuthentications = "publickey";
        };
      };
      "gitlab.lojasrenner.com.br" = {
        user = "git";
        hostname = "gitlab.lojasrenner.com.br";
        identityFile = "~/.ssh/id_ed25519_marcelo_filho";
        proxyCommand = "nc -X 5 -x 192.168.122.100:1080 %h %p";
        extraOptions = {
          PreferredAuthentications = "publickey";
        };
      };
      "adminserver-rnr-prd" = {
        user = "opc";
        hostname = "10.206.64.145";
        identityFile = "~/.ssh/oci_rsa_resource";
      };
      "adminserver-cam-prd" = {
        user = "opc";
        hostname = "10.206.68.135";
        identityFile = "~/.ssh/oci_rsa_resource";
      };
      "bastion-atg4" = {
        user = "opc";
        hostname = "10.206.0.84";
        identityFile = "~/.ssh/oci_rsa_resource";
        proxyCommand = "nc -X 5 -x 192.168.122.100:1080 %h %p";
      };
      "rnn-sup-sre-automations-prod" = {
        user = "sre_automations";
        hostname = "10.34.129.30";
        identityFile = "~/.ssh/id_rsa_sis_sre_automations";
        proxyCommand = "nc -X 5 -x 192.168.122.100:1080 %h %p";
      };
    };
  };
}
