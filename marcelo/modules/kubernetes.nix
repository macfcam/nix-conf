{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    azure-cli
    kind
    kubectl
    kubectx
    kubernetes-helm
    minikube
    oci-cli
    velero
  ];
}
