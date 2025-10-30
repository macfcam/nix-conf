# nixos/modules/fonts.nix
{ ... }:

{
  # Network related settings
  networking = {
    hostName = "starscream";
    networkmanager = {
      enable = true;
    };
    # extraHosts = ''
    #   # AKS private clusters
    #   10.33.0.10            rnn-new-omni-kubernetes-dev-v8z8h6o4.privatelink.eastus.azmk8s.io
    #   10.34.0.10            rnn-sup-kubernetes-nonprod-fesad9t9.privatelink.eastus.azmk8s.io
    #   10.34.128.100         rnn-sup-kubernetes-prod-x2b7b1bp.privatelink.brazilsouth.azmk8s.io
    #   10.35.0.99            rnn-new-omni-kubernetes-prod-izplsxyy.privatelink.brazilsouth.azmk8s.io
    #   10.38.0.10            rnn-log-lyt-kubernetes-dev-89dqigjy.privatelink.eastus.azmk8s.io
    #   10.38.128.10          rnn-log-lyt-kubernetes-hml-m15eu6h5.privatelink.eastus.azmk8s.io
    #   10.39.0.4             rnn-log-lyt-kubernetes-prod-u5uoopb1.privatelink.brazilsouth.azmk8s.io

    #   # Custom entries
    #   10.206.10.93          gitlab-corp.lojasrenner.io
    #   10.34.0.121           n8n-sre-nonprod.lojasrenner.io
    #   10.34.128.121         grafana-azure-prod.lojasrenner.io
    #   10.34.0.121           percona-pmm-azure-nonprod.lojasrenner.io
    #   10.34.0.121           elasticsearch-azure-nonprod.lojasrenner.io
    #   10.34.128.121         elasticsearch-azure-prod.lojasrenner.io
    #   10.34.128.121         sonarqube-omni.lojasrenner.io
    #   10.34.128.121         rancher-azure-prod.lojasrenner.io
    # '';
  };
}
