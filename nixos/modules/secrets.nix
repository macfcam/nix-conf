{ ... }:

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
      # Example: proxy credentials (if needed)
      # proxy_username = {
      #   owner = "marcelo";
      # };
      # proxy_password = {
      #   owner = "marcelo";
      # };
    };
  };
}
