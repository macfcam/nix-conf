{ pkgs, config, ... }:

let
  # Create a derivation containing Traefik config files.
  # This ensures the store path is properly tracked and won't be garbage collected.
  traefikConfigDir = pkgs.runCommand "traefik-config" { } ''
    mkdir -p $out
    cp ${./traefik/config/traefik.toml} $out/traefik.toml
    cp ${./traefik/config/dynamic.toml} $out/dynamic.toml
  '';
in

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
        _module.args.traefikConfigDir = traefikConfigDir;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    arion
  ];
}
