{ ... }:

{
  services = {
    qbittorrent = {
      service = {
        image = "linuxserver/qbittorrent:latest";
        container_name = "qbittorrent";
        restart = "on-failure:3";
        healthcheck = {
          test = [ "CMD" "curl" "-fsS" "http://127.0.0.1:8080/api/v2/app/version" "https://icanhazip.com"];
          interval = "5s";
          timeout = "5s";
          start_period = "30s";
          retries = 5;
        };

        environment = {
          "GUID" = "0";
          "PUID" = "0";
          "TZ" = "America/Sao_Paulo";
          "WEBUI_PORT" = "8080";
        };

        volumes = [
          "qbittorrent_config:/config"
          "/mnt/myexternaldisk/streaming/media:/data/media"
        ];

        networks = [ "proxy" ];

        labels = {
          "traefik.enable" = "true";
          "traefik.http.routers.qbittorrent.rule" = "Host(`qbittorrent-sc.mapeus.xyz`)";
          "traefik.http.routers.qbittorrent.entrypoints" = "websecure";
          "traefik.http.routers.qbittorrent.tls" = "true";
          "traefik.http.services.qbittorrent.loadbalancer.server.port" = "8080";
        };
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
      qbittorrent_config = { };
    };
  };
}
