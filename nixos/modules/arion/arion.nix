{ pkgs, config, ... }:

{
  virtualisation.arion = {
    backend = "docker";
    projects = {
      portainer.settings = {
        imports = [ ./portainer/portainer.nix ];
      };

      streaming.settings = {
        imports = [ ./streaming/streaming.nix ];
      };
      
      traefik.settings = {
        imports = [ ./traefik/traefik.nix ];
        _module.args.traefikEnvFile = config.sops.templates."traefik-cloudflare.env".path;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    arion
  ];
}
