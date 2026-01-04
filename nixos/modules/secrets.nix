{ config, ... }:

{
  # Point to your secrets file
  sops = {
    defaultSopsFile = ../../secrets/marcelo.yaml;
    defaultSopsFormat = "yaml";

    # Age key location
    age = {
      keyFile = "/home/marcelo/.config/sops/age/keys.txt";
      generateKey = false; # We're using existing SSH-derived key
    };

    # Define secrets that should be available system-wide
    secrets = {
      cloudflare_api_token = { };
    };

    # Create an env file for Traefik with the Cloudflare token
    templates."traefik-cloudflare.env" = {
      content = ''
        ${config.sops.placeholder.cloudflare_api_token}
      '';
    };
  };
}
