{ traefikEnvFile, ... }:

let
  configDir = toString ./.;
in

{
  services = {
    traefik = {
      service = {
        image = "traefik:v3.6.5";
        container_name = "traefik";
        restart = "unless-stopped";
        environment = {
          TZ = "America/Sao_Paulo";
        };

        env_file = [
          traefikEnvFile
        ];

        ports = [
          "80:80"
          "443:443"
          "8080:8080"
        ];

        volumes = [
          "${configDir}/config:/etc/traefik:ro"
          "/var/run/docker.sock:/var/run/docker.sock:ro"
          "certs:/certs"
        ];

        networks = [ "proxy" ];
      };
    };
  };

  networks = {
    proxy = {
      name = "proxy";
    };
  };

  docker-compose = {
    volumes = {
      certs = { };
    };
  };
}
