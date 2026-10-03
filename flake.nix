{
  description = "Frontend development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            nodejs_24
            corepack_24 # Включает yarn и pnpm для Node 24

            # Дополнительные полезные инструменты для фронтенда (раскомментируйте при необходимости):
            # git
            # watchman
          ];

          shellHook = ''
            echo "⚡ Frontend devshell (Node.js $(node --version))"
          '';
        };
      });
}
