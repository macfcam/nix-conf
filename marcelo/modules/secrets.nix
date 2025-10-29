{ config, ... }:

{
  sops = {
    defaultSopsFile = ../../secrets/marcelo.yaml;
    defaultSopsFormat = "yaml";

    age = {
      keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    };

    # Define secrets for home-manager
    secrets = {
      # SSH keys
      "ssh_id_ed25519" = {
        path = "${config.home.homeDirectory}/.ssh/id_ed25519";
        mode = "0600";
      };
    };
  };
}
