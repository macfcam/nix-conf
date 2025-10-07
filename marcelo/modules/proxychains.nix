{ config, pkgs, ... }:

{
  # Install proxychains-ng via Home Manager
  home.packages = with pkgs; [ proxychains-ng ];

  # Create user-level config file for proxychains-ng
  home.file.".proxychains/proxychains.conf".text = ''
    # ProxyChains-NG configuration file

    # Dynamic chain is more reliable (skips dead proxies)
    dynamic_chain

    # Let proxychains resolve DNS through the proxy
    proxy_dns

    # Quiet mode for cleaner output
    quiet_mode

    # Proxy list format: type host port [user pass]
    [ProxyList]
    socks5  192.168.122.100 1080
  '';

  # Optional alias for convenience
  # programs.bash.shellAliases = {
  #   proxychains = "proxychains4";
  # };

  # For zsh or fish, adjust accordingly:
  # programs.zsh.shellAliases.proxychains = "proxychains4";
  # programs.fish.shellAliases.proxychains = "proxychains4";
}
