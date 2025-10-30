{ pkgs }:

pkgs.teams-for-linux.override {
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
}
