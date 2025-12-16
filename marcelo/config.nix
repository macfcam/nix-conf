# Centralized configuration

{
  # Centralized proxy configuration
  proxy = {
    host = "192.168.122.100";
    port = 1080;

    # Full SOCKS5 URL for applications that need it
    socks5Url = "socks5h://192.168.122.100:1080";

    # Host:Port format for nc and similar tools
    hostPort = "192.168.122.100:1080";

    # No proxy domains
    noProxy = "localhost,127.0.0.1,0.0.0.0,mapeus.xyz";
  };
}
