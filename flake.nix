{
  description = "Prometheus exporter for Awair air quality devices";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in {
      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in {
          default = pkgs.buildGoModule {
            pname = "awair-exporter";
            version = "0.1.0";
            src = ./.;
            vendorHash = "sha256-+AwO2V5dD1xZlck/3ge53OWXlc/JjDqIkgIwPJX+4EM=";
          };
        }
      );
    };
}
