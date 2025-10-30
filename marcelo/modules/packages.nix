{
  pkgs,
  ...
}:

let
  teams-for-linux-2_6_6 = pkgs.teams-for-linux.override {
    buildNpmPackage =
      args:
      pkgs.buildNpmPackage (
        args
        // rec {
          pname = "teams-for-linux";
          version = "2.6.6";

          src = pkgs.fetchFromGitHub {
            owner = "IsmaelMartinez";
            repo = "teams-for-linux";
            tag = "v${version}";
            hash = "sha256-Vf3Fz96kZIASjWeSUGVPKVrn7RBG0PPhFqIz8GOI8K4=";
          };

          npmDepsHash = "sha256-HfBSlfa5FzoBlRTIR7ayUs4FwFJisbfLVKbFhf+K218=";
        }
      );
  };

in
{
  home.packages =
    with pkgs;
    [
      age
      ansible
      arch-install-scripts
      aria2
      azure-cli
      chromium
      code-cursor
      cdrtools
      docker-compose
      eza
      git
      htop
      jq
      kind
      kitty
      kubectl
      kubectx
      kubernetes-helm
      libxslt
      mcfly
      neofetch
      nil
      nixd
      oci-cli
      pciutils
      pyenv
      quickemu
      remmina
      resources
      sops
      ssh-to-age
      spotify
      telegram-desktop
      terraform
      terragrunt
      velero
      virt-manager
      wget
      wl-clipboard
    ]
    ++ [
      teams-for-linux-2_6_6
    ];
}
